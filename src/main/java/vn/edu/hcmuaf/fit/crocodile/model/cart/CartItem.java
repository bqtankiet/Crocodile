package vn.edu.hcmuaf.fit.crocodile.model.cart;

import vn.edu.hcmuaf.fit.crocodile.model.entity.Product;

import java.io.Serializable;

public class CartItem implements Serializable {
    private Product.ProductVariant productVariant;
    private int quantity;
    private boolean checked;

    public CartItem(Product.ProductVariant productVariant, int quantity) {
        this.productVariant = productVariant;
        this.quantity = quantity;
    }

    /**
     * Tính toán tổng giá trị của một item = price * quantity
     * @return tổng tiền của item
     */
    public int caculatePrice(){
        return productVariant.getProduct().getPrice()*quantity;
    }

    // getter, setter

    public boolean isChecked() {
        return checked;
    }

    public void setChecked(boolean checked) {
        this.checked = checked;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Product.ProductVariant getProductVariant() {
        return productVariant;
    }

    public void setProductVariant(Product.ProductVariant productVariant) {
        this.productVariant = productVariant;
    }
}
