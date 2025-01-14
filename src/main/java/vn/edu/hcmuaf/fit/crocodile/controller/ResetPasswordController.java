package vn.edu.hcmuaf.fit.crocodile.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Token;
import vn.edu.hcmuaf.fit.crocodile.service.TokenService;

import java.io.IOException;

@WebServlet(name = "ResetPasswordController", urlPatterns = {"/reset-password"})
public class ResetPasswordController extends HttpServlet {
    TokenService tokenService = new TokenService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tokenParam = request.getParameter("token");
        if (tokenParam == null || tokenParam.isEmpty()) {
            request.setAttribute("error", "Token không hợp lệ!");
            request.getRequestDispatcher("/views/forget-password.jsp").forward(request, response);
            return;
        }
        Token token = tokenService.getByToken(tokenParam);
        if (token != null && token.isActive() && !token.isExpired()) {
            request.getRequestDispatcher("/views/reset-password.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Đường link hết hạn hoặc không còn hiệu lực!.");
            request.getRequestDispatcher("/views/forget-password.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}