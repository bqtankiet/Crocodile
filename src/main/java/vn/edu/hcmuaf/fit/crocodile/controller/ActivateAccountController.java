package vn.edu.hcmuaf.fit.crocodile.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.crocodile.dao.token.TokenDao;
import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDaoImpl;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Token;

import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet(name = "ActivateAccountController", urlPatterns = {"/activate"})
public class ActivateAccountController extends HttpServlet {
    private final TokenDao tokenDao = new TokenDao();
    private final UserDaoImpl userDao = new UserDaoImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String tokenValue = request.getParameter("token");
        String forwardUrl = request.getParameter("forwardUrl");
        request.setAttribute("forwardUrl", forwardUrl);

        // Kiểm tra token có được cung cấp không
        if (tokenValue == null || tokenValue.trim().isEmpty()) {
            request.setAttribute("messageType", "error");
            request.setAttribute("message", "Token không hợp lệ hoặc không được cung cấp.");
            request.getRequestDispatcher("/views/activation-result.jsp").forward(request, response);
            return;
        }

        try {
            // Tìm token trong database
            Token token = tokenDao.findByToken(tokenValue);

            if (token == null) {
                // Token không tồn tại
                request.setAttribute("messageType", "error");
                request.setAttribute("message", "Token không tồn tại hoặc đã bị xóa.");
                request.getRequestDispatcher("/views/activation-result.jsp").forward(request, response);
                return;
            }

            // Kiểm tra token đã được sử dụng chưa
            if (token.getStatus() == 1) {
                request.setAttribute("messageType", "error");
                request.setAttribute("message", "Token đã được sử dụng trước đó. Tài khoản của bạn có thể đã được kích hoạt.");
                request.getRequestDispatcher("/views/activation-result.jsp").forward(request, response);
                return;
            }

            // Kiểm tra token có hết hạn không
            if (token.isExpired()) {
                request.setAttribute("messageType", "error");
                request.setAttribute("message", "Token đã hết hạn. Vui lòng đăng ký lại để nhận token mới.");
                request.getRequestDispatcher("/views/activation-result.jsp").forward(request, response);
                return;
            }

            // Kiểm tra loại token có đúng không
            if (token.getTokenType() != Token.TokenType.VERIFY_ACCOUNT) {
                request.setAttribute("messageType", "error");
                request.setAttribute("message", "Token không đúng loại để xác thực tài khoản.");
                request.getRequestDispatcher("/views/activation-result.jsp").forward(request, response);
                return;
            }

            // Kích hoạt tài khoản người dùng
            userDao.activateUser(token.getIdUser());

            // Cập nhật trạng thái token thành đã sử dụng
            tokenDao.updateTokenStatus(tokenValue, 1);

            // Thành công
            request.setAttribute("messageType", "success");
            request.setAttribute("message", "Chúc mừng! Tài khoản của bạn đã được kích hoạt thành công. Bạn có thể đăng nhập và bắt đầu mua sắm ngay bây giờ.");
            request.getRequestDispatcher("/views/activation-result.jsp").forward(request, response);

        } catch (Exception e) {
            // Xử lý lỗi hệ thống
            System.err.println("Error during account activation: " + e.getMessage());
            e.printStackTrace();

            request.setAttribute("messageType", "error");
            request.setAttribute("message", "Đã xảy ra lỗi hệ thống khi kích hoạt tài khoản. Vui lòng thử lại sau hoặc liên hệ bộ phận hỗ trợ.");
            request.getRequestDispatcher("/views/activation-result.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Chuyển hướng POST requests sang GET
        doGet(request, response);
    }
}