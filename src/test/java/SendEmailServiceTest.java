
import org.junit.jupiter.api.Test;
import vn.edu.hcmuaf.fit.crocodile.dao.token.TokenDao;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Token;
import vn.edu.hcmuaf.fit.crocodile.service.SendEmailService;

import java.time.LocalDateTime;
import java.util.UUID;

public class SendEmailServiceTest {
    @Test
    public  void test() {
        // Khởi tạo các service và DAO
        SendEmailService emailService = new SendEmailService();
        TokenDao tokenDao = new TokenDao();

        // Thông tin người dùng và email
        int userId = 45; // Giả sử ID người dùng là 45
        String recipientEmail = "acclienketlolriot@gmail.com"; // Email nhận
        String fullName = "Nguyen Van A";

        try {
            // Bước 1: Tạo token
            String tokenValue = UUID.randomUUID().toString();
            Token activationToken = new Token();
            activationToken.setIdUser(userId);
            activationToken.setToken(tokenValue);
            activationToken.setTokenType(Token.TokenType.VERIFY_ACCOUNT);
            activationToken.setCreatedAt(LocalDateTime.now());
            activationToken.setExpiresAt(LocalDateTime.now().plusHours(24));
            activationToken.setStatus(0);

            // Bước 2: Lưu token vào cơ sở dữ liệu
            int tokenId = tokenDao.insertToken(activationToken);
            if (tokenId <= 0) {
                System.out.println("Lưu token thất bại!");
                return;
            }

            System.out.println("Token đã được tạo và lưu thành công! ID: " + tokenId);
            System.out.println("Thông tin token: " + activationToken);

            // Bước 3: Tạo liên kết kích hoạt
            String activationLink = "http://localhost:8080/activate?token=" + tokenValue;

            // Bước 4: Gửi email chào mừng kèm liên kết kích hoạt
            boolean emailSent = emailService.sendWelcomeEmail(recipientEmail, fullName, activationLink);
            if (emailSent) {
                System.out.println("Email chào mừng đã được gửi thành công đến: " + recipientEmail);
                System.out.println("Liên kết kích hoạt: " + activationLink);
            } else {
                System.out.println("Gửi email chào mừng thất bại đến: " + recipientEmail);
            }
        } catch (Exception e) {
            System.err.println("Lỗi khi thực hiện gửi email kèm token: " + e.getMessage());
            e.printStackTrace();
        }
    }
}