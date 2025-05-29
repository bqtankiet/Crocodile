package vn.edu.hcmuaf.fit.crocodile.dao.discount;

import vn.edu.hcmuaf.fit.crocodile.model.entity.DiscountCode;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

public interface IDiscountCodeDAO {

    void createDiscountCode(String code, DiscountCode.DiscountType type, BigDecimal value, BigDecimal maxDiscount, LocalDateTime startDate, LocalDateTime endDate, int maxUses, BigDecimal minOrderValue);

    void createDiscountCode(DiscountCode discountCode);

    DiscountCode findByCode(String code);

    DiscountCode findById(int id);

    List<DiscountCode> findAll();

    boolean checkUserUsage(int id, int userId);

    List<DiscountCode> findAllByCategory(DiscountCode.DiscountCategory category, int limit);

    void decreaseMaxUses(int id);
}
