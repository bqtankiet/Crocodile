package vn.edu.hcmuaf.fit.crocodile_admin.controller.CRUD.category;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.crocodile.dao.category.ICategoryDao;
import vn.edu.hcmuaf.fit.crocodile.dao.category.CategoryDao;
import vn.edu.hcmuaf.fit.crocodile.service.CategoryService;

import java.io.IOException;

@WebServlet(name = "DeleteCategoryController", value = "/admin/category/delete")
public class DeleteCategoryController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            CategoryService categoryService = new CategoryService();
            categoryService.deleteCategory(id);
            System.out.println("Delete category with id: " + id);
            response.getWriter().write("{\"status\":\"success\"}");
        } catch (NumberFormatException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("{\"status\":\"error\", \"message\":\"Invalid category ID.\"}");
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"status\":\"error\", \"message\":\"An error occurred.\"}");
        }
    }
}
