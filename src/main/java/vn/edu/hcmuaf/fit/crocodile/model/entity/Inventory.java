package vn.edu.hcmuaf.fit.crocodile.model.entity;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;

public class Inventory implements Serializable {
    private int id;
    private String productName;
    private String sku;
    private String categoryName;
    private int stock;
    private double price;
    private double totalAmount;
    private String supplierName;
    private String lastImportDate;
    private String note;

    @Override
    public String toString() {
        return "Inventory{" +
                "lastImportDate=" + lastImportDate +
                ", supplierName='" + supplierName + '\'' +
                ", totalAmount=" + totalAmount +
                ", price=" + price +
                ", stock=" + stock +
                ", categoryName='" + categoryName + '\'' +
                ", sku='" + sku + '\'' +
                ", productName='" + productName + '\'' +
                ", id=" + id +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getSku() {
        return sku;
    }

    public void setSku(String sku) {
        this.sku = sku;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getSupplierName() {
        return supplierName;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }

    public String getLastImportDate() {
        return lastImportDate;
    }

    public void setLastImportDate(String lastImportDate) {
        this.lastImportDate = lastImportDate;
    }

    public String getNote() { return note; }

    public void setNote(String note) { this.note = note; }
}
