package vn.edu.hcmuaf.fit.crocodile.model.order;

import vn.edu.hcmuaf.fit.crocodile.model.entity.DiscountCode;
import vn.edu.hcmuaf.fit.crocodile.service.InventoryService;
import vn.edu.hcmuaf.fit.crocodile.service.shipping.ShippingService;
import vn.edu.hcmuaf.fit.crocodile.service.shipping.ShippingStrategyGHN;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Order.PaymentMethod;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Order implements Serializable {

    private InventoryService service = new InventoryService();

    private ShippingAddress address;
    private List<OrderItem> items;
    private PaymentMethod paymentMethod;
    private int idUser;
    private DiscountCode discountCode;

    public int getTotal() {
        if(discountCode != null && discountCode.isApplicable(this)) {
            return getTotalWithDiscount();
        }
        return getTotalBeforeDiscount();
    }

    public int getTotalBeforeDiscount() {
        return getItemsTotal() + getShippingFee();
    }


    private int getTotalWithDiscount() {
        return discountCode.calculateTotalAmount(this);
    }

    public int getShippingFee() {
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
//        System.out.println("ShippingFee");
//        System.out.println(fee);
        return fee;
    }

    public int getItemsTotal() {
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

    public boolean isValid() {
        // TODO: kiểm tra danh sách sản phẩm
        if (items == null || items.isEmpty()) {
            return false;
        }
        // TODO: kiểm tra tồn kho
        for (OrderItem item : items) {
            boolean isAvailable = checkInventory(item.getVariantId(), item.getQuantity());
            if (!isAvailable) {
                return false;
            }
        }
        return true;
    }

    private boolean checkInventory(int variantId, int quantity) {
        return service.checkAvailableInventory(variantId, quantity);
    }

    public PaymentMethod getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(PaymentMethod paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public InventoryService getService() {
        return service;
    }

    public void setService(InventoryService service) {
        this.service = service;
    }

    public DiscountCode getDiscountCode() {
        return discountCode;
    }

    public void setDiscountCode(DiscountCode discountCode) {
        this.discountCode = discountCode;
    }

    @Override
    public String toString() {
        return "Order{" +
                "address=" + address +
                ", items=" + items +
                '}';
    }
}
