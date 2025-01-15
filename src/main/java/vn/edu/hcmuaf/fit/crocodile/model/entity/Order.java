package vn.edu.hcmuaf.fit.crocodile.model.entity;

import java.io.Serializable;
import java.time.LocalDateTime;

public class Order implements Serializable {
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
        CASH, MOMO, ZALOPAY
    }

    public enum Status {
        PENDING("Chờ phê duyệt"),
        PROCESSING("Đã duyệt"),
        AWAITING("Đang giao hàng"),
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
}
