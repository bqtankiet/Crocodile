package vn.edu.hcmuaf.fit.crocodile.model.entity;

import java.io.Serializable;
import java.time.LocalDateTime;

public class OrderInfo implements Serializable {
    private int id;
    private int idProduct;
    private String productName;
    private String productImage;
    private double productPrice;
    private int quantity;
    private int idVariant;
    private String option1Value;
    private String option2Value;
    private double total;
    private LocalDateTime invoiceDate;
    private Status status;

    public OrderInfo() {}

    @Override
    public String toString() {
        return "OrderInfo{" +
                "id=" + id +
                ", productName='" + productName + '\'' +
                ", productImage='" + productImage + '\'' +
                ", productPrice=" + productPrice +
                ", quantity=" + quantity +
                ", idProduct=" + idProduct +
                ", idVariant=" + idVariant +
                ", option1Value='" + option1Value + '\'' +
                ", option2Value='" + option2Value + '\'' +
                ", total=" + total +
                ", invoiceDate=" + invoiceDate +
                ", status=" + status +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdProduct() { return idProduct; }

    public void setIdProduct(int idProduct) { this.idProduct = idProduct; }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getIdVariant() {
        return idVariant;
    }

    public void setIdVariant(int idVariant) {
        this.idVariant = idVariant;
    }

    public String getOption1Value() {
        return option1Value;
    }

    public void setOption1Value(String option1Value) {
        this.option1Value = option1Value;
    }

    public String getOption2Value() {
        return option2Value;
    }

    public void setOption2Value(String option2Value) {
        this.option2Value = option2Value;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public LocalDateTime getInvoiceDate() {
        return invoiceDate;
    }

    public void setInvoiceDate(LocalDateTime invoiceDate) {
        this.invoiceDate = invoiceDate;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }
}
