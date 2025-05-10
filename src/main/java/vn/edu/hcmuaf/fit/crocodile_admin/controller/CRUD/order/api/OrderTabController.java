package vn.edu.hcmuaf.fit.crocodile_admin.controller.CRUD.order.api;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Order;
import vn.edu.hcmuaf.fit.crocodile.service.OrderService;

import java.io.IOException;

@WebServlet(urlPatterns = "/admin/order/tab/*")
public class OrderTabController extends HttpServlet {
    OrderService orderService = new OrderService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();
        switch (pathInfo) {
            case "/all" -> responseAll(req, resp);
            case "/pending" -> responsePending(req, resp);
            case "/awaiting" -> responseAwaiting(req, resp);
            case "/processing" -> System.out.println("processing");
            case "/cancelled" -> System.out.println("cancelled");
            default -> resp.sendError(404);
        }
    }

    private void responseAwaiting(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("Awaiting");
        req.setAttribute("orders", orderService.findAllOrderByStatus(Order.Status.AWAITING));
        req.getRequestDispatcher("/admin/views/contents/order/order-tab.jsp").forward(req, resp);
    }

    private void responsePending(HttpServletRequest req, HttpServletResponse resp) {
        System.out.println("Pending");
    }

    private void responseAll(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("orders", orderService.findAllOrder());
        req.getRequestDispatcher("/admin/views/contents/order/order-tab.jsp").forward(req, resp);
    }

}
