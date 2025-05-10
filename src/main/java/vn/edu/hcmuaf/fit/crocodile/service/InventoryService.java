package vn.edu.hcmuaf.fit.crocodile.service;

import vn.edu.hcmuaf.fit.crocodile.dao.inventory.InventoryDao;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Inventory;

import java.util.List;

public class InventoryService {
    InventoryDao inventoryDao;

    public InventoryService() {
        this.inventoryDao = new InventoryDao();
    }

    public List<Inventory> getAllInventory() {
        return inventoryDao.getAllInventory();
    }

    public List<Inventory.InventoryHistoryItem> getInventoryHistory() { return inventoryDao.getInventoryHistory(); }

    public void importStock(Inventory.ImportItem item) { this.inventoryDao.importStock(item); }

    public boolean checkAvailableInventory(int idVariant, int quantity){
        return inventoryDao.checkAvailableInventory(idVariant, quantity);
    }
}
