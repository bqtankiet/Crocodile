package vn.edu.hcmuaf.fit.crocodile.dao.inventory;

import vn.edu.hcmuaf.fit.crocodile.config.JdbiConnect;
import vn.edu.hcmuaf.fit.crocodile.model.entity.EnumType;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Inventory;

import java.util.List;

public class InventoryDao implements IInventoryDao{

    @Override
    public List<Inventory> getAllInventory() {
        String sql = """
                    SELECT
                        v.id,
                        p.name AS productName,
                        v.sku,
                        c.name AS categoryName,
                        v.stock,
                        p.price,
                        v.stock * p.price AS totalAmount,
                        s.name AS supplierName,
                        (SELECT h.changeDate
                         FROM inventory_histories h
                         WHERE h.idVariant = v.id AND h.changeType = 'IMPORT'\s
                         ORDER BY h.changeDate DESC
                         LIMIT 1) AS lastImportDate
                    FROM products p
                    JOIN product_variants v ON p.id = v.idProduct
                    JOIN categories c ON c.id = p.idCategory
                    LEFT JOIN suppliers s ON s.id = v.idSupplier
                    WHERE p.active = 1;
                """;
        return JdbiConnect.getJdbi().withHandle(handle ->
                    handle.createQuery(sql)
                            .mapToBean(Inventory.class)
                            .list()
        );
    }

    @Override
    public List<Inventory.InventoryHistoryItem> getInventoryHistory() {
        String sql = """
            SELECT 
                h.id,
                p.name AS productName,
                h.quantityChange,
                h.changeDate,
                s.name AS supplierName,
                h.changeType
            FROM inventory_histories h
            JOIN product_variants v ON h.idVariant = v.id
            JOIN products p ON v.idProduct = p.id
            LEFT JOIN suppliers s ON h.idSupplier = s.id
            WHERE p.active = 1
            ORDER BY h.changeDate DESC
            """;
        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .mapToBean(Inventory.InventoryHistoryItem.class)
                        .list()
        );
    }


    @Override
    public void importStock(Inventory.ImportItem item) {
        JdbiConnect.getJdbi().useTransaction(handle -> {
            String historySql = """
                    INSERT INTO inventory_histories (idVariant, quantityChange, changeType, idSupplier, note)
                    VALUES (:idVariant, :quantityChange, :changeType, :idSupplier, :note)
                """;
            handle.createUpdate(historySql)
                    .bind("idVariant", item.getIdVariant())
                    .bind("quantityChange", item.getQuantity()) // Dương vì nhập kho
                    .bind("changeType", EnumType.IMPORT)
                    .bind("idSupplier", item.getIdSupplier())
                    .bind("note", item.getNote() != null ? item.getNote() : "Nhập qua Excel")
                    .execute();

            // update stock
            String stockSql = "UPDATE product_variants SET stock = stock + :quantity WHERE id = :idVariant";
            int updatedRows = handle.createUpdate(stockSql)
                    .bind("quantity", item.getQuantity())
                    .bind("idVariant", item.getIdVariant())
                    .execute();
            if (updatedRows == 0) {
                throw new RuntimeException("Failed to update stock for variant: " + item.getIdVariant());
            }
        });
    }

    @Override
    public boolean checkAvailableInventory(int variantId, int quantity) {
        String query = "SELECT stock FROM product_variants WHERE id = :idVariant";
        int stock = JdbiConnect.getJdbi().withHandle(handle -> handle
                .createQuery(query)
                .bind("idVariant", variantId)
                .mapTo(Integer.class)
                .findFirst()
                .orElse(0)
        );
        return stock >= quantity;
    }
}
