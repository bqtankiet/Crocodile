import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import org.junit.jupiter.api.Test;
import vn.edu.hcmuaf.fit.crocodile.dao.order.OrderDao;
import vn.edu.hcmuaf.fit.crocodile.util.LocalDateTimeAdapter;
import vn.edu.hcmuaf.fit.crocodile.model.dto.OrderDetailDTO;

import java.time.LocalDateTime;

public class OrderDetailDTOTest {

    @Test
    void test() {
        OrderDao dao = new OrderDao();
        OrderDetailDTO dto = dao.getOrderDetail(1);
//        System.out.println(dto);

        Gson gson = new GsonBuilder()
                .setPrettyPrinting()
                .registerTypeAdapter(LocalDateTime.class, new LocalDateTimeAdapter())
                .create();
        String json = gson.toJson(dto);

        System.out.println(json);

    }

}

