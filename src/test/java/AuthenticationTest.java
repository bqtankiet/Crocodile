import org.junit.jupiter.api.Test;
import vn.edu.hcmuaf.fit.crocodile.dao.token.TokenDao;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Token;
import vn.edu.hcmuaf.fit.crocodile.model.entity.User;
import vn.edu.hcmuaf.fit.crocodile.service.AuthenticationService;
import vn.edu.hcmuaf.fit.crocodile.service.SendEmailService;

import java.time.LocalDateTime;
import java.util.UUID;

public class AuthenticationTest {
    @Test
    public  void testAuthentication() {
        // Khởi tạo các service
        AuthenticationService authService = new AuthenticationService();
        SendEmailService emailService = new SendEmailService();
        TokenDao tokenDao = new TokenDao();

        // Tạo đối tượng User mới
        User newUser = new User();
        newUser.setFullname("Nguyen Van A");
        newUser.setEmail("acclienketlolriot@gmail.com"); // Email bạn muốn test
        newUser.setPassword("securePass123");
        newUser.setGender("NAM");
        newUser.setPhoneNumber("");
        newUser.setActive(0); // Chưa kích hoạt (giả sử đăng ký bằng email)

        // Thực hiện đăng ký

        // Kiểm tra kết quả đăng ký và in thông tin
            System.out.println("Đăng ký thành công!");
            System.out.println("Thông tin người dùng vừa đăng ký:");
            System.out.println(" - Tên đầy đủ: " + newUser.getFullname());
            System.out.println(" - Email: " + newUser.getEmail());
            System.out.println(" - Số điện thoại: " + newUser.getPhoneNumber());
            System.out.println(" - Giới tính: " + newUser.getGender());
            System.out.println(" - Trạng thái kích hoạt: " + (newUser.getActive() == 1 ? "Đã kích hoạt" : "Chưa kích hoạt"));

            // Nếu đăng ký bằng email, tạo token và gửi email kích hoạt
            if (!newUser.getEmail().isEmpty()) {
                String tokenValue = UUID.randomUUID().toString();
                LocalDateTime expiresAt = LocalDateTime.now().plusHours(24);
                Token activationToken = new Token();
                activationToken.setToken(tokenValue);
                activationToken.setTokenType(Token.TokenType.VERIFY_ACCOUNT);
                activationToken.setCreatedAt(LocalDateTime.now());
                activationToken.setExpiresAt(expiresAt);
                activationToken.setStatus(0); // Chưa sử dụng

                // Lưu token vào cơ sở dữ liệu
                tokenDao.insertToken(activationToken);

                // Gửi email chào mừng với liên kết kích hoạt
                String activationLink = "http://localhost:8080/activate?token=" + tokenValue;
                boolean emailSent = emailService.sendWelcomeEmail(newUser.getEmail(), newUser.getFullname(), activationLink);

                // In thông tin về email
                if (emailSent) {
                    System.out.println("Email chào mừng đã được gửi thành công đến: " + newUser.getEmail());
                    System.out.println("Liên kết kích hoạt: " + activationLink);
                } else {
                    System.out.println("Gửi email chào mừng thất bại đến: " + newUser.getEmail());
                }
            } else {
                System.out.println("Không gửi email chào mừng vì người dùng đăng ký bằng số điện thoại.");
            }
        }

}