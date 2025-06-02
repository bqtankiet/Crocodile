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
        HttpSession session = request.getSession();

        try {
            Part filePart = request.getPart("excelFile");
            if (filePart == null || filePart.getSize() == 0) {
                session.setAttribute("error", "Vui lòng tải lên một tệp Excel hợp lệ.");
                response.sendRedirect(request.getContextPath() + "/admin/warehouse-management");
                return;
            }

            List<Inventory.ImportItem> importItems = new ArrayList<>();

            try (InputStream fileStream = filePart.getInputStream();
                 Workbook workbook = new XSSFWorkbook(fileStream)) {
                Sheet sheet = workbook.getSheetAt(0);
                Iterator<Row> rowIterator = sheet.iterator();

                if (!rowIterator.hasNext()) {
                    throw new IllegalArgumentException("Tệp Excel rỗng.");
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
                    Cell idVariantCell = getCellByColumnName(row, columnMap, "ma san pham");
                    if (idVariantCell == null || idVariantCell.getCellType() != CellType.NUMERIC) {
                        throw new IllegalArgumentException("idVariant không hợp lệ ở dòng " + (row.getRowNum() + 1));
                    }
                    item.setIdVariant((int) idVariantCell.getNumericCellValue());

                    // quantity
                    Cell quantityCell = getCellByColumnName(row, columnMap, "so luong");
                    if (quantityCell == null || quantityCell.getCellType() != CellType.NUMERIC || quantityCell.getNumericCellValue() <= 0) {
                        throw new IllegalArgumentException("quantity không hợp lệ ở dòng " + (row.getRowNum() + 1));
                    }
                    item.setQuantity((int) quantityCell.getNumericCellValue());

                    // idSupplier (có thể null)
                    Cell idSupplierCell = getCellByColumnName(row, columnMap, "ma nha cung cap");
                    if (idSupplierCell != null && idSupplierCell.getCellType() == CellType.NUMERIC) {
                        item.setIdSupplier((int) idSupplierCell.getNumericCellValue());
                    } else {
                        item.setIdSupplier(null);
                    }

                    // note (có thể null)
                    Cell noteCell = getCellByColumnName(row, columnMap, "ghi chu");
                    if (noteCell != null && noteCell.getCellType() == CellType.STRING) {
                        item.setNote(noteCell.getStringCellValue());
                    } else {
                        item.setNote(null);
                    }

                    importItems.add(item);
                }

                for (Inventory.ImportItem item : importItems) {
                    inventoryService.importStock(item);
                }

                session.setAttribute("success", "Nhập kho thành công " + importItems.size() + " sản phẩm.");
                response.sendRedirect(request.getContextPath() + "/admin/warehouse-management");
            } catch (IllegalArgumentException e) {
                session.setAttribute("error", e.getMessage());
                response.sendRedirect(request.getContextPath() + "/admin/warehouse-management");
            }

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Có lỗi xảy ra khi xử lý file Excel.");
            response.sendRedirect(request.getContextPath() + "/admin/warehouse-management");
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
