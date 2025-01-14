package vn.edu.hcmuaf.fit.crocodile.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.crocodile.model.cart.Cart;
import vn.edu.hcmuaf.fit.crocodile.model.cart.CartItem;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Order;
import vn.edu.hcmuaf.fit.crocodile.service.OrderService;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CheckoutController", value = "/checkout")
public class CheckoutController extends HttpServlet {
    private OrderService orderService = new OrderService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String selectedIds = request.getParameter("selectedIds");

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");


        if (selectedIds != null) {
            // Tách chuỗi thành các idVariant
            String[] idVariants = selectedIds.split(",");

            // Danh sách các CartItem của các sản phẩm đã chọn
            List<CartItem> selectedCartItems = new ArrayList<>();

            // Lọc giỏ hàng để lấy các sản phẩm đã chọn
            for (String idVariant : idVariants) {
                int id = Integer.parseInt(idVariant);

                // Kiểm tra xem giỏ hàng có chứa sản phẩm với idVariant này không
                if (cart.containItem(id)) {
                    CartItem cartItem = cart.getItemsMap().get(id);
                    selectedCartItems.add(cartItem);
                }
            }
            // Chuyển danh sách CartItem vào request để hiển thị trên trang đặt hàng
            session.setAttribute("selectedCartItems", selectedCartItems);
//            request.setAttribute("sl", selectedCartItems);
        }

        request.getRequestDispatcher("/views/checkout.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LocalDateTime currentDateTime = LocalDateTime.now();
        int idUser = Integer.parseInt(request.getParameter("idUser"));
        int idAddress = Integer.parseInt(request.getParameter("idAddress"));
        String paymentMethod = request.getParameter("paymentMethod");
        int total = Integer.parseInt(request.getParameter("total"));


        orderService.insertOrder(idUser, idAddress, total, currentDateTime,
                convertPaymentMethod(paymentMethod), Order.Status.PENDING);

    }

    Order.PaymentMethod convertPaymentMethod(String paymentMethod) {
        if (paymentMethod.equals("1")) return Order.PaymentMethod.CASH;
        if (paymentMethod.equals("2")) return Order.PaymentMethod.MOMO;
        return Order.PaymentMethod.ZALOPAY;
    }
}
