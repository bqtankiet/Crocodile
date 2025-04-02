import org.junit.jupiter.api.Test;
import vn.edu.hcmuaf.fit.crocodile.dao.order.OrderDao;
import vn.edu.hcmuaf.fit.crocodile.model.dto.OrderItemDTO;

import java.util.List;

public class OrderItemsTest {

    // OK hoat dong
    @Test
    public void test () {
        OrderDao dao = new OrderDao();
        List<OrderItemDTO> items = dao.getOrderItems(1);

        items.forEach(System.out::println);

    }

}
