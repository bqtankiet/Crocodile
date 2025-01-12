package vn.edu.hcmuaf.fit.crocodile.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDao;
import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDaoImpl;
import vn.edu.hcmuaf.fit.crocodile.model.entity.User;
import vn.edu.hcmuaf.fit.crocodile.service.AuthenticationService;

import java.io.IOException;
import java.util.Optional;

@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {
    private final AuthenticationService auth = new AuthenticationService();
    private static final UserDao userDao = new UserDaoImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        int userId = auth.login(username, password);

        if (userId != -1) {
            // Lấy thông tin người dùng
            UserDao userDao = new UserDaoImpl();
            Optional<User> optionalUser = userDao.findById(userId);

            if (optionalUser.isPresent()) {
                User user = optionalUser.get();
                HttpSession session = request.getSession();
                session.setAttribute("userId", userId);
                session.setAttribute("userName", user.getUsername());
                session.setAttribute("fullName", user.getFullname() != null ? user.getFullname() : "");
                session.setAttribute("email", user.getEmail());
                session.setAttribute("gender", user.getGender() != null ? user.getGender() : "");
                session.setAttribute("phone", user.getPhoneNumber() != null ? user.getPhoneNumber() : "");
                session.setAttribute("birthDate", user.getBirthdate());

                // Đoạn mã xử lý gender
                String gender = user.getGender();
                String genderDisplay = "";

                if ("NAM".equals(gender)) {
                    genderDisplay = "Nam";
                } else if ("NỮ".equals(gender)) {
                    genderDisplay = "Nữ";
                } else if ("KHÁC".equals(gender)) {
                    genderDisplay = "Khác";
                }

                session.setAttribute("gender", genderDisplay);

                response.sendRedirect(request.getContextPath() + "/");
            } else {
                request.setAttribute("errorMessage", "Không tìm thấy thông tin người dùng.");
                request.getRequestDispatcher("/views/login.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("errorMessage", "Sai Tài Khoản Hoặc Mật Khẩu.");
            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
        }
    }
}