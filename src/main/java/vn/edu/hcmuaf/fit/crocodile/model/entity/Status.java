package vn.edu.hcmuaf.fit.crocodile.model.entity;

public enum Status {
    PENDING("Chờ xử lý"),
    PROCESSING("Đang xử lý"),
    AWAITING("Chờ Xử lý"),
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
