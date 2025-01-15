package vn.edu.hcmuaf.fit.crocodile.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.crocodile.model.entity.User;
import vn.edu.hcmuaf.fit.crocodile.service.AuthenticationService;
import vn.edu.hcmuaf.fit.crocodile.service.SendEmailService;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet(name = "SignupController", urlPatterns = {"/signup"})
public class SignupController extends HttpServlet {
    AuthenticationService auth = new AuthenticationService();
    private final SendEmailService sendEmailService = new SendEmailService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/signup.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");

        String day = String.format("%02d", Integer.parseInt(request.getParameter("day")));
        String month = String.format("%02d", Integer.parseInt(request.getParameter("month")));
        String year = request.getParameter("year");

        String birthdate = year + "-" + month + "-" + day;

        String gender = request.getParameter("gender");
        String username = request.getParameter("username");
        String emailOrPhone = request.getParameter("email").trim();
        String password = request.getParameter("password");

        User user = new User();
        user.setFullname(firstName + " " + lastName);
        user.setBirthdate(LocalDate.parse(birthdate));
        user.setUsername(username);
        user.setPassword(password);

        if (gender != null) {
            user.setGender(gender);
        }

        if (emailOrPhone.matches("^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$")) {
            user.setEmail(emailOrPhone);
            user.setPhoneNumber(null);
        } else if (emailOrPhone.matches("^[0-9]{10,15}$")) {
            user.setPhoneNumber(emailOrPhone);
            user.setEmail(null);
        }

        int result = auth.signup(user);
        String subject = "Welcome To Crocodile!";
        String content = getHtmlWelcome(user.getFullname());
        boolean success = sendEmailService.sendEmail(user.getEmail(), subject, content, SendEmailService.CONTENT_TYPE_HTML_UTF8);
        if (success) {
            System.out.println("Send email successful");
        }
        if (result > 0) {
            response.sendRedirect(request.getContextPath() + "/login");
        } else {
            request.setAttribute("errorMessage", "Đăng ký thất bại. Vui lòng thử lại.");
            request.getRequestDispatcher("/views/signup.jsp").forward(request, response);
        }
    }

    private String getHtmlWelcome(String userName) {
        String html = """
                <!DOCTYPE html>
                <html>
                <head>
                    <meta charset=\"UTF-8\">
                    <title>Welcome to Crocodile</title>
                </head>
                <body style=\"font-family: Arial, sans-serif; margin: 0; padding: 0;\">
                <table style=\"width: 600px; margin: 0 auto; border: 1px solid #ddd; border-collapse: collapse;\">
                    <!-- Header Image -->
                    <!-- Card Content -->
                    <tr>
                        <td style=\"padding: 20px;\">
                            <h2 style=\"margin: 0; color: #333333; font-size: 24px; text-align: center; padding: 1rem 0;\">
                                Chào mừng %s đến với Crocodile!
                            </h2>
                            <p style=\"color: #666666; font-size: 0.9rem; line-height: 1.5; margin-top: 10px;\">
                                Chúng tôi rất vui mừng khi bạn trở thành một phần của gia đình Crocodile. Hãy tận hưởng hành trình mua sắm đầy thú vị và đẳng cấp tại Crocodile.
                            </p>
                            <p style=\"color: #666666; font-size: 0.9rem; line-height: 1.5; margin-top: 10px;\">
                                Cảm ơn bạn đã tin tưởng và lựa chọn chúng tôi.
                            </p>
                        </td>
                    </tr>
                    <!-- Footer -->
                    <tr>
                        <td style=\"background-color: #f4f4f4; padding: 10px; text-align: center; color: #666666; font-size: 12px;\">
                            © 2024 Crocodile. Mọi quyền được bảo lưu.
                        </td>
                    </tr>
                </table>
                </body>
                </html>
                """;
        return String.format(html, userName);
    }


}
