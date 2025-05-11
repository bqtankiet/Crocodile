package vn.edu.hcmuaf.fit.crocodile.model.order;

import java.io.Serializable;

public class OrderItem implements Serializable {

    private int variantId;
    private int quantity;
    private int unitPrice;
    private String productName;
    private String variantOption;
    private String productImage;

    @Override
    public String toString() {
        return "OrderItem{" +
                "variantId=" + variantId +
                ", quantity=" + quantity +
                ", unitPrice=" + unitPrice +
                ", productName='" + productName + '\'' +
                ", variantOption='" + variantOption + '\'' +
                ", productImage='" + productImage + '\'' +
                '}';
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    public int getVariantId() {
        return variantId;
    }

    public void setVariantId(int variantId) {
        this.variantId = variantId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(int unitPrice) {
        this.unitPrice = unitPrice;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getVariantOption() {
        return variantOption;
    }

    public void setVariantOption(String variantOption) {
        this.variantOption = variantOption;
    }

    public int getTotal() {
        return quantity * unitPrice;
    }
}
