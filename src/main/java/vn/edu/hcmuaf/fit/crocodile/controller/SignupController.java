package vn.edu.hcmuaf.fit.crocodile.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.crocodile.model.entity.User;
import vn.edu.hcmuaf.fit.crocodile.service.AuthenticationService;
import vn.edu.hcmuaf.fit.crocodile.service.SendEmailService;
import vn.edu.hcmuaf.fit.crocodile.service.SendSmsService;

import java.io.IOException;

@WebServlet(name = "SignupController", urlPatterns = {"/signup"})
public class SignupController extends HttpServlet {
    AuthenticationService auth = new AuthenticationService();
    private final SendEmailService sendEmailService = new SendEmailService();
    private final SendSmsService sendSmsService = new SendSmsService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/signup.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullName = request.getParameter("fullName");
        String gender = request.getParameter("gender"); // male hoặc female
        String contact = request.getParameter("contact").trim(); // email hoặc số điện thoại
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // In ra debug
        System.out.println("Full Name: " + fullName);
        System.out.println("Gender: " + gender);
        System.out.println("Contact: " + contact);
        System.out.println("Password: " + password);
        System.out.println("Confirm Password: " + confirmPassword);

        // Kiểm tra xem contact là số điện thoại hay email
        // Regex cho số điện thoại: từ 10 đến 15 chữ số (bạn có thể chỉnh lại tùy yêu cầu)
        if (contact.matches("^[0-9]{10,15}$")) {
            // Chuyển đổi số điện thoại nếu bắt đầu bằng "0"
            String internationalPhone = contact;
            if (contact.startsWith("0")) {
                internationalPhone = "+84" + contact.substring(1);
            }

            // Sinh OTP 5 chữ số
            String otp = String.valueOf(10000 + (int) (Math.random() * 90000));

            // Lưu các thông tin cần thiết vào session
            HttpSession session = request.getSession();
            session.setAttribute("otp", otp);

            // Lưu thêm timestamp để kiểm tra thời gian hiệu lực OTP (5 phút)
            session.setAttribute("otpTimestamp", System.currentTimeMillis());

            session.setAttribute("userPhone", internationalPhone);
            session.setAttribute("fullName", fullName);
            session.setAttribute("gender", gender);
            session.setAttribute("password", password);

            // Gọi lớp SMS để gửi OTP đến số điện thoại đã chuyển đổi
            SendSmsService.sendOTP(internationalPhone, otp);

            // Chuyển hướng đến trang xác thực OTP
            request.getRequestDispatcher("/views/verify-otp.jsp").forward(request, response);
        } else if (contact.matches("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$")) {
            // Đăng ký bằng email: xử lý theo logic hiện có
            User user = new User();
            user.setFullname(fullName);
            user.setGender(gender);
            user.setEmail(contact);
            user.setPhoneNumber(null);
            user.setPassword(password);

            int result = auth.signup(user);
            String subject = "Welcome To Crocodile!";
            String content = getHtmlWelcome(user.getFullname());
            boolean success = sendEmailService.sendEmail(user.getEmail(), subject, content, SendEmailService.CONTENT_TYPE_HTML_UTF8);
            if (success) {
                System.out.println("Gửi email thành công");
            }
            if (result > 0) {
                response.sendRedirect(request.getContextPath() + "/login");
            } else {
                request.setAttribute("errorMessage", "Đăng ký thất bại. Vui lòng thử lại.");
                request.getRequestDispatcher("/views/signup.jsp").forward(request, response);
            }
        } else {
            // Nếu định dạng contact không hợp lệ
            request.setAttribute("errorMessage", "Địa chỉ email hoặc số điện thoại không hợp lệ.");
            request.getRequestDispatcher("/views/signup.jsp").forward(request, response);
        }
    }

    private String getHtmlWelcome(String userName) {
        String html = """
                <!DOCTYPE html>
                <html>
                <head>
                    <meta charset="UTF-8">
                    <title>Welcome to Crocodile</title>
                </head>
                <body style="font-family: Arial, sans-serif; margin: 0; padding: 0;">
                <table style="width: 600px; margin: 0 auto; border: 1px solid #ddd; border-collapse: collapse;">
                    <!-- Header Image -->
                    <!-- Card Content -->
                    <tr>
                        <td style="padding: 20px;">
                            <h2 style="margin: 0; color: #333333; font-size: 24px; text-align: center; padding: 1rem 0;">
                                Chào mừng %s đến với Crocodile!
                            </h2>
                            <p style="color: #666666; font-size: 0.9rem; line-height: 1.5; margin-top: 10px;">
                                Chúng tôi rất vui mừng khi bạn trở thành một phần của gia đình Crocodile. Hãy tận hưởng hành trình mua sắm đầy thú vị và đẳng cấp tại Crocodile.
                            </p>
                            <p style="color: #666666; font-size: 0.9rem; line-height: 1.5; margin-top: 10px;">
                                Cảm ơn bạn đã tin tưởng và lựa chọn chúng tôi.
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
        return String.format(html, userName);
    }
}
