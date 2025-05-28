package vn.edu.hcmuaf.fit.crocodile.model.entity;

public enum Status {
    PENDING("Chờ xử lý"),
    PENDINGPICKUP("Chờ lấy hàng"),
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
