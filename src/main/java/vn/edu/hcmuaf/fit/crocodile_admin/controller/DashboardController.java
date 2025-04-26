package vn.edu.hcmuaf.fit.crocodile_admin.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "DashboardController", value = "/admin/")
public class DashboardController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // doanh thu
        int revenueThisMonth = 50120220;
        double revenueChangePercent = -7;

        // khach hang
        int activeCustomersThisMonth = 36254;
        double activeCustomersChangePercent = 13;

        // don hang
        int ordersThisMonth = 18520;
        double ordersChangePercent = 9;

        request.setAttribute("revenueThisMonth", revenueThisMonth);
        request.setAttribute("revenueChangePercent", revenueChangePercent);
        request.setAttribute("activeCustomersThisMonth", activeCustomersThisMonth);
        request.setAttribute("activeCustomersChangePercent", activeCustomersChangePercent);
        request.setAttribute("ordersThisMonth", ordersThisMonth);
        request.setAttribute("ordersChangePercent", ordersChangePercent);

        request.getRequestDispatcher("/admin/views/dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
