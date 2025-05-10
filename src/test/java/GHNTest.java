import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import okhttp3.*;
import org.junit.jupiter.api.Test;
import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDao;
import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDaoImpl;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Address;
import vn.edu.hcmuaf.fit.crocodile.service.shipping.ShippingService;
import vn.edu.hcmuaf.fit.crocodile.service.shipping.ShippingStrategy;
import vn.edu.hcmuaf.fit.crocodile.service.shipping.ShippingStrategyGHN;
import vn.edu.hcmuaf.fit.crocodile.service.shipping.ShippingStrategyGHNLight;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class GHNTest {
    static final String URL = "https://dev-online-gateway.ghn.vn/shiip/public-api/v2/shipping-order/fee";
    static final String TOKEN = "e1823376-0a5f-11f0-9f28-eacfdef119b3";
    static final String SHOPID = "196245";

    @Test
    public void test6() {
        UserDao dao = new UserDaoImpl();
        Address addresss = dao.getDefaultAddressByUserId(1);
        System.out.println(addresss.getDistrictId());
        System.out.println(addresss.getWardCode());
    }

    @Test
    public void test5() {
        ShippingService service = new ShippingService(new ShippingStrategyGHNLight());
        Map<String, Object> params = new HashMap<>();
        params.put(ShippingStrategyGHN.KEY_TO_DISTRICT_ID, 1536);
        params.put(ShippingStrategyGHN.KEY_TO_WARD_CODE, "480122");
        params.put(ShippingStrategyGHN.KEY_WIDTH, 20);
        params.put(ShippingStrategyGHN.KEY_HEIGHT, 20);
        params.put(ShippingStrategyGHN.KEY_LENGTH, 20);
        params.put(ShippingStrategyGHN.KEY_WEIGHT, 1000);

        System.out.println(service.getShippingFee(params));
    }

    @Test
    public void test4() {
        Map<String, Object> data = new HashMap<>();
        List<ShippingStrategyGHN.ShippingItem> items = new ArrayList<>();
        items.add(new ShippingStrategyGHN.ShippingItem("TEST1", 1, 20, 20, 20, 1000));
        items.add(new ShippingStrategyGHN.ShippingItem("TEST1", 1, 20, 20, 20, 1000));
        items.add(new ShippingStrategyGHN.ShippingItem("TEST1", 1, 20, 20, 20, 1000));
        data.put("items", items);
        data.put("to_district_id", 1536);
        data.put("to_ward_code", "480122");
        ShippingStrategy strategyGHN = new ShippingStrategyGHN();
        ShippingService service = new ShippingService(strategyGHN);
        int fee = service.getShippingFee(data);
        System.out.println(fee);
    }

    @Test
    public void test3() {
        ShippingStrategy strategy = new ShippingStrategyGHN();
        ShippingService service = new ShippingService(strategy);
        System.out.println(service.getShippingFee(null));
    }

    @Test
    public void test2() {
        // 1. Create okHttpClient object
        OkHttpClient client = new OkHttpClient();
        // 2. Create request body
        String payload = """
                {
                     "service_type_id": 5,
                     "to_district_id": 1489,
                     "to_ward_code": "1A0205",
                     "length": 30,
                     "width": 40,
                     "height": 20,
                     "weight": 3000,
                     "items": [
                         {
                             "name": "TEST1",
                             "quantity": 1,
                             "length": 200,
                             "width": 200,
                             "height": 200,
                             "weight": 1000
                         }
                     ]
                }
                """;
        RequestBody requestBody = RequestBody.create(payload, MediaType.get("application/json"));
        // 3. Create request
        Request request = new Request.Builder()
                .url(URL)
                .addHeader("Content-Type", "application/json")
                .addHeader("Token", TOKEN)
                .addHeader("ShopId", SHOPID)
                .post(requestBody)
                .build();
        // 4. send request
        try (Response response = client.newCall(request).execute()) {
            if (!response.isSuccessful()) {
                throw new IOException("Unexpected code " + response);
            }
            assert response.body() != null;
            // 5. Parse request
            JsonObject jsonObject;
            jsonObject = JsonParser.parseString(response.body().string()).getAsJsonObject();
            jsonObject = jsonObject.get("data").getAsJsonObject();
            int total = jsonObject.get("total").getAsInt();
            System.out.println(total);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Test
    public void test() {

        OkHttpClient client = new OkHttpClient();
        String jsonPayload = """
                {
                     "service_type_id": 5,
                     "to_district_id": 1489,
                     "to_ward_code": "1A0205",
                     "length": 30,
                     "width": 40,
                     "height": 20,
                     "weight": 3000,
                     "items": [
                         {
                             "name": "TEST1",
                             "quantity": 1,
                             "length": 200,
                             "width": 200,
                             "height": 200,
                             "weight": 1000
                         }
                     ]
                 }
                """;

        RequestBody body = RequestBody.create(jsonPayload, MediaType.get("application/json"));
        Request request = new Request.Builder()
                .url(URL)
                .addHeader("Content-Type", "application/json")
                .addHeader("Token", TOKEN)
                .addHeader("ShopId", SHOPID)
                .post(body)
                .build();

        try (Response response = client.newCall(request).execute()) {
            if (!response.isSuccessful()) {
                System.out.println("Request failed: " + response);
                return;
            }

            // Chuyển đổi JSON response thành một Map
            String responseBody = response.body().string();
            Gson gson = new Gson();
            Map<String, Object> responseMap = gson.fromJson(responseBody, Map.class);

            // Lấy ra giá trị data từ JSON
            Object data = responseMap.get("data");

            // In ra data
            System.out.println("Data: " + data);

            // Ép kiểu về Map
            Map<String, Object> dataMap = (Map<String, Object>) responseMap.get("data");

            // Lấy giá trị total
            Double total = (Double) dataMap.get("total");

            // In kết quả
            System.out.println("Total: " + total);

        } catch (IOException e) {
            e.printStackTrace();
        }


    }

}
