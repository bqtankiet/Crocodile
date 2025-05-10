package vn.edu.hcmuaf.fit.crocodile.dao.inventory;

import vn.edu.hcmuaf.fit.crocodile.model.entity.Inventory;

import java.util.List;

public interface IInventoryDao {

    List<Inventory> getAllInventory();

    List<Inventory.InventoryHistoryItem> getInventoryHistory();

    void importStock(Inventory.ImportItem item);

    boolean checkAvailableInventory(int variantId, int quantity);
}
