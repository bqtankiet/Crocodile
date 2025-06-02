package vn.edu.hcmuaf.fit.crocodile.dao.userdiscount;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.crocodile.config.JdbiConnect;
import vn.edu.hcmuaf.fit.crocodile.model.entity.DiscountCode;
import vn.edu.hcmuaf.fit.crocodile.model.entity.UserDiscount;

import java.time.LocalDateTime;
import java.util.List;

public class UserDiscountDAO implements IUserDiscountDAO{
    @Override
    public List<UserDiscount> findAllByUserId(int userId, int limit) {
        String sql = """
                SELECT *
                FROM user_discounts
                WHERE idUser = :idUser
                LIMIT :limit
                """;
        return JdbiConnect.getJdbi().withHandle(handle -> handle
                .createQuery(sql)
                .bind("idUser", userId)
                .bind("limit", limit)
                .mapToBean(UserDiscount.class)
                .list()
        );
    }

    @Override
    public List<UserDiscount> findAllByUserId(int userId) {
        String sql = """
                SELECT *
                FROM user_discounts
                WHERE idUser = :idUser
                """;
        return JdbiConnect.getJdbi().withHandle(handle -> handle
                .createQuery(sql)
                .bind("idUser", userId)
                .mapToBean(UserDiscount.class)
                .list()
        );
    }

    @Override
    public void saveDiscountForUser(int id, int userId) {
        String sql = """
                INSERT INTO user_discounts(idUser, idDiscount, savedDate)
                VALUES(:idUser, :idDiscount, :savedDate)
                """;
        JdbiConnect.getJdbi().withHandle(handle -> handle
                .createUpdate(sql)
                .bind("idDiscount", id)
                .bind("idUser", userId)
                .bind("savedDate", LocalDateTime.now())
                .execute()
        );
    }

    @Override
    public List<UserDiscount> findAllVoucherByUserId(int userId) {
        String sql = """
                SELECT *
                FROM user_discounts ud
                JOIN discount_codes dc ON ud.idDiscount=dc.id
                WHERE ud.idUser=:userId
                """;
        return JdbiConnect.getJdbi().withHandle(handle -> handle
                .createQuery(sql)
                .bind("userId", userId)
                .map((rs, ctx) -> {
                    DiscountCode discountCode = new DiscountCode();
                    discountCode.setId(rs.getInt("idDiscount"));
                    discountCode.setCode(rs.getString("code"));
                    discountCode.setType(DiscountCode.DiscountType.valueOf(rs.getString("type")));
                    discountCode.setValue(rs.getBigDecimal("value"));
                    discountCode.setMaxDiscount(rs.getBigDecimal("maxDiscount"));
                    discountCode.setMaxUses(rs.getInt("maxUses"));
                    discountCode.setMinOrderValue(rs.getBigDecimal("minOrderValue"));
                    discountCode.setStatus(DiscountCode.DiscountStatus.valueOf(rs.getString("status")));
                    discountCode.setCategory(DiscountCode.DiscountCategory.valueOf(rs.getString("category")));
                    discountCode.setStartDate(rs.getObject("startDate", LocalDateTime.class));
                    discountCode.setEndDate(rs.getObject("endDate", LocalDateTime.class));

                    UserDiscount voucher = new UserDiscount();
                    voucher.setId(rs.getInt("id"));
                    voucher.setIdUser(rs.getInt("idUser"));
                    voucher.setIdDiscount(rs.getInt("idDiscount"));
                    voucher.setUsed(rs.getBoolean("isUsed"));
                    voucher.setSavedDate(rs.getObject("savedDate", LocalDateTime.class));
                    voucher.setDiscountCode(discountCode);
                    return voucher;
                })
                .list()
        );
    }
}
