package vn.edu.hcmuaf.fit.crocodile.dao.user;

import vn.edu.hcmuaf.fit.crocodile.config.JdbiConnect;
import vn.edu.hcmuaf.fit.crocodile.model.entity.User;
import vn.edu.hcmuaf.fit.crocodile.util.HashUtil;

import java.util.List;
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
        String query = "select * from user where id = :id ";
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
        String query = "select * from user where username = :username";
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
        // Hash password
        String hashedPassword = HashUtil.hashMD5(user.getPassword());

        // Câu lệnh SQL không cần tham số id nếu id là auto-increment
        String query = "INSERT INTO user (username, password, role) VALUES (:username, :password, :role)";

        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createUpdate(query)
                        .bind("username", user.getUsername())  // Bind username
                        .bind("password", hashedPassword)     // Bind password
                        .bind("role", user.getRole())         // Bind role
                        .executeAndReturnGeneratedKeys("id")  // Lấy id mới được tạo
                        .mapTo(int.class)                     // Trả về id người dùng
                        .one()
        );
    }


}
