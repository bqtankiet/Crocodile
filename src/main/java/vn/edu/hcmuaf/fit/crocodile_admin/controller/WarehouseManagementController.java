package vn.edu.hcmuaf.fit.crocodile_admin.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.crocodile.service.InventoryService;

import java.io.IOException;

@WebServlet(name = "WarehouseManagement", value = "/admin/warehouse-management")
public class WarehouseManagementController extends HttpServlet {
    InventoryService inventoryService = new InventoryService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("inventoryHistory", inventoryService.getInventoryHistory());
        request.getRequestDispatcher("/admin/views/warehouse-management.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
