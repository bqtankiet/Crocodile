import org.junit.jupiter.api.Test;
import vn.edu.hcmuaf.fit.crocodile.dao.discount.DiscountCodeDAO;
import vn.edu.hcmuaf.fit.crocodile.model.entity.DiscountCode;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

public class DiscountCodeTest {

//    @Test // create discount code
    public void test1() {
        String code = "TEST";
        DiscountCode.DiscountType type = DiscountCode.DiscountType.PERCENTAGE;
        BigDecimal value = new BigDecimal(10);
        BigDecimal maxDiscount = new BigDecimal(100000);
        LocalDateTime startTime = LocalDateTime.now();
        LocalDateTime endTime = startTime.plusDays(30);
        int maxUses = 10000;
        BigDecimal minOrderValue = new BigDecimal(200000);

        DiscountCodeDAO dao = new DiscountCodeDAO();
        dao.createDiscountCode(code,type,value,maxDiscount,startTime,endTime,maxUses, minOrderValue);
    }

    @Test // get discount code by code
    public void test2() {
        String code = "TEST";
        DiscountCodeDAO dao = new DiscountCodeDAO();
        DiscountCode discountCode = dao.findByCode(code);
        System.out.println(discountCode);
    }

//    @Test // create discount code by DiscountCode object
    public void test3() {
        String code = "TEST123";
        DiscountCode.DiscountType type = DiscountCode.DiscountType.PERCENTAGE;
        BigDecimal value = new BigDecimal(10);
        BigDecimal maxDiscount = new BigDecimal(100000);
        LocalDateTime startTime = LocalDateTime.now();
        LocalDateTime endTime = startTime.plusDays(30);
        int maxUses = 10000;
        BigDecimal minOrderValue = new BigDecimal(200000);

        DiscountCode discountCode = new DiscountCode(null, code, type, value, maxDiscount, startTime, endTime, maxUses, minOrderValue,null);
        DiscountCodeDAO dao = new DiscountCodeDAO();
        dao.createDiscountCode(discountCode);
    }

    @Test // findAll
    public void test4() {
        DiscountCodeDAO dao = new DiscountCodeDAO();
        List<DiscountCode> discountCodes = dao.findAll();
        discountCodes.forEach(System.out::println);
    }

    @Test
    public void test5() {
        DiscountCodeDAO dao = new DiscountCodeDAO();
        System.out.println(dao.checkUserUsage(1, 3));
    }

    @Test
    public void test6() {
        DiscountCodeDAO dao = new DiscountCodeDAO();
        List<DiscountCode> discountCodes = dao.findAllByCategory(DiscountCode.DiscountCategory.VOUCHER, 4);
        discountCodes.forEach(System.out::println);
    }
}
