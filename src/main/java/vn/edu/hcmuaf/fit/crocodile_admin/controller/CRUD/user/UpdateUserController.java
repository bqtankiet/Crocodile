package vn.edu.hcmuaf.fit.crocodile_admin.controller.CRUD.user;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.crocodile.service.UserService;

import java.io.IOException;

@WebServlet(name = "UpdateUserController", value = "/admin/user/update")
public class UpdateUserController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserService userService = new UserService();

        int id = Integer.parseInt(request.getParameter("id"));
        String action = request.getParameter("action");

        // Ban user
        if ("ban".equals(action)) userService.banUser(id);

        request.getRequestDispatcher("/admin/views/crud/user/user.jsp").forward(request, response);
   }

}
