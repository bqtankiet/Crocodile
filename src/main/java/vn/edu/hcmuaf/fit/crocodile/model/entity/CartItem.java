package vn.edu.hcmuaf.fit.crocodile.model.entity;

import java.io.Serializable;
import java.util.List;

public class CartItem implements Serializable {
    private Product product;
    private int quantity;
    private Product.ProductOption pOption1;
    private Product.ProductOption pOption2;

    public CartItem(Product product, int quantity, Product.ProductOption pOption1, Product.ProductOption pOption2) {
        this.product = product;
        this.quantity = quantity;
        this.pOption1 = pOption1;
        this.pOption2 = pOption2;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Product.ProductOption getpOption1() { return pOption1; }

    public void setpOption1(Product.ProductOption pOption1) { this.pOption1 = pOption1; }

    public Product.ProductOption getpOption2() { return pOption2; }

    public void setpOption2(Product.ProductOption pOption2) { this.pOption2 = pOption2; }

    // Tính tổng tiền của item
    public int getTotalPriceItem() {
        return product.getPrice() * quantity;
    }
}



