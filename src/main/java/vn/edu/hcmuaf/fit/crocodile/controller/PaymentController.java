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
import org.json.JSONObject;
import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDao;
import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDaoImpl;
import vn.edu.hcmuaf.fit.crocodile.model.cart.Cart;
import vn.edu.hcmuaf.fit.crocodile.model.entity.User;
import vn.edu.hcmuaf.fit.crocodile.model.order.Order;
import vn.edu.hcmuaf.fit.crocodile.service.OrderV2Service;
import vn.edu.hcmuaf.fit.crocodile.util.log.LogOrder;
import vn.edu.hcmuaf.fit.crocodile.util.log.LogUtil;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.Map;
import java.util.Optional;

@WebServlet(urlPatterns = "/checkout/payment/*")
public class PaymentController extends HttpServlet {
    private Order order;
    private Cart cart;
    private String ip;
    private User user;
    private HttpServletRequest userRequest;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();
        this.userRequest = req;
        switch (pathInfo) {
            case "/cod" -> processCodPayment(req, resp);
            case "/momo" -> processMoMoPayment(req, resp);
            case "/momo-notify" -> processMoMoNotify(req, resp);
            default -> resp.sendError(404);
        }
    }

    private void processMoMoNotify(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        System.out.println("---- MoMo Notify Received ----");

        // Đọc JSON từ body
        StringBuilder jsonBuffer = new StringBuilder();
        BufferedReader reader = req.getReader();
        String line;
        while ((line = reader.readLine()) != null) {
            jsonBuffer.append(line);
        }

        String requestBody = jsonBuffer.toString();
        System.out.println("Body JSON: " + requestBody);

        // Parse JSON
        JSONObject json = new JSONObject(requestBody);

        int resultCode = json.getInt("resultCode");
        String message = json.getString("message");
        String orderId = json.getString("orderId");
        long amount = json.getLong("amount");

        if (resultCode == 0) {
            System.out.println("Thanh toán thành công");
            placeOrder(userRequest, resp);
        } else {
            System.out.println("Thanh toán thất bại");
        }

        resp.setContentType("text/plain;charset=UTF-8");
        resp.getWriter().write("notify_success");
    }

    private void processMoMoPayment(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        LogUtils.init();
        this.order = (Order) req.getSession().getAttribute("order");
        this.ip = LogUtil.getClientIp(req);
        this.user = (User) req.getSession().getAttribute("user");
        this.cart = (Cart) req.getSession().getAttribute("cart");

        // Khởi tạo order
        String requestId = String.valueOf(System.currentTimeMillis());
        String orderId = String.valueOf(System.currentTimeMillis());
//        long amount = order.getTotal();
        long amount = 1000;
        String orderInfo = "Thanh toán đơn hàng QR";
        // TODO: Thay đổi đường dẫn trên production
        String returnURL = "http://localhost:8080/";
        String notifyURL = "http://localhost:8080/checkout/payment/momo-notify";

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
        this.order = (Order) req.getSession().getAttribute("order");
        this.ip = LogUtil.getClientIp(req);
        this.user = (User) req.getSession().getAttribute("user");
        this.cart = (Cart) req.getSession().getAttribute("cart");
        placeOrder(req, resp);
    }

    private void placeOrder(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        try {
            // thêm đơn hàng vào db
            OrderV2Service orderV2Service = new OrderV2Service();
            orderV2Service.placeOrder(order);
            // xóa order trong session
            req.getSession().removeAttribute("order");
            // xóa các sản phẩm khỏi giỏ hàng trong session
//            Cart cart = (Cart) req.getSession().getAttribute("cart");
            if (cart != null) {
                order.getItems().forEach(item -> {
                    if (cart.containItem(item.getVariantId())) cart.removeItem(item.getVariantId());
                });
                req.setAttribute("cart", cart);
            }

            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
            // TODO: Thay đổi đường dẫn trên production
            resp.getWriter().write("{\"redirectUrl\": \"" + "http://localhost:8080/" + "\", \"paymentMethod\": \"COD\"}");
            resp.setStatus(HttpServletResponse.SC_OK);

            if(user != null && ip != null) {
                LogOrder logOrder = new LogOrder();
                logOrder.logSuccess(String.valueOf(user.getId()), user.getEmail(), ip, String.valueOf(order.getPaymentMethod()), String.valueOf(order.getTotal()));
                user = null;
                ip = null;
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
    }
}
