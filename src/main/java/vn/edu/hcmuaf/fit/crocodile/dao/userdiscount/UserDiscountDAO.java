package vn.edu.hcmuaf.fit.crocodile.dao.userdiscount;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.crocodile.config.JdbiConnect;
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
}
