package vn.edu.hcmuaf.fit.crocodile.service.shipping;

import java.util.Map;

public class ShippingStrategyViettelPost implements ShippingStrategy{

    @Override
    public int getShippingFee(Map<String, Object> data) {
        return 0;
    }
}
