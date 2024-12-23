package vn.edu.hcmuaf.fit.crocodile_admin.controller.CRUD.category;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.crocodile.dao.category.CategoryDao;
import vn.edu.hcmuaf.fit.crocodile.service.CategoryService;

import java.io.IOException;


@WebServlet(name = "UpdateCategoryController", value = "/admin/category/update")
public class UpdateCategoryController extends HttpServlet {
    CategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("category", categoryService.getCategoryById(id));
        request.getRequestDispatcher("/admin/views/crud/category/update.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String image = request.getParameter("image");
        int active = Integer.parseInt(request.getParameter("active"));

        categoryService.updateCategory(id, name, image, active);
        System.out.println("Update category successful");
        response.sendRedirect(request.getContextPath() + "/admin/category");
    }
}
