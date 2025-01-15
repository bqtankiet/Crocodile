package vn.edu.hcmuaf.fit.crocodile.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Order;
import vn.edu.hcmuaf.fit.crocodile.service.OrderService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "OrderController", value = "/order-controller")
public class OrderController extends HttpServlet {
    private final OrderService orderService = new OrderService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");
        System.out.println(userId);
        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<Order> ordersList = orderService.getOrdersByUserId(userId);

        request.setAttribute("ordersList", ordersList);
        System.out.println(ordersList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/user.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}