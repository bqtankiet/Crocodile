package vn.edu.hcmuaf.fit.crocodile_admin.controller.CRUD.user;

import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;
import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDao;
import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDaoImpl;
import vn.edu.hcmuaf.fit.crocodile.model.entity.User;
import vn.edu.hcmuaf.fit.crocodile.service.UserService;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.Optional;
import java.util.stream.Collectors;

@WebServlet(name = "UpdateUserController", value = "/admin/user/update")
public class UpdateUserController extends HttpServlet {
    UserService userService = new UserService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        int id = Integer.parseInt(request.getParameter("id"));
//        UserDaoImpl userService = new UserDaoImpl();
//        Optional<User> optUser = userService.findById(id);
//        optUser.ifPresent(user -> request.setAttribute("user", user));
//
//        request.getRequestDispatcher("/admin/views/crud/user/update.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        BufferedReader reader = new BufferedReader(request.getReader());
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }
        String jsonInput = sb.toString();

        JSONObject jsonObject = new JSONObject(jsonInput);

        try {
            int id = jsonObject.getInt("id");
            String fullname = jsonObject.getString("fullname");
            String email = jsonObject.getString("email");
            String phoneNumber = jsonObject.getString("phoneNumber");
            String gender = jsonObject.getString("gender");
            LocalDate birthdate = LocalDate.parse(jsonObject.getString("birthdate"));
            int active = jsonObject.getInt("active");
            int role = jsonObject.getInt("role");

            // Gọi service để cập nhật người dùng
            userService.updateUser(id, fullname, phoneNumber, email, gender, birthdate, active, role);

            // Trả về phản hồi thành công
            response.setStatus(HttpServletResponse.SC_OK);
            response.getWriter().write("{\"message\": \"User updated successfully\"}");
        } catch (Exception e) {
            // Trả về phản hồi lỗi nếu có
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("{\"error\": \"Invalid input data\"}");
        }
    }



}
