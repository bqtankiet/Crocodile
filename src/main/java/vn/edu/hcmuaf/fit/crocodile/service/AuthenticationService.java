package vn.edu.hcmuaf.fit.crocodile.service;

import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDao;
import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDaoImpl;
import vn.edu.hcmuaf.fit.crocodile.model.entity.User;
import vn.edu.hcmuaf.fit.crocodile.util.HashUtil;

import java.time.LocalDate;
import java.util.Optional;

public class AuthenticationService {
    private final UserDao userDao;

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
                System.out.println("Login oke, fullname: " + user.getFullname());
                System.out.println("Login oke, gender: " + user.getGender());
                System.out.println("Login oke, birthdate: " + user.getBirthdate());
                System.out.println("Login oke, email: " + user.getEmail());
                System.out.println("Login oke, sdt: " + user.getPhoneNumber());

                return user.getId();
            } else {
                System.out.println("Mật khẩu không khớp");
            }
        } else {
            System.out.println("Không tìm thấy user với username: " + username);
        }

        return -1;
    }

    public static void main(String[] args) {
        AuthenticationService authenticationService = new AuthenticationService();
        authenticationService.login("admin", "admin");
    }


}
