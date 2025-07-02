package vn.edu.hcmuaf.fit.crocodile.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.crocodile.dao.token.TokenDao;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Token;
import vn.edu.hcmuaf.fit.crocodile.model.entity.User;
import vn.edu.hcmuaf.fit.crocodile.service.AuthenticationService;
import vn.edu.hcmuaf.fit.crocodile.service.SendEmailService;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.UUID;

@WebServlet(name = "SignupController", urlPatterns = {"/signup"})
public class SignupController extends HttpServlet {
    private final AuthenticationService auth = new AuthenticationService();
    private final SendEmailService sendEmailService = new SendEmailService();
    private final TokenDao tokenDao = new TokenDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/views/signup.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy thông tin từ request
        String fullName = request.getParameter("fullName");
        String gender = "NAM".equalsIgnoreCase(request.getParameter("gender")) ? "NAM" :
                "NỮ".equalsIgnoreCase(request.getParameter("gender")) ? "NỮ" : "KHÁC";
        String contact = request.getParameter("contact");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // Kiểm tra mật khẩu khớp
        if (!password.equals(confirmPassword)) {
            sendErrorResponse(response, "Mật khẩu không khớp");
            return;
        }

        // Tạo đối tượng User
        User user = new User();
        user.setFullname(fullName);
        user.setGender(gender);
        user.setPassword(password);

        // ✅ FIX: Set role mặc định là 16 (customer role)
        user.setRole(16); // Role 16 cho customer

        // Xác định email hay số điện thoại
        boolean isEmail = !contact.matches("^0\\d{9,10}$");
        if (isEmail) {
            user.setEmail(contact);
            user.setPhoneNumber("");
            user.setActive(0); // Chưa kích hoạt
        } else {
            user.setPhoneNumber(contact);
            user.setEmail("");
            user.setActive(1); // Đã kích hoạt
        }

        // Thực hiện đăng ký
        int userId = auth.signup(user);
        if (userId > 0) {
            if (isEmail) {
                // Tạo token kích hoạt
                String tokenValue = UUID.randomUUID().toString();
                LocalDateTime expiresAt = LocalDateTime.now().plusHours(24);
                Token activationToken = new Token();
                activationToken.setIdUser(userId);
                activationToken.setToken(tokenValue);
                activationToken.setTokenType(Token.TokenType.VERIFY_ACCOUNT);
                activationToken.setExpiresAt(expiresAt);
                activationToken.setCreatedAt(LocalDateTime.now());
                activationToken.setStatus(0);
                tokenDao.insertToken(activationToken);

                // Gửi email kích hoạt
                String activationLink = "http://localhost:8080/activate?token=" + tokenValue;
                boolean emailSent = sendEmailService.sendWelcomeEmail(user.getEmail(), fullName, activationLink);
                if (emailSent) {
                    // Thêm thuộc tính để hiển thị modal thành công
                    request.setAttribute("success", true);
                    request.getRequestDispatcher("/views/signup.jsp").forward(request, response);
                    return;
                } else {
                    System.err.println("Không thể gửi email kích hoạt tới: " + user.getEmail());
                }
            }
            // Trả về phản hồi nếu không phải email (số điện thoại)
            String message = isEmail ? "Đăng ký thành công! Vui lòng kiểm tra email để kích hoạt tài khoản." : "Đăng ký thành công!";
            sendSuccessResponse(response, message);
        } else {
            sendErrorResponse(response, "Đăng ký thất bại, vui lòng thử lại.");
        }
    }

    private void sendSuccessResponse(HttpServletResponse response, String message) throws IOException {
        response.setContentType("application/json");
        response.getWriter().write("{\"status\": \"success\", \"message\": \"" + message + "\"}");
    }

    private void sendErrorResponse(HttpServletResponse response, String message) throws IOException {
        response.setContentType("application/json");
        response.getWriter().write("{\"status\": \"error\", \"message\": \"" + message + "\"}");
    }
}