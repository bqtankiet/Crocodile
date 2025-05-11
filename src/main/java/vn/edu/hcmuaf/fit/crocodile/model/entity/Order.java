package vn.edu.hcmuaf.fit.crocodile.model.entity;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;

public class Order implements Serializable {
//    public enum PaymentMethod {
//        MOMO, CASH, ZALOPAY, VNPAY
//    }

//    public enum Status {
//        PENDING, PROCESSING, COMPLETED, CANCELLED, AWAITING
//    }

    private int id;
    private int idUser;
    private int idAddress;
    private int total;
    private LocalDateTime invoiceDate;
    private LocalDateTime paymentDate;
    private PaymentMethod paymentMethod;
    private Status status;

    // Các enum cho PaymentMethod và Status
    public enum PaymentMethod {
        CASH, MOMO, ZALOPAY, COD
    }

    public enum Status {
        PENDING("Chờ xử lý"),
        PROCESSING("Đang giao hàng"),
        AWAITING("Chờ lấy hàng"),
        COMPLETED("Hoàn thành"),
        CANCELLED("Hủy bỏ");

        private final String description;

        Status(String description) {
            this.description = description;
        }

        public String getDescription() {
            return description;
        }
    }
//>>>>>>> update

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
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

    public LocalDateTime getInvoiceDate() {
        return invoiceDate;
    }

    public void setInvoiceDate(LocalDateTime invoiceDate) {
        this.invoiceDate = invoiceDate;
    }

    public LocalDateTime getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(LocalDateTime paymentDate) {
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
                ", userId=" + idUser +
                ", idAddress=" + idAddress +
                ", total=" + total +
                ", invoiceDate=" + invoiceDate +
                ", paymentDate=" + paymentDate +
                ", paymentMethod=" + paymentMethod +
                ", status=" + status +
                '}';
    }
}
