import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDaoImpl;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Address;
import vn.edu.hcmuaf.fit.crocodile.model.entity.User;
import vn.edu.hcmuaf.fit.crocodile.service.SendEmailService;

public class AddressTest {
    public static void main(String[] args) {
        User user = new User();
        SendEmailService sendEmailService = new SendEmailService();
        String email = "danganhkiet2004lk@gmail.com";
        String subject = "Welcome To Crocodile!";
        String content = getHtmlWelcome(user.getFullname());
        boolean success = sendEmailService.sendEmail(email, subject, content, SendEmailService.CONTENT_TYPE_HTML_UTF8);
        if (success) {
            System.out.println("Send email successful");
        }

    }


    private static String getHtmlWelcome(String userName) {
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
