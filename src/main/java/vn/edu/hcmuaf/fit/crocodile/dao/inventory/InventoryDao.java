package vn.edu.hcmuaf.fit.crocodile.dao.inventory;

import vn.edu.hcmuaf.fit.crocodile.config.JdbiConnect;
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
                         FROM inventory_history h
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
}
