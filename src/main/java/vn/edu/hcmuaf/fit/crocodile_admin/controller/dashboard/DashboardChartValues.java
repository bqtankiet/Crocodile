package vn.edu.hcmuaf.fit.crocodile_admin.controller.dashboard;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;
import vn.edu.hcmuaf.fit.crocodile.service.DashboardService;

import java.io.IOException;
import java.util.List;
import java.util.Objects;

@WebServlet(urlPatterns = "/admin/dashboard/chartValues")
public class DashboardChartValues extends HttpServlet {
    private final DashboardService service = new DashboardService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.getWriter().write(responseChartValues());
    }

    // api response
    private String responseChartValues() {
        List<Long> monthlyRevenue = service.getMonthlyRevenue(2025);
        JSONArray jsonArray = new JSONArray();
        for(Long total: monthlyRevenue) {
            jsonArray.put(Objects.requireNonNullElse(total, JSONObject.NULL));
        }

//        jsonArray.put(65000);
//        jsonArray.put(10000);
//        jsonArray.put(82000);
//        jsonArray.put(81250);
//        jsonArray.put(56600);
//        jsonArray.put(89000);
//        jsonArray.put(40000);
//        jsonArray.put(32000);
//        jsonArray.put(65000);
//        jsonArray.put(JSONObject.NULL);
//        jsonArray.put(JSONObject.NULL);
//        jsonArray.put(JSONObject.NULL);
        return jsonArray.toString();
    }
}
