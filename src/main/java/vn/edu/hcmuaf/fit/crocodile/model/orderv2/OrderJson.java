package vn.edu.hcmuaf.fit.crocodile.model.orderv2;

import com.google.gson.*;

import java.util.ArrayList;
import java.util.List;

public class OrderJson {

    private JsonObject jsonObject;

    public OrderJson() {
        jsonObject = new JsonObject();
    }

    public OrderV2 fromJson(String json) throws OrderJsonException {
        OrderV2 order = new OrderV2();
        jsonObject = JsonParser.parseString(json).getAsJsonObject();

        order.setAddress(parseAddress(jsonObject));
        order.setItems(parseItems(jsonObject));
        order.setPaymentMethod(parsePaymentMethod(jsonObject));
        order.setVoucher(null);

        return order;
    }

    public String toStringJson(OrderV2 order) {
        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        return gson.toJsonTree(order).getAsJsonObject().toString();
    }

    private OrderV2.PaymentMethod parsePaymentMethod(JsonObject jsonObject) throws OrderJsonException {
        if (!jsonObject.has("paymentMethod")) return OrderV2.PaymentMethod.COD;
        try {
            return (OrderV2.PaymentMethod.valueOf(jsonObject.get("paymentMethod").getAsString()));
        } catch (Exception e) {
            throw new OrderJsonException("API ERROR: paymentMethod is invalid");
        }
    }

    private List<OrderItem> parseItems(JsonObject jsonObject) throws OrderJsonException {
        if (!jsonObject.has("items")) throw new OrderJsonException("API ERROR: items is required");

        try {
            JsonArray itemsJson = jsonObject.getAsJsonArray("items");
            List<OrderItem> items = new ArrayList<>();
            for (int i = 0; i < itemsJson.size(); i++) {
                JsonObject itemJson = itemsJson.get(i).getAsJsonObject();
                OrderItem item = new OrderItem();
                int variantId = itemJson.get("variantId").getAsInt();
                int quantity = itemJson.get("quantity").getAsInt();
                item.setVariantId(variantId);
                item.setQuantity(quantity);
                item.setVariantName("Product Test" + i);
                item.setVariantOption("Mau sac: Do, Size: 48");
                items.add(item);
            }
            return items;
        } catch (NullPointerException e) {
            throw new OrderJsonException("API ERROR: items syntax");
        }
    }

    private ShippingAddress parseAddress(JsonObject jsonObject) throws OrderJsonException {
        if (!jsonObject.has("address")) return null; // Sẽ sử dụng địa chỉ mặc định (Nếu có)
        try {
            JsonObject addressJson = jsonObject.get("address").getAsJsonObject();
            ShippingAddress address = new ShippingAddress();
            address.setRecipientName(addressJson.get("recipientName").getAsString());
            address.setRecipientPhone(addressJson.get("recipientPhone").getAsString());
            address.setDistrictId(addressJson.get("districtId").getAsInt());
            address.setWardCode(addressJson.get("wardCode").getAsString());
            address.setStreet(addressJson.get("street").getAsString());

            address.setProvinceName("Province Test");
            address.setDistrictName("District Test");
            address.setWardName("Ward Test");

            return address;
        } catch (NullPointerException e) {
            throw new OrderJsonException("API ERROR: address syntax");
        }
    }
}
