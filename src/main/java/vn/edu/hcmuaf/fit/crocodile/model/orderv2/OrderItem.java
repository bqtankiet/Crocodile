package vn.edu.hcmuaf.fit.crocodile.model.orderv2;

import java.io.Serializable;

public class OrderItem implements Serializable {

    private int variantId;
    private String variantName;
    private String variantOption;
    private int quantity;
    private int price;

    public int getVariantId() {
        return variantId;
    }

    public void setVariantId(int variantId) {
        this.variantId = variantId;
    }

    public String getVariantOption() {
        return variantOption;
    }

    public void setVariantOption(String variantOption) {
        this.variantOption = variantOption;
    }

    public String getVariantName() {
        return variantName;
    }

    public void setVariantName(String variantName) {
        this.variantName = variantName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
}
