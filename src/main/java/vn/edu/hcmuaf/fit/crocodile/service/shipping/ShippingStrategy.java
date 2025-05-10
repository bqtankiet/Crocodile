package vn.edu.hcmuaf.fit.crocodile.service.shipping;

import java.util.Map;

public interface ShippingStrategy {
    int getShippingFee(Map<String, Object> data);
}