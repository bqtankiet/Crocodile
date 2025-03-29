import org.junit.jupiter.api.Test;
import vn.edu.hcmuaf.fit.crocodile.dao.order.OrderTrackingDAO;
import vn.edu.hcmuaf.fit.crocodile.model.entity.OrderTracking;
import vn.edu.hcmuaf.fit.crocodile.service.OrderDetailService;

import java.util.List;

public class OrderTrackingDAOTest {

    @Test
    void test () {
//        OrderTrackingDAO dao = new OrderTrackingDAO();
//        List<OrderTracking> tracking = dao.getOrderTrackingByOrderID(1);
        new OrderDetailService().getTrackingTimeline(1).forEach(System.out::println);
    }

}
