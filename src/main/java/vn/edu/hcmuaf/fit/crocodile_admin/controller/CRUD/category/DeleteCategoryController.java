package vn.edu.hcmuaf.fit.crocodile_admin.controller.CRUD.category;

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
        try {
            int id = Integer.parseInt(request.getParameter("cid"));
            CategoryDao dao = new CategoryDaoImpl();
            dao.deleteCategory(15);
            System.out.println("Delete category with id: " + request.getParameter("cid"));
            request.getRequestDispatcher("/admin/views/category.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid category ID.");
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
