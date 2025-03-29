package vn.edu.hcmuaf.fit.crocodile_admin.controller.CRUD.order.api;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.crocodile.model.dto.OrderItemDTO;
import vn.edu.hcmuaf.fit.crocodile.service.OrderService;

import java.io.IOException;
import java.util.List;


@WebServlet(value = "/api/admin/order/items")
public class OrderItemAPI extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO: Chưa xử lý các ngoại lệ
        String idParam = req.getParameter("id");
        int id = Integer.parseInt(idParam);
        List<OrderItemDTO> items = new OrderService().getOrderItems(id);
        Gson gson = new GsonBuilder()
                .setPrettyPrinting()
                .create();
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(gson.toJson(items));
    }
}
