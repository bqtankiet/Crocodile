package vn.edu.hcmuaf.fit.crocodile.service;

import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDao;
import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDaoImpl;
import vn.edu.hcmuaf.fit.crocodile.model.entity.User;
import vn.edu.hcmuaf.fit.crocodile.util.HashUtil;

import java.util.Optional;

public class Authentication {
    private final UserDao userDao;

    public Authentication() {
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
//            String hashedPassword = HashUtil.hashMD5(password);
            System.out.println("mật khẩu đã hash   " + password);
            System.out.println("mật khẩu lưu ở DB: " + user.getPassword());
            if (password.equals(user.getPassword())) {
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
//        user.setPassword(HashUtil.hashMD5(user.getPassword()));
        return userDao.create(user);
    }

    public static void main(String[] args) {
        String uname = "ahkietlk";
        String pwd = "123";
        Authentication auth = new Authentication();
        int login = auth.login(uname, pwd);

    }
}
