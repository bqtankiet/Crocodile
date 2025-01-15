package vn.edu.hcmuaf.fit.crocodile_admin.controller.CRUD.product;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.crocodile.service.ProductService;

import java.io.IOException;

@WebServlet(name = "DeleteProductController", value = "/admin/product/delete")
public class DeleteProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            ProductService productService = new ProductService();
            boolean success = productService.deleteProduct(id) != 0;
            System.out.println("Delete category with id: " + id);
            if (success) {
                response.getWriter().write("{\"status\":\"success\"}");
            }
        } catch (NumberFormatException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("{\"status\":\"error\", \"message\":\"Invalid product ID.\"}");
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"status\":\"error\", \"message\":\"An error occurred.\"}");
        }
    }
}