package vn.edu.hcmuaf.fit.crocodile_admin.controller.CRUD.order;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.crocodile.service.OrderService;

import java.io.IOException;

@WebServlet(name = "UpdateOrderController", value = "/admin/order/update")
public class UpdateOrderController extends HttpServlet {
    OrderService orderService = new OrderService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        int id = Integer.parseInt(request.getParameter("id"));

        switch (action){
            case "processing" -> orderService.processing(id);

            case "cancelled" -> orderService.cancelled(id);
        }
    }
}
