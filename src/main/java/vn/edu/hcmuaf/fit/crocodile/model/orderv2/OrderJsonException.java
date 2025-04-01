package vn.edu.hcmuaf.fit.crocodile.model.orderv2;

public class OrderJsonException extends Exception{

    private String message;
    public OrderJsonException(String message) {
        super(message);
    }
}
