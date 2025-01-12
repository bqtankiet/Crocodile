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
    public int addProduct(int idVariant, Product product, int quantity, Product.ProductOption pOption1, Product.ProductOption pOption2) {
        if (product == null || quantity == 0) return -1;

        if (items.containsKey(idVariant)) {
            CartItem cartItem = items.get(idVariant);
            cartItem.setQuantity(cartItem.getQuantity() + quantity);
            return 2;
        }

        items.put(idVariant, new CartItem(product, quantity, pOption1, pOption2));
        return 1;
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
            total += item.getTotalPriceItem();
        }
        return total;
    }

    public int getSize(){ return items.size(); }

}
