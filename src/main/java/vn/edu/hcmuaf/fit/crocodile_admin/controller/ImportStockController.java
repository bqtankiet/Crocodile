package vn.edu.hcmuaf.fit.crocodile_admin.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Inventory;
import vn.edu.hcmuaf.fit.crocodile.service.InventoryService;
import vn.edu.hcmuaf.fit.crocodile.service.OrderService;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

@WebServlet(name = "ImportStockController", value = "/admin/warehouse-management/import")
@MultipartConfig
public class ImportStockController extends HttpServlet {
    OrderService orderService = new OrderService();
    InventoryService inventoryService = new InventoryService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try{
            Part filePart = request.getPart("excelFile");
            if (filePart == null || filePart.getSize() == 0) {
                request.setAttribute("error", "Please upload a valid Excel file.");
                request.getRequestDispatcher("/admin/views/inventory-management.jsp").forward(request, response);
                return;
            }

            List<Inventory.ImportItem> importItems = new ArrayList<>();

            try (InputStream fileStream = filePart.getInputStream();
                 Workbook workbook = new XSSFWorkbook(fileStream))
            {
                Sheet sheet = workbook.getSheetAt(0);
                Iterator<Row> rowIterator = sheet.iterator();

                if (!rowIterator.hasNext()) {
                    throw new IllegalArgumentException("Excel file is empty.");
                }

                Row headerRow = rowIterator.next();
                Map<String, Integer> columnMap = new HashMap<>();
                for (Cell cell : headerRow) {
                    columnMap.put(cell.getStringCellValue().trim(), cell.getColumnIndex());
                }

                while (rowIterator.hasNext()) {
                    Row row = rowIterator.next();
                    Inventory.ImportItem item = new Inventory.ImportItem();

                    // idVariant
                    Cell idVariantCell = getCellByColumnName(row, columnMap, "idVariant");
                    if (idVariantCell == null || idVariantCell.getCellType() != CellType.NUMERIC) {
                        throw new IllegalArgumentException("Invalid idVariant at row " + (row.getRowNum() + 1));
                    }
                    item.setIdVariant((int) idVariantCell.getNumericCellValue());

                    // quantity
                    Cell quantityCell = getCellByColumnName(row, columnMap, "quantity");
                    if (quantityCell == null || quantityCell.getCellType() != CellType.NUMERIC || quantityCell.getNumericCellValue() <= 0) {
                        throw new IllegalArgumentException("Invalid quantity at row " + (row.getRowNum() + 1));
                    }
                    item.setQuantity((int) quantityCell.getNumericCellValue());

                    // idSupplier (co the null)
                    Cell idSupplierCell = getCellByColumnName(row, columnMap, "idSupplier");
                    if (idSupplierCell != null && idSupplierCell.getCellType() == CellType.NUMERIC) {
                        item.setIdSupplier((int) idSupplierCell.getNumericCellValue());
                    } else {
                        item.setIdSupplier(null);
                    }

                    // note (co the null)
                    Cell noteCell = getCellByColumnName(row, columnMap, "note");
                    if (noteCell != null && noteCell.getCellType() == CellType.STRING) {
                        item.setNote(noteCell.getStringCellValue());
                    } else {
                        item.setNote(null);
                    }

                    importItems.add(item);
                }

                for (Inventory.ImportItem item : importItems) {
                    inventoryService.importStock(item);
                    System.out.println("nhap thanh cong");
                }

                request.setAttribute("success", "Successfully imported " + importItems.size() + " items into stock.");
                request.getRequestDispatcher("/admin/views/warehouse-management.jsp").forward(request, response);
            }
            catch (IllegalArgumentException e) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.setContentType("text/plain; charset=UTF-8");
                response.getWriter().write(e.getMessage());
                request.getRequestDispatcher("/admin/views/warehouse-management.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error processing the Excel file: " + e.getMessage());
            request.getRequestDispatcher("/admin/views/warehouse-management.jsp").forward(request, response);
        }

    }

    private Cell getCellByColumnName(Row row, Map<String, Integer> columnMap, String columnName) {
        Integer index = columnMap.get(columnName);
        if (index == null) {
            throw new IllegalArgumentException("Column '" + columnName + "' not found in Excel header.");
        }
        return row.getCell(index);
    }
}
