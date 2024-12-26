import vn.edu.hcmuaf.fit.crocodile.model.entity.User;
import vn.edu.hcmuaf.fit.crocodile.service.Authentication;

public class AuthenticationTest {
    public static void main(String[] args) {
        Authentication auth = new Authentication();

        System.out.println("===== Test =====");
//        // Test với người dùng đã tồn tại
//        String username = "admin";
//        String correctPassword = "Admin@123";  // Mật khẩu đúng
//        String wrongPassword = "incorrectPassword"; // Mật khẩu sai
//
//        // Test login với mật khẩu đúng
//        int userId = auth.login(username, correctPassword);
//        System.out.println("Login với mật khẩu đúng: " + (userId != -1 ? "Thành công (User ID: " + userId + ")" : "Thất bại"));
//
//        // Test login với mật khẩu sai
//        int userId1 = auth.login(username, wrongPassword);
//        System.out.println("Login với mật khẩu sai: " + (userId1 != -1 ? "Thành công (User ID: " + userId1 + ")" : "Thất bại"));
//
        String unameTest = "danganhkiet";
        String passTest = "danganhkiet";

        User newUser = new User();

        newUser.setUsername(unameTest);
        newUser.setPassword(passTest);

        int signup = auth.signup(newUser); // Đăng ký người dùng mới
        System.out.println("Đăng ký tk danganhkiet:  " + (signup != -1 ? "Thành công (User ID: " + signup + ")" : "Thất bại"));

        int login = auth.login(unameTest, passTest);
        System.out.println("Login tk danganhkiet: " + (login != -1 ? "Thành công (User ID: " + login + ")" : "Thất bại"));

//        int dak = auth.login("dak", "dak");
//        // Kiểm tra đăng nhập lại với thông tin người dùng mới
////        int newUserLoginId = auth.login(username1, password1);
//        System.out.println("Login với người dùng mới: " + (dak != -1 ? "Thành công (User ID: " + dak + ")" : "Thất bại"));
    }
}
