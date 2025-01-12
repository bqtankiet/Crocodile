package vn.edu.hcmuaf.fit.crocodile.service;

import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDao;
import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDaoImpl;
import vn.edu.hcmuaf.fit.crocodile.model.entity.User;
import vn.edu.hcmuaf.fit.crocodile.util.HashUtil;

import java.time.LocalDate;
import java.util.Optional;

public class AuthenticationService {
    private final UserDao userDao;

    public AuthenticationService() {
        this.userDao = new UserDaoImpl();
    }

    /**
     * Xác thực dựa trên username và password.
     *
     * @return ID của user nếu thành công
     */
    public int login(String username, String password) {
        Optional<User> optionalUser = userDao.findByUsername(username);

        if (optionalUser.isPresent()) {
            User user = optionalUser.get();
            String hashedPassword = HashUtil.hashMD5(password);

            System.out.println("mật khẩu đã hash   " + hashedPassword);
            System.out.println("mật khẩu lưu ở DB: " + user.getPassword());
            if (hashedPassword.equals(user.getPassword())) {
                System.out.println("Login thành công, userId: " + user.getId());
                return user.getId();
            } else {
                System.out.println("Mật khẩu không khớp");
            }
        } else {
            System.out.println("Không tìm thấy user với username: " + username);
        }

        return -1;
    }


    public int signup(User user) {
        try {
            return userDao.create(user);
        } catch (IllegalArgumentException e) {
            System.out.println("Lỗi đăng ký: " + e.getMessage());
            return -1;
        }
    }


    public static void main(String[] args) {
        AuthenticationService authService = new AuthenticationService();

        // Tạo một người dùng mới
        String username = "testUser";
        String password = "testPassword";
        String name = "Test User";
        String email = "testuser@example.com";
        String phone = "1234567890";
        String gender = "male";
        LocalDate birthdate = LocalDate.of(1990, 1, 1);

        User newUser = new User(username, password, name, email, phone, gender, birthdate);

        // Đăng ký người dùng
        int userId = authService.signup(newUser);
        if (userId != -1) {
            System.out.println("Đăng ký thành công, userId: " + userId);
        } else {
            System.out.println("Đăng ký thất bại");
        }
    }

}
