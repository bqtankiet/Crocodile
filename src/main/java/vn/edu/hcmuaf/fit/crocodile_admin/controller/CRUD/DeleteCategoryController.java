package vn.edu.hcmuaf.fit.crocodile_admin.controller.CRUD;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.crocodile.dao.category.CategoryDao;
import vn.edu.hcmuaf.fit.crocodile.dao.category.CategoryDaoImpl;

import java.io.IOException;

@WebServlet(name = "DeleteCategoryController", value = "/admin/category/delete")
public class DeleteCategoryController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id  = Integer.parseInt(request.getParameter("cid"));
        CategoryDao dao = new CategoryDaoImpl();
        dao.deleteCategory(id);
        response.sendRedirect("/admin/category");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
