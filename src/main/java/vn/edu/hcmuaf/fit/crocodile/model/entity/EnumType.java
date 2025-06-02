package vn.edu.hcmuaf.fit.crocodile.model.entity;


public enum EnumType {
    IMPORT("Nhập kho"),
    SALE("Bán"),
    RETURN("Trả hàng"),
    ADJUSTMENT("Điều chỉnh");

    private final String description;

    EnumType(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }


}

