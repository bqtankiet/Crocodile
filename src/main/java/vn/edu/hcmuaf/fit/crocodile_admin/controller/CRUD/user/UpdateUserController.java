package vn.edu.hcmuaf.fit.crocodile_admin.controller.CRUD.user;

import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDao;
import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDaoImpl;
import vn.edu.hcmuaf.fit.crocodile.model.entity.User;
import vn.edu.hcmuaf.fit.crocodile.service.UserService;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.Optional;
import java.util.stream.Collectors;

@WebServlet(name = "UpdateUserController", value = "/admin/user/update")
public class UpdateUserController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        UserDaoImpl userService = new UserDaoImpl();
        Optional<User> optUser = userService.findById(id);
        optUser.ifPresent(user -> request.setAttribute("user", user));

        request.getRequestDispatcher("/admin/views/crud/user/update.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("update");
        BufferedReader reader = request.getReader();
        String json = reader.lines().collect(Collectors.joining());
        System.out.println(json);

        response.setContentType("application/json");
        response.getWriter().write("{\"message\": \"Cập nhật thành công!\"}");
   }

}
