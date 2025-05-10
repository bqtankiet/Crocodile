package vn.edu.hcmuaf.fit.crocodile_admin.controller.CRUD.order;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Order;
import vn.edu.hcmuaf.fit.crocodile.service.OrderService;

import java.io.IOException;

@WebServlet(name = "OrderManagementController", value = "/admin/order")
public class OrderController extends HttpServlet {
    OrderService orderService = new OrderService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.setAttribute("orders", orderService.findAllOrder());
        int numOfAllOrders = orderService.findAllOrder().size();
        int numOfAwaitingOrders = orderService.findAllOrderByStatus(Order.Status.AWAITING).size();
        int numOfCancelledOrders = orderService.findAllOrderByStatus(Order.Status.CANCELLED).size();
        int numOfProcessingOrders = orderService.findAllOrderByStatus(Order.Status.PROCESSING).size();
        request.setAttribute("numOfAllOrders", numOfAllOrders);
        request.setAttribute("numOfAwaitingOrders", numOfAwaitingOrders);
        request.setAttribute("numOfCancelledOrders", numOfCancelledOrders);
        request.setAttribute("numOfProcessingOrders", numOfProcessingOrders);

        request.getRequestDispatcher("/admin/views/order.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
