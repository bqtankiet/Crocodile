package vn.edu.hcmuaf.fit.crocodile_admin.controller.dashboard;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(urlPatterns = "/admin/dashboard/statValues")
public class DashboardStatValues extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Tạo dữ liệu thống kê
        Map<String, Object> statValues = new HashMap<>();

        Map<String, Object> revenue = new HashMap<>();
        revenue.put("amount", 50120220);
        revenue.put("percent", -7);

        Map<String, Object> customers = new HashMap<>();
        customers.put("amount", 36254);
        customers.put("percent", 13.25);

        Map<String, Object> orders = new HashMap<>();
        orders.put("amount", 18520);
        orders.put("percent", 9);

        statValues.put("revenue", revenue);
        statValues.put("customers", customers);
        statValues.put("orders", orders);

        // Gửi phản hồi
        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(gson.toJson(statValues));
    }
}
