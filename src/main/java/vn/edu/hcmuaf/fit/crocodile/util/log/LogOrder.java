package vn.edu.hcmuaf.fit.crocodile.util.log;

public class LogOrder extends LogBase{

    public static String CATEGORY = "Order";

    public LogOrder() {
        super(LogOrder.class, CATEGORY);
    }

    public void logSuccess(String userId, String userName, String ip, String paymentMethod, String totalAmount) {
        String message = "Created order successfully with method "+paymentMethod +" and total amount "+totalAmount;
        log(userId, userName, ip, message, LogBase.INFO);
    }

}
