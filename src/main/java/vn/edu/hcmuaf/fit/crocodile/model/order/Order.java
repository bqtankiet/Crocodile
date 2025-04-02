package vn.edu.hcmuaf.fit.crocodile.model.order;

import vn.edu.hcmuaf.fit.crocodile.service.shipping.ShippingService;
import vn.edu.hcmuaf.fit.crocodile.service.shipping.ShippingStrategyGHN;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Order implements Serializable {

    private ShippingAddress address;
    private List<OrderItem> items;

    public int getTotal(){
        return getItemsTotal()+getShippingFee();
    }

    public int getShippingFee(){
        ShippingService shippingService = new ShippingService(new ShippingStrategyGHN());
        Map<String, Object> params = new HashMap<>();
        params.put(ShippingStrategyGHN.KEY_TO_DISTRICT_ID, address.getDistrictId());
        params.put(ShippingStrategyGHN.KEY_TO_WARD_CODE, address.getWardCode());
        // TODO: Lười quá, để tạm hardcode vầy đi
        params.put(ShippingStrategyGHN.KEY_WIDTH, 20);
        params.put(ShippingStrategyGHN.KEY_HEIGHT, 20);
        params.put(ShippingStrategyGHN.KEY_LENGTH, 20);
        params.put(ShippingStrategyGHN.KEY_WEIGHT, 1000);
        int fee = shippingService.getShippingFee(params);
        System.out.println("ShippingFee");
        System.out.println(fee);
        return fee;
    }

    public int getItemsTotal(){
        return items.stream().mapToInt(OrderItem::getTotal).sum();
    }

    public Order() {
    }

    public ShippingAddress getAddress() {
        return address;
    }

    public void setAddress(ShippingAddress address) {
        this.address = address;
    }

    public List<OrderItem> getItems() {
        return items;
    }

    public void setItems(List<OrderItem> items) {
        this.items = items;
    }
}
