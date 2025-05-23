package vn.edu.hcmuaf.fit.crocodile.service;

import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDao;
import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDaoImpl;
import vn.edu.hcmuaf.fit.crocodile.model.entity.User;
import vn.edu.hcmuaf.fit.crocodile.util.HashUtil;

import java.util.ArrayList;
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
    public int login(String input, String password) {
        // Tìm user bằng email hoặc số điện thoại
        Optional<User> optionalUser = userDao.findByEmailOrPhone(input);

        if (optionalUser.isEmpty()) {
            System.out.println("Không tìm thấy tài khoản với email/sđt: " + input);
            return -1;
        }

        User user = optionalUser.get();
        String hashedPassword = HashUtil.hashMD5(password);

        // Kiểm tra mật khẩu
        if (!hashedPassword.equals(user.getPassword())) {
            System.out.println("Mật khẩu không khớp cho tài khoản: " + input);
            return -1;
        }

        // Kiểm tra trạng thái active
        if (!userDao.checkActive(user.getId())) {
            System.out.println("Tài khoản đã bị vô hiệu hóa: " + input);
            return -2;
        }

        return user.getId();
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
        Optional<User> userOpt = userDao.findById(userId);
        if (userOpt.isPresent()) {
            User user = userOpt.get();
            String hashedPassword = HashUtil.hashMD5(currentPassword);
            return hashedPassword.equals(user.getPassword());
        }
        return false;
    }

    public boolean updatePassword(int userId, String newPassword) {
        try {
            String hashedPassword = HashUtil.hashMD5(newPassword);
            userDao.updatePassword(userId, hashedPassword);
            return true;
        } catch (Exception e) {
            System.out.println("Lỗi khi cập nhật mật khẩu: " + e.getMessage());
            return false;
        }
    }

    public Optional<String> checkRole(int userId) {
        return userDao.getUserRoleById(userId);
    }
}
