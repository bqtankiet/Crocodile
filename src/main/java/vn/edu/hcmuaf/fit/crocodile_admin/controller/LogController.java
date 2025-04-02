package vn.edu.hcmuaf.fit.crocodile_admin.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.crocodile.dao.log.LogDAO;
import vn.edu.hcmuaf.fit.crocodile.dao.log.LogEvent;
import vn.edu.hcmuaf.fit.crocodile.service.LogService;

import java.io.IOException;
import java.util.List;

@WebServlet(value = "/admin/log")
public class LogController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        LogService service = new LogService(new LogDAO());
        List<LogEvent> listLog = service.reportLogEvents();
        req.setAttribute("listLog", listLog);
        req.getRequestDispatcher("/admin/views/log.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
