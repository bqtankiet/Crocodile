package vn.edu.hcmuaf.fit.crocodile_admin.controller.CRUD.order;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.crocodile.util.LocalDateTimeAdapter;
import vn.edu.hcmuaf.fit.crocodile.model.dto.OrderDetailDTO;
import vn.edu.hcmuaf.fit.crocodile.model.entity.OrderTracking;
import vn.edu.hcmuaf.fit.crocodile.service.OrderDetailService;
import vn.edu.hcmuaf.fit.crocodile.service.OrderService;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet(name = "UpdateOrderController", value = "/admin/order/update")
public class UpdateOrderController extends HttpServlet {
    OrderService orderService = new OrderService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // get order data by id
        int orderId = Integer.parseInt(request.getParameter("id"));

        // - thong tin chung
        OrderDetailDTO dto = orderService.getOrderDetail(1);
        Gson gson = new GsonBuilder()
                .setPrettyPrinting()
                .registerTypeAdapter(LocalDateTime.class, new LocalDateTimeAdapter())
                .create();
        String json = gson.toJson(dto);

        // - trang thai don hang
        List<OrderTracking> tracking = new OrderDetailService().getTrackingTimeline(orderId);

        // - danh sach san pham

        // put data in request
        request.setAttribute("id", orderId);
        request.setAttribute("tracking", tracking);
        request.setAttribute("detailJson", json);

        // forward data
        request.getRequestDispatcher("/admin/views/order-detail.jsp").forward(request, response);
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
