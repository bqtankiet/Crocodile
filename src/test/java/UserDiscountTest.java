import org.junit.jupiter.api.Test;
import vn.edu.hcmuaf.fit.crocodile.dao.userdiscount.IUserDiscountDAO;
import vn.edu.hcmuaf.fit.crocodile.dao.userdiscount.UserDiscountDAO;
import vn.edu.hcmuaf.fit.crocodile.model.entity.UserDiscount;

import java.util.List;

public class UserDiscountTest {

    @Test
    public void test1() {
        IUserDiscountDAO dao = new UserDiscountDAO();
        List<UserDiscount> userDiscounts = dao.findAllByUserId(1, 10);
        userDiscounts.forEach(System.out::println);
    }

    @Test
    public void test2() {
        IUserDiscountDAO dao = new UserDiscountDAO();
        List<UserDiscount> userDiscounts = dao.findAllVoucherByUserId(1);
        userDiscounts.forEach(ud -> System.out.println(ud.getDiscountCode()));
    }

}
