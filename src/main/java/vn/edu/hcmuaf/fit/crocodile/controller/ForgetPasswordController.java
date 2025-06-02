package vn.edu.hcmuaf.fit.crocodile.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDao;
import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDaoImpl;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Token;
import vn.edu.hcmuaf.fit.crocodile.model.entity.User;
import vn.edu.hcmuaf.fit.crocodile.service.AuthenticationService;
import vn.edu.hcmuaf.fit.crocodile.service.SendEmailService;
import vn.edu.hcmuaf.fit.crocodile.service.TokenService;
import vn.edu.hcmuaf.fit.crocodile.util.TokenFactory;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Optional;

import static vn.edu.hcmuaf.fit.crocodile.util.TokenFactory.generateToken;

@WebServlet(name = "ForgetPasswordController", urlPatterns = {"/forget-password"})
public class ForgetPasswordController extends HttpServlet {
    private UserDao userDao;
    private final AuthenticationService auth = new AuthenticationService();
    private final SendEmailService sendEmailService = new SendEmailService();
    private final TokenService tokenService = new TokenService();


    @Override
    public void init() throws ServletException {
        userDao = new UserDaoImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/forget-password.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");

        Optional<User> userOptional = auth.findEmail(email);

        if (userOptional.isPresent()) {
            Token token = TokenFactory.createResetPasswordToken(userOptional.get().getId(), LocalDateTime.now().plusMinutes(15));
            tokenService.insertToken(token);


            request.setAttribute("success", true);
            String link = "http://crocodile.nludemo.id.vn/reset-password?token=" + token.getToken();
            String subject = "Crocodile Verify";
            String content = getHtml(link);
            boolean success = sendEmailService.sendEmail(email, subject, content, SendEmailService.CONTENT_TYPE_HTML_UTF8);
            if (success) {
                System.out.println("Send email successful");
                HttpSession session = request.getSession();
                session.setAttribute("token", token.getToken());

            }

        } else {
            request.setAttribute("error", true);

        }

        request.getRequestDispatcher("/views/forget-password.jsp").forward(request, response);
    }

    private String getHtml(String link) {
        String html = """
                <!DOCTYPE html>
                <html>
                <head>
                    <meta charset="UTF-8">
                    <title>Simple Card</title>
                </head>
                <body style="font-family: Arial, sans-serif; margin: 0; padding: 0;">
                <table style="width: 600px; margin: 0 auto; border: 1px solid #ddd; border-collapse: collapse;">
                    <!-- Header Image -->
                    <!-- Card Content -->
                    <tr>
                        <td style="padding: 20px;">
                            <h2 style="margin: 0; color: #333333; font-size: 24px; text-align: center; padding: 1rem 0;">
                                Chào mừng bạn đến với Crocodile!
                            </h2>
                            <p style="color: #666666; font-size: 0.9rem; line-height: 1.5; margin-top: 10px;">
                                Chúng tôi tự hào mang đến cho bạn các sản phẩm đồ da cá sấu cao cấp, từ ví, túi xách, thắt lưng đến phụ kiện thời trang đẳng cấp. Khám phá ngay các bộ sưu tập mới nhất và tận hưởng trải nghiệm mua sắm tuyệt vời tại Crocodile.
                            </p>
                            <p style="margin-top: 20px; text-align: center;">
                                <a href="%s" style="background-color: #007b5f; color: #ffffff; padding: 10px 20px; text-decoration: none; border-radius: 5px; font-size: 16px;">Thiết lập lại mật khẩu</a>
                            </p>
                        </td>
                    </tr>
                    <!-- Footer -->
                    <tr>
                        <td style="background-color: #f4f4f4; padding: 10px; text-align: center; color: #666666; font-size: 12px;">
                            © 2024 Crocodile. Mọi quyền được bảo lưu.
                        </td>
                    </tr>
                </table>
                </body>
                </html>
                """;
        return String.format(html, link);
    }


}
