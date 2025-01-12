package vn.edu.hcmuaf.fit.crocodile.model.entity;

import java.io.Serializable;
import java.util.List;

public class CartItem implements Serializable {
    private Product product;
//    private String productVariant;
    private int quantity;

    private List<Product.ProductOption> options;

    public CartItem(Product product, int quantity, List<Product.ProductOption> options) {
        this.product = product;
        this.quantity = quantity;
        this.options = options;
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

    public List<Product.ProductOption> getOptions() {
        return options;
    }

    public void setOptions(List<Product.ProductOption> options) {
        this.options = options;
    }

    // Tính tổng tiền của item
    public int getTotalPrice() {
        return product.getPrice() * quantity;
    }
}



