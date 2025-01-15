package vn.edu.hcmuaf.fit.crocodile.model.entity;

import java.time.LocalDate;

public class Order {
    public enum PaymentMethod {
        MOMO, CASH, ZALOPAY, VNPAY
    }

    public enum Status {
        PENDING, PROCESSING, COMPLETED, CANCELLED, AWAITING
    }

    private int id;
    private int userId;
    private int idAddress;
    private int total;
    private LocalDate invoiceDate;
    private LocalDate paymentDate;
    private PaymentMethod paymentMethod;
    private Status status;

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getIdAddress() {
        return idAddress;
    }

    public void setIdAddress(int idAddress) {
        this.idAddress = idAddress;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public LocalDate getInvoiceDate() {
        return invoiceDate;
    }

    public void setInvoiceDate(LocalDate invoiceDate) {
        this.invoiceDate = invoiceDate;
    }

    public LocalDate getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(LocalDate paymentDate) {
        this.paymentDate = paymentDate;
    }

    public PaymentMethod getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(PaymentMethod paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", userId=" + userId +
                ", idAddress=" + idAddress +
                ", total=" + total +
                ", invoiceDate=" + invoiceDate +
                ", paymentDate=" + paymentDate +
                ", paymentMethod=" + paymentMethod +
                ", status=" + status +
                '}';
    }
}
