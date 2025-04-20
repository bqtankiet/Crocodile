package vn.edu.hcmuaf.fit.crocodile_admin.controller.CRUD.order.api;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.crocodile.model.dto.OrderDetailDTO;
import vn.edu.hcmuaf.fit.crocodile.service.OrderService;
import vn.edu.hcmuaf.fit.crocodile.util.LocalDateTimeAdapter;

import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet(value = "/api/admin/order")
public class OrderDetailAPI extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //TODO: Chưa authentication

        OrderService service = new OrderService();
        String paramId = req.getParameter("id");
        int id = Integer.parseInt(paramId);
        OrderDetailDTO dto = service.getOrderDetail(id);
        Gson gson = new GsonBuilder()
                .setPrettyPrinting()
                .registerTypeAdapter(LocalDateTime.class, new LocalDateTimeAdapter())
                .create();
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(gson.toJson(dto));
    }
}
