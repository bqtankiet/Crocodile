package vn.edu.hcmuaf.fit.crocodile.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.crocodile.model.cart.Cart;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Order.PaymentMethod;
import vn.edu.hcmuaf.fit.crocodile.model.order.Order;
import vn.edu.hcmuaf.fit.crocodile.service.OrderV2Service;

import java.io.IOException;

import static vn.edu.hcmuaf.fit.crocodile.model.entity.Order.PaymentMethod.*;

@WebServlet("/checkout/confirm")
public class CheckoutConfirmController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO: Đã ai làm gì đâu? đã ai đụng vào đâu?
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // lấy order từ session
        HttpSession session = request.getSession();
        Order order = (Order) session.getAttribute("order");
        // lấy phương thức thanh toán
        String paymentMethod = request.getParameter("paymentMethod");
        // lấy id user
        Object userIdRaw = session.getAttribute("userId");
        if(userIdRaw == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        Integer userId = (Integer) userIdRaw;

        // kiểm tra đơn hàng hợp lệ
        if (order.isValid() && paymentMethod != null) {
            order.setPaymentMethod(convertPaymentMethod(paymentMethod));
            order.setIdUser(userId);
            processOrder(order, request);
            response.setStatus(HttpServletResponse.SC_OK);
        } else {
            // something went wrong
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            System.out.println("Something went wrong");
        }

        // debug
        System.out.println("DEBUG: CheckoutConfirmController.java");
        System.out.println(order);
        System.out.println(paymentMethod);
    }

    private void processOrder(Order order, HttpServletRequest request) {
        // thêm đơn hàng vào db
        OrderV2Service orderV2Service = new OrderV2Service();
        orderV2Service.placeOrder(order);
        // xóa order trong session
        request.getSession().removeAttribute("order");
        // xóa các sản phẩm khỏi giỏ hàng trong session
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        order.getItems().forEach(item -> {
            if(cart.containItem(item.getVariantId())) cart.removeItem(item.getVariantId());
        });
    }

    private PaymentMethod convertPaymentMethod(String paymentMethod) {
        if (paymentMethod.equals("1")) return CASH;
        if (paymentMethod.equals("2")) return MOMO;
        return ZALOPAY;
    }
}
