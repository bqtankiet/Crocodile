import org.junit.jupiter.api.Test;
import vn.edu.hcmuaf.fit.crocodile.model.orderv2.OrderJson;
import vn.edu.hcmuaf.fit.crocodile.model.orderv2.OrderJsonException;
import vn.edu.hcmuaf.fit.crocodile.model.orderv2.OrderV2;

public class OrderJsonTest {

    @Test
    void test() {
        String jsonPayload = """
                {
                    "address": {
                        "recipientName": "Bùi Quang Tấn Kiệt",
                        "recipientPhone": "0987113222",
                        "districtId": 1489,
                        "wardCode": "1A0205",
                        "street": "Số 123, Đường ABC"
                    },
                    "items": [
                        {"variantId": 1, "quantity": 1},
                        {"variantId": 2, "quantity": 1}
                    ],
                    "paymentMethod": "COD",
                    "voucher": null
                }
                """;
        OrderJson orderJson = new OrderJson();
        OrderV2 order = null;
        try {
            order = orderJson.fromJson(jsonPayload);
        } catch (OrderJsonException e) {
            throw new RuntimeException(e);
        }

        System.out.println(order.getPaymentMethod());

    }


}
