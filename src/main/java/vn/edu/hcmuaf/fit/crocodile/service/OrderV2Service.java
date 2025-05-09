package vn.edu.hcmuaf.fit.crocodile.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.crocodile.config.JdbiConnect;
import vn.edu.hcmuaf.fit.crocodile.model.order.Order;
import vn.edu.hcmuaf.fit.crocodile.model.order.OrderItem;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class OrderV2Service {

    private final Jdbi jdbi;
    private final ObjectMapper objectMapper;

    public OrderV2Service() {
        this.jdbi = JdbiConnect.getJdbi();
        this.objectMapper = new ObjectMapper();
    }

    public void placeOrder(
            int idUser,
            String paymentMethod,
            double totalAmount,
            String recipientName,
            String recipientPhone,
            String shippingAddress,
            String shippingCompany,
            String shippingCode,
            int districtId,
            String wardCode,
            List<Map<String, Object>> items
    ) {
        try (Handle handle = jdbi.open()) {
            String itemsJson = objectMapper.writeValueAsString(items);

            handle.createCall("CALL PlaceOrder(:idUser, :paymentMethod, :totalAmount, :recipientName, " +
                            ":recipientPhone, :shippingAddress, :shippingCompany, :shippingCode, :districtId, :wardCode, :items)")
                    .bind("idUser", idUser)
                    .bind("paymentMethod", paymentMethod)
                    .bind("totalAmount", totalAmount)
                    .bind("recipientName", recipientName)
                    .bind("recipientPhone", recipientPhone)
                    .bind("shippingAddress", shippingAddress)
                    .bind("shippingCompany", shippingCompany)
                    .bind("shippingCode", shippingCode)
                    .bind("districtId", districtId)
                    .bind("wardCode", wardCode)
                    .bind("items", itemsJson)
                    .invoke();
        } catch (Exception e) {
            throw new RuntimeException("Failed to place order: " + e.getMessage(), e);
        }
    }

    public void placeOrder(Order order) {
        List<Map<String, Object>> items = new ArrayList<>();
        for(OrderItem oi: order.getItems()){
            items.add(Map.of("idVariant", oi.getVariantId(), "amount", oi.getQuantity()));
        }
        placeOrder(
                order.getIdUser(),
                order.getPaymentMethod().toString(),
                order.getTotal(),
                order.getAddress().getRecipientName(),
                order.getAddress().getRecipientPhone(),
                order.getAddress().getFullAddress(),
                "GHN",
                "123456",
                order.getAddress().getDistrictId(),
                order.getAddress().getWardCode(),
                items
        );
    }


    public static void main(String[] args) {
        OrderV2Service orderService = new OrderV2Service();

        System.out.println("Test: Successful order placement");
        try {
            List<Map<String, Object>> validItems = List.of(
                    Map.of("idVariant", 1, "amount", 99),
                    Map.of("idVariant", 2, "amount", 99),
                    Map.of("idVariant", 3, "amount", 99)
            );

            orderService.placeOrder(
                    1,
                    "COD",
                    500000.00,
                    "Nguyễn Văn A",
                    "0912345678",
                    "123 Đường Lê Lợi, Quận 1, TP.HCM",
                    "GHTK",
                    "GHTK-XYZ-001",
                    760,
                    "00123",
                    validItems
            );
        } catch (Exception e) {
            System.err.println("FAILED: " + e.getMessage());
        }
    }
}
