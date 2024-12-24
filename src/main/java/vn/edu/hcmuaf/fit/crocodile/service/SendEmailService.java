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
            return true;
        } catch (MessagingException e) {
            // Lỗi khi gửi email
            return false;
        }
    }

    public boolean sendEmail(String recipient, String subject, String content) {
        try {
            Message message = new MimeMessage(getEmailSession());
            message.setFrom(new InternetAddress(MAIL_FROM));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipient));
            message.setSubject(subject);
            message.setContent(content, CONTENT_TYPE_TEXT_PLAIN);

            // Gửi email
            Transport.send(message);
            return true;
        } catch (MessagingException e) {
            // Lỗi khi gửi email
            return false;
        }
    }

}
