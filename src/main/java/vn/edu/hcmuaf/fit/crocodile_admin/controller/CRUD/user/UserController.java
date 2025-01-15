package vn.edu.hcmuaf.fit.crocodile_admin.controller.CRUD.user;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.crocodile.dao.user.IUserDao;
import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDao;
import vn.edu.hcmuaf.fit.crocodile.model.entity.User;
import vn.edu.hcmuaf.fit.crocodile.service.UserService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserManagementController", value = "/admin/user")
public class UserController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserService userService = new UserService();
        List<User> listUser = userService.getAllUser();
        System.out.println("[log] UserController");
        System.out.println(listUser);
        request.setAttribute("listUser", listUser);
        request.getRequestDispatcher("/admin/views/crud/user/user.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
