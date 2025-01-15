package vn.edu.hcmuaf.fit.crocodile_admin.controller.CRUD.order;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.crocodile.service.OrderService;

import java.io.IOException;

@WebServlet(name = "OrderManagementController", value = "/admin/order")
public class OrderController extends HttpServlet {
    OrderService orderService = new OrderService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("orders", orderService.findAllOrder());
        request.getRequestDispatcher("/admin/views/order.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
