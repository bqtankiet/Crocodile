package vn.edu.hcmuaf.fit.crocodile.dao.inventory;

import vn.edu.hcmuaf.fit.crocodile.model.entity.Inventory;

import java.util.List;

public interface IInventoryDao {

    List<Inventory> getAllInventory();

    void importStock(Inventory.ImportItem item);
}
