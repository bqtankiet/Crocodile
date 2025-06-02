package vn.edu.hcmuaf.fit.crocodile.service;

import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import vn.edu.hcmuaf.fit.crocodile.config.properties.MailProperties;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class SendEmailService {
    public static final String CONTENT_TYPE_HTML_UTF8 = "text/html; charset=utf-8";
    public static final String CONTENT_TYPE_TEXT_PLAIN = "text/plain";

    private static final String MAIL_FROM = MailProperties.sender();
    private static final String APP_PASSWORD = MailProperties.appPassword();

    private Session getEmailSession() {
        return Session.getInstance(MailProperties.getGmailProperties(), new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(MAIL_FROM, APP_PASSWORD);
            }
        });
    }

    public boolean sendEmail(String recipient, String subject, String content, String contentType) {
        try {
            Message message = new MimeMessage(getEmailSession());
            message.setFrom(new InternetAddress(MAIL_FROM));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipient));
            message.setSubject(subject);
            message.setContent(content, contentType);

            // Gửi email
            Transport.send(message);
            System.out.println("Email sent successfully to: " + recipient);
            return true;
        } catch (MessagingException e) {
            System.err.println("Failed to send email to " + recipient + ": " + e.getMessage());
            return false;
        }
    }

    public boolean sendEmail(String recipient, String subject, String content) {
        return sendEmail(recipient, subject, content, CONTENT_TYPE_TEXT_PLAIN);
    }

    public boolean sendWelcomeEmail(String email, String fullName, String activationLink) {
        if (email == null || email.trim().isEmpty()) {
            System.out.println("No email provided, skipping welcome email.");
            return false;
        }

        String subject = "Chào mừng bạn đến với Crocodile!";
        String content = getHtmlWelcome(fullName, activationLink);

        return sendEmail(email, subject, content, CONTENT_TYPE_HTML_UTF8);
    }

    /**
     * Gửi email cảnh báo bảo mật khi phát hiện spam đăng nhập
     * @param email Email người dùng
     * @param fullName Tên đầy đủ của người dùng
     * @param clientIP Địa chỉ IP của kẻ tấn công
     * @param userAgent User agent của browser
     * @param attemptTime Thời gian xảy ra sự việc
     * @return true nếu gửi thành công
     */
    public boolean sendSecurityAlertEmail(String email, String fullName, String clientIP, String userAgent, LocalDateTime attemptTime) {
        if (email == null || email.trim().isEmpty()) {
            System.out.println("No email provided, skipping security alert email.");
            return false;
        }

        String subject = "🚨 Cảnh báo bảo mật tài khoản Crocodile";
        String content = getSecurityAlertEmailContent(fullName, clientIP, userAgent, attemptTime);

        return sendEmail(email, subject, content, CONTENT_TYPE_HTML_UTF8);
    }

    /**
     * Tạo nội dung email cảnh báo bảo mật
     * @param userName Tên người dùng
     * @param clientIP Địa chỉ IP
     * @param userAgent User agent
     * @param attemptTime Thời gian
     * @return Nội dung HTML email
     */
    public String getSecurityAlertEmailContent(String userName, String clientIP, String userAgent, LocalDateTime attemptTime) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
        String formattedTime = attemptTime.format(formatter);

        String html = """
            <!DOCTYPE html>
            <html>
            <head>
                <meta charset="UTF-8">
                <title>Cảnh báo bảo mật Crocodile</title>
                <style>
                    body { font-family: Arial, sans-serif; margin: 0; padding: 0; background-color: #f5f5f5; }
                    .container { width: 600px; margin: 0 auto; background-color: #ffffff; }
                    .header { background-color: #dc3545; color: white; padding: 20px; text-align: center; }
                    .content { padding: 30px; }
                    .alert-box { background-color: #fff3cd; border: 1px solid #ffeaa7; border-radius: 5px; padding: 15px; margin: 20px 0; }
                    .info-table { width: 100%%; border-collapse: collapse; margin: 20px 0; }
                    .info-table td { padding: 10px; border: 1px solid #ddd; }
                    .info-table .label { background-color: #f8f9fa; font-weight: bold; width: 30%%; }
                    .footer { background-color: #f4f4f4; padding: 15px; text-align: center; color: #666666; font-size: 12px; }
                    .security-tips { background-color: #e7f3ff; border-left: 4px solid #2196F3; padding: 15px; margin: 20px 0; }
                </style>
            </head>
            <body>
            <div class="container">
                <div class="header">
                    <h1 style="margin: 0; font-size: 24px;">🚨 Cảnh báo bảo mật</h1>
                </div>
                
                <div class="content">
                    <h2 style="color: #dc3545;">Xin chào %s,</h2>
                    
                    <div class="alert-box">
                        <strong>⚠️ Phát hiện hoạt động đăng nhập bất thường!</strong><br>
                        Chúng tôi đã phát hiện có người thử đăng nhập vào tài khoản của bạn với mật khẩu sai <strong>5 lần liên tục</strong>. 
                        Tài khoản của bạn đã được khóa tạm thời trong <strong>15 phút</strong> để bảo vệ an toàn.
                    </div>
                    
                    <h3>Thông tin chi tiết:</h3>
                    <table class="info-table">
                        <tr>
                            <td class="label">Thời gian:</td>
                            <td>%s</td>
                        </tr>
                        <tr>
                            <td class="label">Địa chỉ IP:</td>
                            <td>%s</td>
                        </tr>
                        <tr>
                            <td class="label">Thiết bị/Trình duyệt:</td>
                            <td>%s</td>
                        </tr>
                        <tr>
                            <td class="label">Trạng thái:</td>
                            <td><span style="color: #dc3545; font-weight: bold;">Tài khoản tạm khóa 15 phút</span></td>
                        </tr>
                    </table>
                    
                    <div class="security-tips">
                        <h3 style="margin-top: 0;">🛡️ Khuyến nghị bảo mật:</h3>
                        <ul>
                            <li><strong>Nếu đây là bạn:</strong> Vui lòng đợi 15 phút và thử lại với mật khẩu chính xác.</li>
                            <li><strong>Nếu đây không phải là bạn:</strong> Tài khoản của bạn có thể đang bị tấn công. Hãy thực hiện các biện pháp sau:
                                <ul style="margin-top: 10px;">
                                    <li>Đổi mật khẩu ngay lập tức</li>
                                    <li>Sử dụng mật khẩu mạnh (ít nhất 8 ký tự, bao gồm chữ hoa, chữ thường, số và ký tự đặc biệt)</li>
                                    <li>Kiểm tra các thiết bị đã đăng nhập</li>
                                    <li>Bật xác thực 2 bước nếu có thể</li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    
                    <p style="margin-top: 30px;">
                        <strong>Lưu ý:</strong> Email này được gửi tự động. Nếu bạn cần hỗ trợ, vui lòng liên hệ với đội ngũ hỗ trợ khách hàng của chúng tôi.
                    </p>
                    
                    <p style="color: #666666; font-size: 14px; margin-top: 20px;">
                        Cảm ơn bạn đã sử dụng dịch vụ Crocodile. Chúng tôi luôn nỗ lực để bảo vệ tài khoản của bạn.
                    </p>
                </div>
                
                <div class="footer">
                    © 2024 Crocodile. Mọi quyền được bảo lưu.<br>
                    Email này được gửi tự động, vui lòng không trả lời.
                </div>
            </div>
            </body>
            </html>
            """;

        return String.format(html,
                userName != null ? userName : "Khách hàng",
                formattedTime,
                clientIP != null ? clientIP : "Không xác định",
                userAgent != null ? userAgent : "Không xác định"
        );
    }

    private String getHtmlWelcome(String userName, String activationLink) {
        String html = """
            <!DOCTYPE html>
            <html>
            <head>
                <meta charset="UTF-8">
                <title>Welcome to Crocodile</title>
            </head>
            <body style="font-family: Arial, sans-serif; margin: 0; padding: 0;">
            <table style="width: 600px; margin: 0 auto; border: 1px solid #ddd; border-collapse: collapse;">
                <tr>
                    <td style="padding: 20px;">
                        <h2 style="margin: 0; color: #333333; font-size: 24px; text-align: center; padding: 1rem 0;">
                            Chào mừng %s đến với Crocodile!
                        </h2>
                        <p style="color: #666666; font-size: 0.9rem; line-height: 1.5; margin-top: 10px;">
                            Để kích hoạt tài khoản của bạn, vui lòng nhấn vào liên kết sau: 
                            <a href="%s">Kích hoạt tài khoản</a>
                        </p>
                        <p style="color: #666666; font-size: 0.9rem; line-height: 1.5; margin-top: 10px;">
                            Chúng tôi rất vui mừng khi bạn trở thành một phần của gia đình Crocodile. Hãy tận hưởng hành trình mua sắm đầy thú vị và đẳng cấp tại Crocodile.
                        </p>
                    </td>
                </tr>
                <tr>
                    <td style="background-color: #f4f4f4; padding: 10px; text-align: center; color: #666666; font-size: 12px;">
                        © 2024 Crocodile. Mọi quyền được bảo lưu.
                    </td>
                </tr>
            </table>
            </body>
            </html>
            """;
        return String.format(html, userName, activationLink);
    }
}