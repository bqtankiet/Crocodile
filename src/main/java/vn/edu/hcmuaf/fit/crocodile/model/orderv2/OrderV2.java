package vn.edu.hcmuaf.fit.crocodile.model.orderv2;

import java.util.List;

public class OrderV2 {

    public enum PaymentMethod {
        COD,
        ZALO_PAY,
        MOMO
    }

    private ShippingAddress address;
    private List<OrderItem> items;
    private PaymentMethod paymentMethod;
    private Voucher voucher;
    private int status;

    public int getShippingFee() {
        return 0;
    }

    public int getItemsTotal() {
        return 0;
    }

    public int getVoucherDiscount() {
        return 0;
    }

    public int getTotal() {
        return 0;
    }



    // GETTER, SETTER


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

    public PaymentMethod getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(PaymentMethod paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public Voucher getVoucher() {
        return voucher;
    }

    public void setVoucher(Voucher voucher) {
        this.voucher = voucher;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
