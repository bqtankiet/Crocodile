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

        // Kiểm tra token có được cung cấp không
        if (tokenValue == null || tokenValue.trim().isEmpty()) {
            redirectToErrorPage(request, response, "Token không hợp lệ!");
            return;
        }

        // Tìm token trong database
        Token token = tokenDao.findByToken(tokenValue);

        if (token == null) {
            redirectToErrorPage(request, response, "Token không tồn tại!");
            return;
        }

        // Kiểm tra token đã được sử dụng chưa
        if (token.getStatus() == 1) {
            redirectToErrorPage(request, response, "Token đã được sử dụng!");
            return;
        }

        // Kiểm tra token có hết hạn không
        if (token.getExpiresAt().isBefore(LocalDateTime.now())) {
            redirectToErrorPage(request, response, "Token đã hết hạn!");
            return;
        }

        // Kiểm tra loại token có đúng không
        if (!Token.TokenType.VERIFY_ACCOUNT.equals(token.getTokenType())) {
            redirectToErrorPage(request, response, "Token không hợp lệ cho việc kích hoạt tài khoản!");
            return;
        }

        try {
            // Kích hoạt tài khoản người dùng
            userDao.activateUser(token.getIdUser());

            // Cập nhật trạng thái token thành đã sử dụng
            tokenDao.updateTokenStatus(tokenValue, 1);

            // Chuyển hướng đến trang thành công hoặc trang chủ
            request.getRequestDispatcher("/views/home.jsp").forward(request, response);

        } catch (Exception e) {
            System.err.println("Lỗi khi kích hoạt tài khoản: " + e.getMessage());
            redirectToErrorPage(request, response, "Có lỗi xảy ra khi kích hoạt tài khoản!");
        }
    }

    private void redirectToSuccessPage(HttpServletRequest request, HttpServletResponse response, String message)
            throws ServletException, IOException {
        // Có thể chuyển hướng trực tiếp đến trang chủ
        response.sendRedirect(request.getContextPath() + "/" + java.net.URLEncoder.encode(message, "UTF-8"));

    }

    private void redirectToErrorPage(HttpServletRequest request, HttpServletResponse response, String message)
            throws ServletException, IOException {
        // Chuyển hướng đến trang lỗi với thông báo
        request.setAttribute("message", message);
        request.setAttribute("messageType", "error");
        request.getRequestDispatcher("/views/activation-result.jsp").forward(request, response);
    }
}