package vn.edu.hcmuaf.fit.crocodile_admin.controller.CRUD.category;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.crocodile.dao.category.CategoryDao;
import vn.edu.hcmuaf.fit.crocodile.dao.category.CategoryDaoImpl;

import java.io.IOException;

@WebServlet(name = "Insert", value = "/admin/category/insert")
public class InsertCategoryController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/admin/views/crud/category/insert.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CategoryDao dao = new CategoryDaoImpl();
        String name = request.getParameter("name");
        String image = request.getParameter("image");
        int active = Integer.parseInt(request.getParameter("active"));
        dao.insertCategory(name, image, active);
        System.out.println("Insert Category Successfully");
        response.sendRedirect(request.getContextPath() + "/admin/category");
    }
}
