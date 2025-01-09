package vn.edu.hcmuaf.fit.crocodile.dao.user;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.crocodile.config.JdbiConnect;
import vn.edu.hcmuaf.fit.crocodile.model.entity.User;
import vn.edu.hcmuaf.fit.crocodile.service.AuthenticationService;
import vn.edu.hcmuaf.fit.crocodile.util.HashUtil;

import java.time.LocalDate;
import java.util.Optional;

public class UserDaoImpl implements UserDao {

//    // ------------------------ Begin admin method ------------------------
//    @Override
//    public List<User> getAllUser() {
//        String sql = "select * from user where role = 0";
//        return JdbiConnect.getJdbi().withHandle(handle ->
//                handle.createQuery(sql)
//                        .mapToBean(User.class)
//                        .list()
//        );
//
//    }
    // ------------------------ End admin method ------------------------

    @Override
    public Optional<User> findById(int id) {
        String query = "select * from users where id = :id ";
        return JdbiConnect.getJdbi().withHandle(
                handle ->
                        handle.createQuery(query)
                                .bind("id", id)
                                .mapToBean(User.class)
                                .findFirst()
        );
    }

    @Override
    public Optional<User> findByUsername(String username) {
        String query = "select * from users where username = :username";
        return JdbiConnect.getJdbi().withHandle(
                handle ->
                        handle.createQuery(query)
                                .bind("username", username)
                                .mapToBean(User.class)
                                .findOne()
        );
    }


    @Override
    public int create(User user) {
        Optional<User> existingUser = findByUsername(user.getUsername());
        if (existingUser.isPresent()) {
            throw new IllegalArgumentException("Tài khoản đã tồn tại.");
        }

        String hashedPassword = HashUtil.hashMD5(user.getPassword());

        String query = "INSERT INTO users (username, password, name, email, phone, gender, birthdate) " +
                "VALUES (:username, :password, :name, :email, :phone , :gender, :dateOfBirth)";

        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createUpdate(query)
                        .bind("username", user.getUsername())
                        .bind("password", hashedPassword)
                        .bind("name", user.getName())
                        .bind("email", user.getEmail())
                        .bind("phone", user.getPhone_number())
                        .bind("gender", user.getGender())
                        .bind("dateOfBirth", user.getBirthdate())
                        .executeAndReturnGeneratedKeys("id")
                        .mapTo(int.class)
                        .one()
        );
    }


    public static void main(String[] args) {
        AuthenticationService authService = new AuthenticationService();

        // Dữ liệu đăng nhập
        String username = "testUser";
        String password = "testPassword";

        // Thử đăng nhập
        int userId = authService.login(username, password);
        if (userId != -1) {
            System.out.println("Đăng nhập thành công, userId: " + userId);
        } else {
            System.out.println("Đăng nhập thất bại");
        }
    }

}
