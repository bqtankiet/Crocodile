package vn.edu.hcmuaf.fit.crocodile.model.cart;

import vn.edu.hcmuaf.fit.crocodile.model.entity.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class Cart {
    private final HashMap<Integer, CartItem> items;

    public Cart() {
        this.items = new HashMap<>();
    }

    /**
     * Nhận vào 1 CartItem và trả về số lượng sản phẩm thực sự đã thêm vào giỏ hàng
     * (VD số lượng thêm vào nhiều hơn số lượng có trong kho -> chỉ thêm vào tối đa số lượng có trong kho)
     * @param item CartItem
     * @return số lượng sản phẩm thực sự thêm vào giỏ
     */
    public int addItem(CartItem item) {
        Product.ProductVariant pv = item.getProductVariant();
        if(items.containsKey(pv.getId())) {
            int newQuantity = items.get(pv.getId()).getQuantity() + item.getQuantity();
            return updateItemQuantity(pv.getId(), newQuantity);
        } else {
            items.put(pv.getId(), item);
            return item.getQuantity();
        }
    }

    /**
     * @return Trả về danh sách CartItem trong giỏ hàng
     */
    public List<CartItem> getItems(){
        return items.values().stream().toList();
    }

    public HashMap<Integer, CartItem> getItemsMap() {
        return items;
    }

    /**
     * Nhận vào idVariant và quantity, nếu có item trong giỏ hàng thì cập nhật số lượng và trả về
     * số lượng đã thêm vào, nếu không thì trả về 0
     * @param idVariant id của product variant
     * @param quantity số lượng sản phẩm
     * @return trả về số lượng có thể cập nhật, trả về 0 nếu item ko tồn tại trong giỏ hàng.
     */
    public int updateItemQuantity(int idVariant, int quantity) {
        CartItem item = items.get(idVariant);
        if (item == null) {
            return 0;
        } else {
            // TODO: Chưa xử lý nếu quantity > sl trong kho
            item.setQuantity(quantity);
            return quantity;
        }

    }

    public int removeItem(int idVariant){
        CartItem item = items.remove(idVariant);
        if(item == null) return 0;
        return item.getQuantity();
    }

    public void clear() {
        items.clear();
    }

    /**
     * Trả về tổng số lượng sản phẩm có trong giỏ hàng (bao gồm quantity của các sản phẩm cùng loại)
     * @return tổng số lượng sản phẩm
     */
    public int getTotalQuantity(){
        int total = 0;
        for(CartItem item : items.values()) {
            total += item.getQuantity();
        }
        return total;
    }

    /**
     * Trả về tổng giá trị của giỏ hàng
     * @return tổng giá trị giỏ hàng
     */
    public int getTotalPrice(){
        int total = 0;
        for(CartItem item : items.values()) {
            total += item.caculatePrice();
        }
        return total;
    }

    public int getSize() { return items.size(); }

    public boolean containItem(int productVariantId) {
        return items.containsKey(productVariantId);
    }
}
