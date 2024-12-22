package vn.edu.hcmuaf.fit.crocodile_admin.controller.CRUD.category;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.crocodile.service.CategoryService;

import java.io.IOException;

@WebServlet(name = "CategoryController", value = "/admin/category")
public class CategoryController extends HttpServlet {
    private final CategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("categories", categoryService.getAllCategoryAdmin());

        request.getRequestDispatcher("/admin/views/crud/category/category.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
