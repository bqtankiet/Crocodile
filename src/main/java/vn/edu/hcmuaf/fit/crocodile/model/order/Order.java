package vn.edu.hcmuaf.fit.crocodile.model.order;

import java.io.Serializable;
import java.util.List;

public class Order implements Serializable {

    private ShippingAddress address;
    private List<OrderItem> items;

    public int getTotal(){
        return getItemsTotal()+getShippingFee();
    }

    public int getShippingFee(){
        return 25000;
    }

    public int getItemsTotal(){
        return 1230000;
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
