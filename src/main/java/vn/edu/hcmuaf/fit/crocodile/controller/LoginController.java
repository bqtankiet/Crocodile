package vn.edu.hcmuaf.fit.crocodile.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.crocodile.service.Authentication;

import java.io.IOException;

@WebServlet(name = "SignupController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {
    private final Authentication auth = new Authentication();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        int userId = auth.login(username, password);

        if (userId > 0) {
            HttpSession session = request.getSession();
            session.setAttribute("userId", userId);
            response.sendRedirect("/views/home.jsp");

        } else {
            request.setAttribute("errorMessage", "Sai Tài Khoản Hoặc Mật Khẩu");
            request.getRequestDispatcher("/views/login.jsp").forward(request, response);

        }
    }
}