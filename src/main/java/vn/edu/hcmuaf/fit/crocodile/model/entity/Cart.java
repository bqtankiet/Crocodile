package vn.edu.hcmuaf.fit.crocodile.model.entity;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Cart {
    private Map<Integer, CartItem> items;

    public Cart() {
        items = new HashMap<>();
    }

    // Thêm hoặc cập nhật sản phẩm trong giỏ hàng cùng với các tùy chọn
    public int addProduct(Product product, int quantity, List<Product.ProductOption> options) {
        if (items.containsKey(product.getId())) {
            CartItem cartItem = items.get(product.getId());
            cartItem.setQuantity(cartItem.getQuantity() + quantity);
        }

        items.put(product.getId(), new CartItem(product, quantity, options));
        return 10000;
    }

    public void removeProduct(int productId) {
        items.remove(productId);
    }

    public void updateQuantity(int productId, int quantity) {
        if (items.containsKey(productId)) {
            CartItem cartItem = items.get(productId);
            cartItem.setQuantity(quantity);
        }
    }

    public List<CartItem> getItem() {
        return new ArrayList<>(items.values());
    }

    public int getTotal() {
        int total = 0;
        for (CartItem item : items.values()) {
            total += item.getTotalPrice();
        }
        return total;
    }

    public int getSize(){ return items.size(); }

}
