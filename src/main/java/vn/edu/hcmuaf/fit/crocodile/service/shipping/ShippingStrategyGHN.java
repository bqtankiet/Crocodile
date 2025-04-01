package vn.edu.hcmuaf.fit.crocodile.service.shipping;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import okhttp3.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;


/**
 * TODO: Code này đang khá lỗi, lười refactor quá, bỏ đi (Tạm thời sử dụng {@link ShippingStrategyGHNLight}
 */
public class ShippingStrategyGHN implements ShippingStrategy {
    public static String KEY_TO_DISTRICT_ID = "to_district_id";
    public static String KEY_TO_WARD_CODE = "to_ward_code";
    public static String KEY_SERVICE_TYPE_ID = "service_type_id";
    public static String KEY_LENGTH = "length";
    public static String KEY_WIDTH = "width";
    public static String KEY_HEIGHT = "height";
    public static String KEY_WEIGHT = "weight";

    static final String URL = "https://dev-online-gateway.ghn.vn/shiip/public-api/v2/shipping-order/fee";
    static final String TOKEN = "e1823376-0a5f-11f0-9f28-eacfdef119b3";
    static final String SHOPID = "196245";

    @Override
    public int getShippingFee(Map<String, Object> data) {
        /* TODO: Gọi API trả về phí vận chuyển */
        List<ShippingItem> items = extractItems(data);
        int toDistrictId = extractToDistrictId(data);
        String toWardCode = extractToWardCode(data);

        // 1. Create okHttpClient object
        OkHttpClient client = new OkHttpClient();
        // 2. Create request body
        String payload = String.format("""
                {
                     "to_district_id": %d,
                     "to_ward_code": "%s",
                     "service_type_id": 2,
                     "length": 20,
                     "width": 20,
                     "height": 20,
                     "weight": 1000,
                     "items": %s
                }
                """, toDistrictId, toWardCode, items);
        System.out.println(payload);
        // TODO: Test
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
            return jsonObject.get("total").getAsInt();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private String extractToWardCode(Map<String, Object> data) {
        return data.get("to_ward_code").toString();
    }

    private int extractToDistrictId(Map<String, Object> data) {
        return Integer.parseInt(data.get("to_district_id").toString());
    }

    private static List<ShippingItem> extractItems(Map<String, Object> data) {
        List<ShippingItem> items = new ArrayList<ShippingItem>();
        Object rawItems = data.get("items");
        if (rawItems instanceof List<?>) {
            items = ((List<?>) rawItems).stream()
                    .filter(ShippingItem.class::isInstance)
                    .map(ShippingItem.class::cast)
                    .collect(Collectors.toList());
        }
        return items;
    }

    public static class ShippingItem {
        String name;
        int quantity;
        int length;
        int width;
        int height;
        int weight;

        public ShippingItem(String name, int quantity, int length, int width, int height, int weight) {
            this.name = name;
            this.quantity = quantity;
            this.length = length;
            this.width = width;
            this.height = height;
            this.weight = weight;
        }

        @Override
        public String toString() {
            return "{" +
                    "\"name\":" + "\"" + name + "\"" +
                    ", \"quantity\":" + quantity +
                    ", \"length\":" + length +
                    ", \"width\":" + width +
                    ", \"height\":" + height +
                    ", \"weight\":" + weight +
                    '}';
        }

        // Getter, Setter
        public String getName() {
            return name;
        }

        public int getQuantity() {
            return quantity;
        }

        public int getLength() {
            return length;
        }

        public int getWidth() {
            return width;
        }

        public int getHeight() {
            return height;
        }

        public int getWeight() {
            return weight;
        }
    }
}
