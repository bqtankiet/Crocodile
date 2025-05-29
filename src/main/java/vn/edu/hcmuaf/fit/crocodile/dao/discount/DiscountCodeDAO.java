package vn.edu.hcmuaf.fit.crocodile.dao.discount;

import vn.edu.hcmuaf.fit.crocodile.config.JdbiConnect;
import vn.edu.hcmuaf.fit.crocodile.model.entity.DiscountCode;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

public class DiscountCodeDAO implements IDiscountCodeDAO {
    @Override
    public void createDiscountCode(String code, DiscountCode.DiscountType type, BigDecimal value, BigDecimal maxDiscount, LocalDateTime startDate, LocalDateTime endDate, int maxUses, BigDecimal minOrderValue) {
        JdbiConnect.getJdbi().withHandle(handle ->
                handle.createUpdate("INSERT INTO " + DiscountCode.TABLE + " (code, type, value, maxDiscount, startDate, endDate, maxUses, minOrderValue, status) VALUES (:code, :type, :value, :maxDiscount, :startDate, :endDate, :maxUses, :minOrderValue, 'ACTIVE')")
                        .bind("code", code)
                        .bind("type", type)
                        .bind("value", value)
                        .bind("maxDiscount", maxDiscount)
                        .bind("startDate", startDate)
                        .bind("endDate", endDate)
                        .bind("maxUses", maxUses)
                        .bind("minOrderValue", minOrderValue)
                        .execute()
        );
    }

    @Override
    public void createDiscountCode(DiscountCode discountCode) {
        createDiscountCode(
                discountCode.getCode(),
                discountCode.getType(),
                discountCode.getValue(),
                discountCode.getMaxDiscount(),
                discountCode.getStartDate(),
                discountCode.getEndDate(),
                discountCode.getMaxUses(),
                discountCode.getMinOrderValue()
        );
    }

    @Override
    public DiscountCode findByCode(String code) {
        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createQuery("SELECT * FROM "+DiscountCode.TABLE+" WHERE code = :code")
                        .bind("code", code)
                        .mapToBean(DiscountCode.class)
                        .findFirst()
                        .orElse(null));
    }

    @Override
    public DiscountCode findById(int id) {
        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createQuery("SELECT * FROM "+DiscountCode.TABLE+" WHERE id = :id")
                        .bind("id", id)
                        .mapToBean(DiscountCode.class)
                        .findFirst()
                        .orElse(null));
    }

    @Override
    public List<DiscountCode> findAll() {
        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createQuery("SELECT * FROM " + DiscountCode.TABLE)
                        .mapToBean(DiscountCode.class)
                        .list()
        );
    }

    @Override
    public boolean checkUserUsage(int discountId, int userId) {
        String sql = "SELECT 1 FROM discount_usage WHERE discountCodeId = :discountId AND userId = :userId LIMIT 1";
        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("discountId", discountId)
                        .bind("userId", userId)
                        .mapTo(Integer.class)
                        .findOne()
                        .isPresent()
        );
    }

    @Override
    public List<DiscountCode> findAllByCategory(DiscountCode.DiscountCategory category, int limit) {
        String sql = """
            SELECT * FROM `discount_codes`
            WHERE category=:category
            AND status="ACTIVE"
            LIMIT :limit""";
        return JdbiConnect.getJdbi().withHandle(handle -> handle
                .createQuery(sql)
                .bind("category", category)
                .bind("limit", limit)
                .mapToBean(DiscountCode.class)
                .list()
        );
    }

    @Override
    public void decreaseMaxUses(int id) {
        String sql = """
                UPDATE discount_codes
                SET maxUses=maxUses-1
                WHERE id=:id
                """;
        JdbiConnect.getJdbi().withHandle(handle -> handle.createUpdate(sql).bind("id", id).execute());
    }
}
