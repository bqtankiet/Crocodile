package vn.edu.hcmuaf.fit.crocodile_admin.controller.dashboard;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.IOException;

@WebServlet(urlPatterns = "/admin/dashboard/chartValues")
public class DashboardChartValues extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.getWriter().write(responseChartValues());
    }

    // api response
    private String responseChartValues() {
        JSONArray jsonArray = new JSONArray();
        jsonArray.put(65000);
        jsonArray.put(10000);
        jsonArray.put(82000);
        jsonArray.put(81250);
        jsonArray.put(56600);
        jsonArray.put(89000);
        jsonArray.put(40000);
        jsonArray.put(32000);
        jsonArray.put(65000);
        jsonArray.put(JSONObject.NULL);
        jsonArray.put(JSONObject.NULL);
        jsonArray.put(JSONObject.NULL);
        return jsonArray.toString();
    }
}
