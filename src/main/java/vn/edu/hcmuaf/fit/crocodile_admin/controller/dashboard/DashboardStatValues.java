package vn.edu.hcmuaf.fit.crocodile_admin.controller.dashboard;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.crocodile.service.DashboardService;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(urlPatterns = "/admin/dashboard/statValues")
public class DashboardStatValues extends HttpServlet {
    private DashboardService dashboardService;

    @Override
    public void init() throws ServletException {
        dashboardService = new DashboardService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Map<String, Object> revenueChange = dashboardService.getRevenueChange();
        Map<String, Object> orderChange = dashboardService.getOrderChange();
        Map<String, Object> customerChange = dashboardService.getCustomerChange();

        // Tạo dữ liệu thống kê
        Map<String, Object> statValues = new HashMap<>();

        Map<String, Object> revenue = new HashMap<>();
        revenue.put("amount", revenueChange.get("total_this_month"));
        revenue.put("percent", revenueChange.get("change_percent"));

        Map<String, Object> customers = new HashMap<>();
        customers.put("amount", customerChange.get("customers_this_month"));
        customers.put("percent", customerChange.get("change_percent"));

        Map<String, Object> orders = new HashMap<>();
        orders.put("amount", orderChange.get("orders_this_month"));
        orders.put("percent", orderChange.get("change_percent"));

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
