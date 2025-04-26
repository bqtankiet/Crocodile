package vn.edu.hcmuaf.fit.crocodile.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.crocodile.config.JdbiConnect;
import vn.edu.hcmuaf.fit.crocodile.model.cart.Cart;
import vn.edu.hcmuaf.fit.crocodile.model.cart.CartItem;
import vn.edu.hcmuaf.fit.crocodile.model.entity.EnumType;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Order;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Product;
import vn.edu.hcmuaf.fit.crocodile.service.OrderService;
import vn.edu.hcmuaf.fit.crocodile.service.ProductService;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CheckoutController", value = "/checkout")
public class CheckoutController extends HttpServlet {
    ProductService productService = new ProductService();
    private OrderService orderService = new OrderService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        ----------------Cho phan mua ngay-------------------
        String action = request.getParameter("action");
        HttpSession session = request.getSession();

        if ("buyNow".equals(action)) {
            session.removeAttribute("selectedCartItems");
            int idVariant = Integer.parseInt(request.getParameter("idVariant"));

            if (idVariant != 0) {
                int quantity = Integer.parseInt(request.getParameter("quantity"));

                Product.ProductVariant pv = productService.getProductVariantById(idVariant);
                CartItem cartItem = new CartItem(pv, quantity);
                request.setAttribute("cartItem", cartItem);
                request.getRequestDispatcher("/views/checkout.jsp").forward(request, response);

//                return;
            }
        }
//        ----------------Cho phan mua ngay-------------------

//        ----------------Cho phan gio hang-------------------
        Cart cart = (Cart) session.getAttribute("cart");
        String selectedIds = request.getParameter("selectedIds");

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
//        ----------------Cho phan gio hang-------------------
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LocalDateTime currentDateTime = LocalDateTime.now();
        int idUser = Integer.parseInt(request.getParameter("idUser"));
        int idAddress = Integer.parseInt(request.getParameter("idAddress"));
        String paymentMethod = request.getParameter("paymentMethod");
        int total = Integer.parseInt(request.getParameter("total"));
        String action = request.getParameter("action");

        try {
            JdbiConnect.getJdbi().useTransaction(handle -> {
                // insert bang order va tra ve idOrder
                int idOrder = orderService.insertOrder(idUser, idAddress, total, currentDateTime,
                        convertPaymentMethod(paymentMethod), Order.Status.PENDING);

                if ("buySuccess".equals(action)) {
                    String[] idVariants = request.getParameter("idBuys").split(",");

                    String quantities = request.getParameter("quantities");

                    HttpSession session = request.getSession();

                    Cart cart = (Cart) session.getAttribute("cart");

                    for (int i = 0; i < idVariants.length; i++) {
                        int idV = Integer.parseInt(idVariants[i]);
                        Product.ProductVariant pv = productService.getProductVariantById(idV);

                        int quantity = Integer.parseInt(quantities.split(",")[i]);

                        // insert vao bang order_details
                        orderService.insertOrderDetail(idOrder, idV, quantity);

                        // insert vao bang inventory_histories
                        orderService.insertInventoryHistory(idV, idOrder, quantity, EnumType.SALE, 1);

                        // update so luong trong product_variants
                        int rowAffected = orderService.updateStock(idV, quantity);
                        if (rowAffected == 0) {
                            throw new RuntimeException("Đặt hàng thất bại: Không đủ hàng trong kho cho sản phẩm!");
                        }
                        // xoa san pham khoi gio hang
                        if(cart.containItem(idV)) cart.removeItem(idV);
                    }

                    session.setAttribute("cart", cart);
                }
            });
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.setContentType("text/plain; charset=UTF-8");
            response.getWriter().write(e.getMessage());
        }

    }

    private Order.PaymentMethod convertPaymentMethod(String paymentMethod) {
        if (paymentMethod.equals("1")) return Order.PaymentMethod.CASH;
        if (paymentMethod.equals("2")) return Order.PaymentMethod.MOMO;
        return Order.PaymentMethod.ZALOPAY;
    }
}
