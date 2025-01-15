package vn.edu.hcmuaf.fit.crocodile.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.crocodile.service.AuthenticationService;

import java.io.IOException;

@WebServlet(name = "PasswordChangeController", urlPatterns = {"/password-change"})
public class PasswordChangeController extends HttpServlet {
    private AuthenticationService authenticationService;

    @Override
    public void init() throws ServletException {
        authenticationService = new AuthenticationService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String currentPassword = request.getParameter("current-password");
        String newPassword = request.getParameter("new-password");
        String confirmPassword = request.getParameter("new-password-check");

        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId != null) {
            if (authenticationService.checkCurrentPassword(userId, currentPassword)) {
                if (newPassword.equals(confirmPassword)) {
                    if (authenticationService.updatePassword(userId, newPassword)) {
                        request.setAttribute("success", "Mật khẩu đã được thay đổi thành công!");
                    } else {
                        request.setAttribute("fail", "Lỗi khi cập nhật mật khẩu.");
                    }
                } else {
                    request.setAttribute("fail", "Mật khẩu mới và xác nhận mật khẩu không khớp.");
                }
            } else {
                request.setAttribute("fail", "Mật khẩu hiện tại không đúng.");
            }
        } else {
            response.sendRedirect("/login.jsp");
            return;
        }

        request.getRequestDispatcher("/views/user.jsp").forward(request, response);
    }
}
