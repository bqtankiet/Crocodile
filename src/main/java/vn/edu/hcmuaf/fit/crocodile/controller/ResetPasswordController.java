package vn.edu.hcmuaf.fit.crocodile.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Token;
import vn.edu.hcmuaf.fit.crocodile.service.AuthenticationService;
import vn.edu.hcmuaf.fit.crocodile.service.TokenService;

import java.io.IOException;

@WebServlet(name = "ResetPasswordController", urlPatterns = {"/reset-password"})
public class ResetPasswordController extends HttpServlet {
    TokenService tokenService = new TokenService();
    AuthenticationService authenticationService = new AuthenticationService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tokenParam = request.getParameter("token");
        if (tokenParam == null || tokenParam.isEmpty()) {
            request.setAttribute("showEmptyTokenModal", "Token không hợp lệ!");
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
        String newPassword = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        if (newPassword == null || confirmPassword == null || newPassword.isEmpty() || confirmPassword.isEmpty()) {
            request.setAttribute("error", "Vui lòng nhập đủ thông tin.");
            request.getRequestDispatcher("/views/reset-password.jsp").forward(request, response);
            return;
        }

        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("error", "Mật khẩu mới và mật khẩu xác nhận không khớp.");
            request.getRequestDispatcher("/views/reset-password.jsp").forward(request, response);
            return;
        }

        HttpSession session = request.getSession();
        String tokenParam = (String) session.getAttribute("token");
        System.out.println(tokenParam);
        if (tokenParam == null || tokenParam.isEmpty()) {
            request.setAttribute("error", "Phiên làm việc đã hết hạn, vui lòng thử lại.");
            response.sendRedirect("/views/forget-password.jsp");
            return;
        }

        Token token = tokenService.getByToken(tokenParam);
        if (token != null && token.isActive() && !token.isExpired()) {
            int idUser = token.getIdUser();

            boolean success = authenticationService.resetPassword(idUser, newPassword);
            if (success) {
                session.removeAttribute("token");
                request.getRequestDispatcher("/views/login.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Lỗi khi cập nhật mật khẩu.");
                response.sendRedirect("/forget-password");
            }
        }
    }


}