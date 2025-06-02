package vn.edu.hcmuaf.fit.crocodile.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.crocodile.dao.rolepermission.RolePermissionService;
import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDao;
import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDaoImpl;
import vn.edu.hcmuaf.fit.crocodile.model.entity.User;
import vn.edu.hcmuaf.fit.crocodile.service.AuthenticationService;
import vn.edu.hcmuaf.fit.crocodile.service.SendEmailService;
import vn.edu.hcmuaf.fit.crocodile.service.LoginAttemptService;

import java.io.IOException;
import java.util.Optional;

@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {
    private final AuthenticationService auth = new AuthenticationService();
    private final RolePermissionService permissionService = new RolePermissionService();
    private final SendEmailService emailService = new SendEmailService();
    private final LoginAttemptService loginAttemptService = new LoginAttemptService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String forwardUrl = request.getParameter("forwardUrl");
        request.setAttribute("forwardUrl", forwardUrl);
        request.getRequestDispatcher("/views/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String loginInput = request.getParameter("username");
        String password = request.getParameter("password");
        String clientIP = getClientIP(request);
        String userAgent = request.getHeader("User-Agent");

        // Kiểm tra xem tài khoản có bị khóa không
        if (loginAttemptService.isAccountLocked(loginInput, clientIP)) {
            long remainingTime = loginAttemptService.getRemainingLockTime(loginInput, clientIP);
            request.setAttribute("errorMessage",
                    String.format("Tài khoản tạm thời bị khóa do nhập sai mật khẩu quá nhiều lần. Vui lòng thử lại sau %d phút.",
                            (remainingTime / 60000) + 1));
            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
            return;
        }

        int userId = auth.login(loginInput, password);

        if (userId != -1) {
            if (userId == -2) {
                request.setAttribute("errorMessage", "Tài khoản của bạn đã bị vô hiệu hóa.");
                request.getRequestDispatcher("/views/login.jsp").forward(request, response);
                return;
            }

            // Đăng nhập thành công - reset failed attempts
            loginAttemptService.resetFailedAttempts(loginInput, clientIP);

            UserDao userDao = new UserDaoImpl();
            Optional<User> optionalUser = userDao.findById(userId);

            if (optionalUser.isPresent()) {
                User user = optionalUser.get();
                HttpSession session = request.getSession();

                // Cập nhật session attributes
                session.setAttribute("userId", userId);
                session.setAttribute("loginId", loginInput);
                session.setAttribute("fullName", user.getFullname() != null ? user.getFullname() : "");
                session.setAttribute("email", user.getEmail());
                session.setAttribute("gender", user.getGender() != null ? user.getGender() : "");
                session.setAttribute("phone", user.getPhoneNumber() != null ? user.getPhoneNumber() : "");
                session.setAttribute("birthDate", user.getBirthdate());
                session.setAttribute("role", user.getRole());
                session.setAttribute("permissions", permissionService.getAllPermissionNamesByUserId(userId));

                user.setPassword(null);
                session.setAttribute("user", user);

                // Xử lý hiển thị giới tính
                String genderDisplay = switch (user.getGender()) {
                    case "NAM" -> "Nam";
                    case "NỮ" -> "Nữ";
                    case "KHÁC" -> "Khác";
                    default -> "";
                };
                session.setAttribute("gender", genderDisplay);

                // Xử lý chuyển hướng
                String forwardUrl = request.getParameter("forwardUrl");
                if (forwardUrl != null && !forwardUrl.isBlank()) {
                    response.sendRedirect(forwardUrl);
                    return;
                }

                // Kiểm tra role
                if ("1".equals(user.getRole())) {
                    response.sendRedirect(request.getContextPath() + "/admin");
                } else {
                    response.sendRedirect(request.getContextPath() + "/");
                }
            } else {
                request.setAttribute("errorMessage", "Không tìm thấy thông tin người dùng.");
                request.getRequestDispatcher("/views/login.jsp").forward(request, response);
            }
        } else {
            // Đăng nhập thất bại - ghi nhận failed attempt
            int failedAttempts = loginAttemptService.recordFailedAttempt(loginInput, clientIP, userAgent);

            if (failedAttempts >= 5) {
                // Tài khoản bị khóa - gửi email cảnh báo
                UserDao userDao = new UserDaoImpl();
                Optional<User> optionalUser = userDao.findByEmailOrPhone(loginInput);

                if (optionalUser.isPresent()) {
                    User user = optionalUser.get();
                    sendSecurityAlertEmail(user, clientIP, userAgent);
                }

                request.setAttribute("errorMessage",
                        "Tài khoản tạm thời bị khóa 15 phút do nhập sai mật khẩu 5 lần liên tục. Email cảnh báo đã được gửi.");
            } else {
                int remainingAttempts = 5 - failedAttempts;
                request.setAttribute("errorMessage",
                        String.format("Sai thông tin đăng nhập hoặc mật khẩu. Còn %d lần thử.", remainingAttempts));
            }

            request.setAttribute("loginError", true);
            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
        }
    }

    private String getClientIP(HttpServletRequest request) {
        String xForwardedFor = request.getHeader("X-Forwarded-For");
        if (xForwardedFor != null && !xForwardedFor.isEmpty()) {
            return xForwardedFor.split(",")[0].trim();
        }

        String xRealIP = request.getHeader("X-Real-IP");
        if (xRealIP != null && !xRealIP.isEmpty()) {
            return xRealIP;
        }

        return request.getRemoteAddr();
    }

    private void sendSecurityAlertEmail(User user, String clientIP, String userAgent) {
        if (user.getEmail() != null && !user.getEmail().trim().isEmpty()) {
            String subject = "Cảnh báo bảo mật tài khoản Crocodile";
            String content = emailService.getSecurityAlertEmailContent(
                    user.getFullname() != null ? user.getFullname() : user.getUsername(),
                    clientIP,
                    userAgent,
                    java.time.LocalDateTime.now()
            );

            // Gửi email không đồng bộ để không làm chậm response
            new Thread(() -> {
                emailService.sendEmail(user.getEmail(), subject, content, SendEmailService.CONTENT_TYPE_HTML_UTF8);
            }).start();
        }
    }
}