package vn.edu.hcmuaf.fit.crocodile.controller;

import com.mservice.config.Environment;
import com.mservice.enums.RequestType;
import com.mservice.models.PaymentResponse;
import com.mservice.processor.CreateOrderMoMo;
import com.mservice.shared.utils.LogUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.crocodile.model.cart.Cart;
import vn.edu.hcmuaf.fit.crocodile.model.order.Order;
import vn.edu.hcmuaf.fit.crocodile.service.OrderV2Service;

import java.io.IOException;
import java.util.Map;

@WebServlet(urlPatterns = "/checkout/payment/*")
public class PaymentController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();
        switch (pathInfo) {
            case "/cod" -> processCodPayment(req, resp);
            case "/momo" -> processMoMoPayment(req, resp);
            case "/momo-notify" -> processMoMoNotify(req, resp);
            default -> resp.sendError(404);
        }
    }

    private void processMoMoNotify(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        // TODO: Tạm thời chưa hoạt động được, cần phải đưa lên production thì momo mới gọi được url này.
        System.out.println("---- MoMo Notify Received ----");
        Map<String, String[]> parameterMap = req.getParameterMap();

        // In ra thử
        parameterMap.forEach((key, values) -> {
            System.out.println(key + " = " + String.join(", ", values));
        });

        // Kiểm tra
        String resultCode = req.getParameter("resultCode");
        String message = req.getParameter("message");

        if ("0".equals(resultCode)) {
            // Thanh toán thành công
            String orderId = req.getParameter("orderId");
            long amount = Long.parseLong(req.getParameter("amount"));
            placeOrder(req, resp);

        } else {
            // Thanh toán thất bại
            String errorMessage = message != null ? message : "Thanh toán thất bại";
            System.out.println("Thanh toán thất bại. Mã lỗi: " + resultCode + ", Thông báo: " + errorMessage);
        }
        // response
        resp.setContentType("text/plain;charset=UTF-8");
        resp.getWriter().write("notify_success");
    }

    private void processMoMoPayment(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        LogUtils.init();
        Order order = (Order) req.getSession().getAttribute("order");

        // Khởi tạo order
        String requestId = String.valueOf(System.currentTimeMillis());
        String orderId = String.valueOf(System.currentTimeMillis());
//        long amount = order.getTotal();
        long amount = 1000;
        String orderInfo = "Thanh toán đơn hàng QR";
        // TODO: Thay đổi đường dẫn trên production
        String returnURL = "http://localhost:8080/crocodile/";
        String notifyURL = "http://localhost:8080/crocodile/checkout/payment/momo-notify";

        Environment environment = Environment.selectEnv("dev");

        // Gọi API tạo đơn hàng
        PaymentResponse response = null;
        try {
            response = CreateOrderMoMo.process(
                    environment, orderId, requestId,
                    String.valueOf(amount), orderInfo,
                    returnURL, notifyURL, "",
                    RequestType.CAPTURE_WALLET, true
            );
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        System.out.println("QR Pay URL: " + response.getPayUrl());
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write("{\"redirectUrl\": \"" + response.getPayUrl() + "\", \"paymentMethod\": \"MOMO\"}");
        resp.setStatus(HttpServletResponse.SC_OK);
    }

    private void processCodPayment(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        placeOrder(req, resp);
    }

    private void placeOrder(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        try {
            Order order = (Order) req.getSession().getAttribute("order");
            // thêm đơn hàng vào db
            OrderV2Service orderV2Service = new OrderV2Service();
            orderV2Service.placeOrder(order);
            // xóa order trong session
            req.getSession().removeAttribute("order");
            // xóa các sản phẩm khỏi giỏ hàng trong session
            Cart cart = (Cart) req.getSession().getAttribute("cart");
            if (cart != null) {
                order.getItems().forEach(item -> {
                    if (cart.containItem(item.getVariantId())) cart.removeItem(item.getVariantId());
                });
            }
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
            // TODO: Thay đổi đường dẫn trên production
            resp.getWriter().write("{\"redirectUrl\": \"" + "http://localhost:8080/crocodile/" + "\", \"paymentMethod\": \"COD\"}");
            resp.setStatus(HttpServletResponse.SC_OK);
        } catch (Exception e) {
            e.printStackTrace();
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
    }
}
