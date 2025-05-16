package vn.edu.hcmuaf.fit.crocodile_admin.controller.CRUD.log.api;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.crocodile.dao.log.LogDAO;
import vn.edu.hcmuaf.fit.crocodile.dao.log.LogEventDetail;
import vn.edu.hcmuaf.fit.crocodile.service.LogService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet(value = "/api/admin/log-detail")
public class LogDetailAPI extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        LogService logService = new LogService(new LogDAO());

        String eventIdParam = req.getParameter("eventId");
        int eventId = Integer.parseInt(eventIdParam);

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.setLocale(req.getLocale());

        LogEventDetail detail = logService.getLogDetailByEventId(eventId);
        if(detail == null) {
            JsonObject errorResponse = new JsonObject();
            errorResponse.addProperty("id", eventId);
            errorResponse.addProperty("message", "Không tìm thấy chi tiết cho eventId: " + eventId);
            resp.setStatus(HttpServletResponse.SC_NOT_FOUND);
            resp.getWriter().write(new Gson().toJson(errorResponse));
            return;
        }
        System.out.printf("%s, %s, %s",detail.getTableName(), detail.getOldId(), detail.getNewId());
        List<Map<String, Object>> resultSet = logService.findOldAndNew(detail.getTableName(), detail.getOldId(), detail.getNewId());
        if(resultSet.isEmpty()) {
            resp.setStatus(HttpServletResponse.SC_NOT_FOUND);
            resp.getWriter().write("{\"error\": \"Không tìm thấy dữ liệu cho eventId: " + eventId + "\"}");
            return;
        }

        JsonObject jsonResponse = new JsonObject();
        Gson gson = new GsonBuilder().setPrettyPrinting().create();

        jsonResponse.add("metadata", gson.toJsonTree(detail));

        // Thêm keys
        ArrayList<String> keys = new ArrayList<>(resultSet.get(0).keySet());
        JsonArray keysArray = new JsonArray();
        keys.forEach(keysArray::add);
        jsonResponse.add("keys", keysArray);

        // Thêm values
        JsonArray valuesArray = gson.toJsonTree(resultSet).getAsJsonArray();
        jsonResponse.add("values", valuesArray);

        resp.setStatus(HttpServletResponse.SC_OK);
        resp.getWriter().write(gson.toJson(jsonResponse));
    }
}
