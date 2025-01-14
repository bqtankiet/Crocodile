import org.junit.jupiter.api.Test;
import vn.edu.hcmuaf.fit.crocodile.service.SendEmailService;

public class SendEmailServiceTest {

    @Test
    public void test() {
        String link = "crocodile/account-verify?token=123456";
        String recipient = "ahkietlk@gmail.com";
        String subject = "Test Xác Thực Tài Khoản Crocodile";
        String content = getHtml(link);
        SendEmailService service = new SendEmailService();
        boolean success = service.sendEmail(recipient, subject, content, SendEmailService.CONTENT_TYPE_HTML_UTF8);
        if (success) {
            System.out.println("Send email successful");
        }
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
                    <tr>
                        <td>
                            <img src="https://upload.wikimedia.org/wikipedia/commons/7/7a/Crocodile_Singapore_logo.png" alt="Card Header Image" width="auto" height="100" style="display: block; padding-top: 1rem; margin: 0 auto;">
                        </td>
                    </tr>
                    <!-- Card Content -->
                    <tr>
                        <td style="padding: 20px;">
                            <h2 style="margin: 0; color: #333333; font-size: 24px;">Chào mừng bạn đến với Crocodile!</h2>
                            <p style="color: #666666; font-size: 0.9rem; line-height: 1.5; margin-top: 10px;">
                                Chúng tôi tự hào mang đến cho bạn các sản phẩm đồ da cá sấu cao cấp, từ ví, túi xách, thắt lưng đến phụ kiện thời trang đẳng cấp. Khám phá ngay các bộ sưu tập mới nhất và tận hưởng trải nghiệm mua sắm tuyệt vời tại Crocodile.
                            </p>
                            <p style="margin-top: 20px; text-align: center;">
                                <a href="%s" style="background-color: #007b5f; color: #ffffff; padding: 10px 20px; text-decoration: none; border-radius: 5px; font-size: 16px;">Xác thực tài khoản</a>
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
