package vn.edu.hcmuaf.fit.crocodile.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.crocodile.service.AuthenticationService;

import java.io.IOException;

@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {
    private final AuthenticationService auth = new AuthenticationService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        int userId = auth.login(username, password);
        if (userId == 1) {
            HttpSession session = request.getSession();
            session.setAttribute("userId", userId);
            session.setAttribute("userName", username);
            System.out.println("Chuyển hướng đến home.jsp");
            response.sendRedirect(request.getContextPath() + "/");

        } else {
            System.out.println("Đăng nhập thất bại");
            request.setAttribute("errorMessage", "Sai Tài Khoản Hoặc Mật Khẩu");
            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
        }


    }


}