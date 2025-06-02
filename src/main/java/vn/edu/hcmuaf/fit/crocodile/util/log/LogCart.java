package vn.edu.hcmuaf.fit.crocodile.util.log;

public class LogCart extends LogBase {
    public static final String CATEGORY = "Cart";
    public static final String GUEST_ID = "-1";
    public static final String GUEST_NAME = "Guest";

    public LogCart() {
        super(LogCart.class, CATEGORY);
    }

    public void logAddToCart(String userId, String userName, String ip, String productId, int quantity) {
        String message = "Added product [" + productId + "] to cart with quantity: " + quantity;
        log(userId, userName, ip, message, LogBase.INFO);
    }

    public void logRemoveFromCart(String userId, String userName, String ip, String productId) {
        String message = "Removed product [" + productId + "] from cart";
        log(userId, userName, ip, message, LogBase.INFO);
    }

    public void logUpdateQuantity(String userId, String userName, String ip, String productId, int oldQuantity, int newQuantity) {
        String message = "Updated product [" + productId + "] quantity from " + oldQuantity + " to " + newQuantity;
        log(userId, userName, ip, message, LogBase.INFO);
    }

    public void logClearCart(String userId, String userName, String ip) {
        String message = "Cleared all items from cart";
        log(userId, userName, ip, message, LogBase.WARN); // WARN vì đây là hành động ảnh hưởng lớn
    }

    public void logGuestAddToCart(String ip, String productId, int quantity) {
        String message = "Guest added product [" + productId + "] to cart with quantity: " + quantity;
        log(GUEST_ID, GUEST_NAME, ip, message, LogBase.INFO);
    }
}
