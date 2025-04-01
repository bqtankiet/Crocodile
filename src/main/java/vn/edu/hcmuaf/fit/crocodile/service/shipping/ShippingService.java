package vn.edu.hcmuaf.fit.crocodile.service.shipping;


import java.util.Map;

public class ShippingService {
    // strategy
    private ShippingStrategy shippingStrategy;

    public ShippingService () {}

    public ShippingService(ShippingStrategy shippingStrategy) {
        this.shippingStrategy = shippingStrategy;
    }

    public void setShippingStrategy(ShippingStrategy shippingStrategy) {
        this.shippingStrategy = shippingStrategy;
    }

    public int getShippingFee(Map<String, Object> data) {
        return shippingStrategy.getShippingFee(data);
    }
}
