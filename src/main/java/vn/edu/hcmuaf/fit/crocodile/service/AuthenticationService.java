package vn.edu.hcmuaf.fit.crocodile.service;

import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDao;
import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDaoImpl;
import vn.edu.hcmuaf.fit.crocodile.model.entity.User;
import vn.edu.hcmuaf.fit.crocodile.util.HashUtil;

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

            if (hashedPassword.equals(user.getPassword())) {
                return user.getId();
            } else {
                System.out.println("Mật khẩu không khớp");
            }
        } else {
            System.out.println("Không tìm thấy user với username: " + username);
        }

        return -1;
    }

    public Optional<User> findEmail(String email) {
        return userDao.findByEmail(email);
    }

    public int signup(User user) {
        try {
            String hashedPassword = HashUtil.hashMD5(user.getPassword());
            user.setPassword(hashedPassword);
            return userDao.create(user);
        } catch (IllegalArgumentException e) {
            System.out.println("Lỗi đăng ký: " + e.getMessage());
            return -1;
        }
    }

    public boolean resetPassword(int userId, String newPassword) {
        try {
            String hashedPassword = HashUtil.hashMD5(newPassword);
            userDao.updatePassword(userId, hashedPassword);
            System.out.println("update password success: " + newPassword);
            return true;
        } catch (Exception e) {
            System.out.println("Lỗi khi cập nhật mật khẩu: " + e.getMessage());
            return false;
        }
    }

    public boolean updateProfile(User user) {
        try {
            userDao.update(user);
            System.out.println("update profile success");
            return true;
        } catch (Exception e) {
            System.out.println("Lỗi khi cập nhật thông tin người dùng: " + e.getMessage());
            return false;
        }
    }

    public Optional<User> getUserById(int userId) {
        return userDao.findById(userId);
    }

    public boolean checkCurrentPassword(int userId, String currentPassword) {
        Optional<User> userOpt = userDao.findById(userId); // Lấy thông tin người dùng từ DB
        if (userOpt.isPresent()) {
            User user = userOpt.get();
            String hashedPassword = HashUtil.hashMD5(currentPassword); // Mã hóa mật khẩu hiện tại
            return hashedPassword.equals(user.getPassword()); // So sánh mật khẩu hiện tại đã mã hóa
        }
        return false;
    }

    // Cập nhật mật khẩu mới vào DB
    public boolean updatePassword(int userId, String newPassword) {
        try {
            String hashedPassword = HashUtil.hashMD5(newPassword);
            userDao.updatePassword(userId, hashedPassword); // Cập nhật mật khẩu mới vào DB
            return true;
        } catch (Exception e) {
            System.out.println("Lỗi khi cập nhật mật khẩu: " + e.getMessage());
            return false;
        }
    }
}
