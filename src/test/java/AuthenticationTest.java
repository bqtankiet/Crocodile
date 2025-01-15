import vn.edu.hcmuaf.fit.crocodile.model.entity.User;
import vn.edu.hcmuaf.fit.crocodile.service.AuthenticationService;

public class AuthenticationTest {
    public static void main(String[] args) {
        // Khởi tạo AuthenticationService
        AuthenticationService authService = new AuthenticationService();

        // Giả lập userId của người dùng
        int userId = 8;  // Giả sử user có ID là 1

        // Giả lập mật khẩu hiện tại và mật khẩu mới
        String currentPassword = "ad";  // Mật khẩu hiện tại (đã được băm trong DB)
        String newPassword = "newPassword123";   // Mật khẩu mới
        String confirmPassword = "newPassword123"; // Mật khẩu xác nhận

        // Kiểm tra mật khẩu hiện tại có đúng không
        boolean isCurrentPasswordCorrect = authService.checkCurrentPassword(userId, currentPassword);

        if (isCurrentPasswordCorrect) {
            // Kiểm tra mật khẩu mới và xác nhận mật khẩu có khớp không
            if (newPassword.equals(confirmPassword)) {
                // Cập nhật mật khẩu mới
                boolean isPasswordUpdated = authService.updatePassword(userId, newPassword);

                if (isPasswordUpdated) {
                    System.out.println("Mật khẩu đã được thay đổi thành công!");
                } else {
                    System.out.println("Có lỗi xảy ra khi cập nhật mật khẩu.");
                }
            } else {
                System.out.println("Mật khẩu mới và mật khẩu xác nhận không khớp.");
            }
        } else {
            System.out.println("Mật khẩu hiện tại không đúng.");
        }
    }
}
