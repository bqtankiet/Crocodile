package vn.edu.hcmuaf.fit.crocodile.dao.userdiscount;

import vn.edu.hcmuaf.fit.crocodile.model.entity.DiscountCode;
import vn.edu.hcmuaf.fit.crocodile.model.entity.UserDiscount;

import java.util.List;

public interface IUserDiscountDAO {

    List<UserDiscount> findAllByUserId(int userId, int limit);
    List<UserDiscount> findAllByUserId(int userId);

    void saveDiscountForUser(int id, int userId);

    List<UserDiscount> findAllVoucherByUserId(int userId);
}
