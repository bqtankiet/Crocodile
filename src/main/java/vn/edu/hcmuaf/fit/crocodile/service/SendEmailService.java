package vn.edu.hcmuaf.fit.crocodile.service;

import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import vn.edu.hcmuaf.fit.crocodile.config.properties.MailProperties;

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