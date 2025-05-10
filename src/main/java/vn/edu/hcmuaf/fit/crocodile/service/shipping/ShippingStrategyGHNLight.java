package vn.edu.hcmuaf.fit.crocodile.service.shipping;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import okhttp3.*;

import java.io.IOException;
import java.util.Map;

public class ShippingStrategyGHNLight extends ShippingStrategyGHN{
    static final String URL = "https://dev-online-gateway.ghn.vn/shiip/public-api/v2/shipping-order/fee";
    static final String TOKEN = "e1823376-0a5f-11f0-9f28-eacfdef119b3";
    static final String SHOPID = "196245";

    @Override
    public int getShippingFee(Map<String, Object> data) {

        /* TODO: Gọi API trả về phí vận chuyển */
        // Parse params
        int toDistrictId = Integer.parseInt(data.get(KEY_TO_DISTRICT_ID).toString());
        String toWardCode = data.get(KEY_TO_WARD_CODE).toString();
        int length = Integer.parseInt(data.get(KEY_LENGTH).toString());
        int width = Integer.parseInt(data.get(KEY_WIDTH).toString());
        int height = Integer.parseInt(data.get(KEY_HEIGHT).toString());
        int weight = Integer.parseInt(data.get(KEY_WIDTH).toString());

        // 1. Create okHttpClient object
        OkHttpClient client = new OkHttpClient();
        // 2. Create request body
        String payload = String.format("""
                {
                     "to_district_id": %d,
                     "to_ward_code": "%s",
                     "service_type_id": 2,
                     "length": %d,
                     "width": %d,
                     "height": %d,
                     "weight": %d
                }
                """, toDistrictId, toWardCode, length, width, height, weight);
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
                throw new IOException("Unexpected code " + response.body().string());
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
}
