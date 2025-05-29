package vn.edu.hcmuaf.fit.crocodile.model.entity;

import vn.edu.hcmuaf.fit.crocodile.model.order.Order;
import vn.edu.hcmuaf.fit.crocodile.util.DateUtil;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Date;

public class DiscountCode implements java.io.Serializable {

    public boolean isApplicable(Order order) {
        BigDecimal orderValue = new BigDecimal(order.getTotalBeforeDiscount());
        return orderValue.compareTo(minOrderValue) >= 0;
    }

    public int calculateTotalAmount(Order order) {
        int originalTotal = order.getTotalBeforeDiscount();

        int discountAmount = switch (this.type) {
            case FIXED -> value.intValue();
            case PERCENTAGE -> originalTotal * value.intValue() / 100;
        };

        return Math.max(0, originalTotal - discountAmount);
    }

    public enum DiscountType {PERCENTAGE, FIXED}
    public enum DiscountStatus {ACTIVE, EXPIRED, USED_UP}
    public enum DiscountCategory {COUPON, VOUCHER, FREESHIP}

    public static String TABLE = "discount_codes";

    private Integer id;
    private String code;
    private DiscountType type; // "PERCENTAGE" or "FIXED"
    private BigDecimal value;
    private BigDecimal maxDiscount;
    private LocalDateTime startDate;
    private LocalDateTime endDate;
    private int maxUses;
    private BigDecimal minOrderValue;
    private DiscountStatus status; // "ACTIVE", "EXPIRED", "USED_UP"
    private DiscountCategory category; // "COUPON", "VOUCHER", "FREESHIP"
    private boolean isSaved;

    // Constructors
    public DiscountCode() {
    }

    public DiscountCode(Integer id, String code, DiscountType type, BigDecimal value, BigDecimal maxDiscount,
                        LocalDateTime startDate, LocalDateTime endDate, int maxUses, BigDecimal minOrderValue, DiscountStatus status) {
        this.id = id;
        this.code = code;
        this.type = type;
        this.value = value;
        this.maxDiscount = maxDiscount;
        this.startDate = startDate;
        this.endDate = endDate;
        this.maxUses = maxUses;
        this.minOrderValue = minOrderValue;
        this.status = status;
    }

    // toString
    @Override
    public String toString() {
        return "DiscountCode{" +
                "id=" + id +
                ", code='" + code + '\'' +
                ", type=" + type +
                ", value=" + value +
                ", maxDiscount=" + maxDiscount +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                ", maxUses=" + maxUses +
                ", minOrderValue=" + minOrderValue +
                ", status=" + status +
                '}';
    }

    public boolean getSaved() {
        return isSaved;
    }

    public void setSaved(boolean saved) {
        isSaved = saved;
    }

    // Getters and Setters
    public DiscountCategory getCategory() {
        return category;
    }

    public void setCategory(DiscountCategory category) {
        this.category = category;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public DiscountType getType() {
        return type;
    }

    public void setType(DiscountType type) {
        this.type = type;
    }

    public BigDecimal getValue() {
        return value;
    }

    public void setValue(BigDecimal value) {
        this.value = value;
    }

    public BigDecimal getMaxDiscount() {
        return maxDiscount;
    }

    public void setMaxDiscount(BigDecimal maxDiscount) {
        this.maxDiscount = maxDiscount;
    }

    public LocalDateTime getStartDate() {
        return startDate;
    }

    public Date getStartDateFmt() {
        return DateUtil.convertLocalDateTimeToDate(startDate);
    }

    public void setStartDate(LocalDateTime startDate) {
        this.startDate = startDate;
    }

    public LocalDateTime getEndDate() {
        return endDate;
    }

    public Date getEndDateFmt() {
        return DateUtil.convertLocalDateTimeToDate(endDate);
    }

    public void setEndDate(LocalDateTime endDate) {
        this.endDate = endDate;
    }

    public int getMaxUses() {
        return maxUses;
    }

    public void setMaxUses(int maxUses) {
        this.maxUses = maxUses;
    }

    public BigDecimal getMinOrderValue() {
        return minOrderValue;
    }

    public void setMinOrderValue(BigDecimal minOrderValue) {
        this.minOrderValue = minOrderValue;
    }

    public DiscountStatus getStatus() {
        return status;
    }

    public void setStatus(DiscountStatus status) {
        this.status = status;
    }
}
