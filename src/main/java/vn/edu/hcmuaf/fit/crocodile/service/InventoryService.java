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

    public boolean variantIsExists(int idVariant) { return inventoryDao.variantIsExists(idVariant); }

    public boolean supplierIsExists(Integer idSupplier) { return inventoryDao.supplierIsExists(idSupplier); }
}
