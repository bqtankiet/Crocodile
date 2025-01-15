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
        // Lấy thông tin từ form thay đổi mật khẩu
        String currentPassword = request.getParameter("current-password");
        String newPassword = request.getParameter("new-password");
        String confirmPassword = request.getParameter("new-password-check");

        // Lấy userId từ session (giả sử người dùng đã đăng nhập và có userId trong session)
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        // Kiểm tra nếu userId có trong session
        if (userId != null) {
            // Kiểm tra mật khẩu hiện tại có đúng không
            if (authenticationService.checkCurrentPassword(userId, currentPassword)) {
                // Kiểm tra mật khẩu mới và xác nhận mật khẩu có khớp không
                if (newPassword.equals(confirmPassword)) {
                    // Cập nhật mật khẩu mới vào DB
                    if (authenticationService.updatePassword(userId, newPassword)) {
                        // Thành công, gửi thông báo
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
            // Nếu không có userId trong session, yêu cầu đăng nhập
            response.sendRedirect("/login.jsp");
            return;
        }

        // Trả về kết quả cho trang người dùng mà không cần chuyển hướng
        request.getRequestDispatcher("/views/user.jsp").forward(request, response);
    }
}
