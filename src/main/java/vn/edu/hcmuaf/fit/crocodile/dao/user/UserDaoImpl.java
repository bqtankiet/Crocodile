package vn.edu.hcmuaf.fit.crocodile.dao.user;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.crocodile.config.JdbiConnect;
import vn.edu.hcmuaf.fit.crocodile.model.entity.User;
import vn.edu.hcmuaf.fit.crocodile.util.HashUtil;

import java.util.List;
import java.util.Optional;

public class UserDaoImpl implements UserDao {
    private final Jdbi jdbi = JdbiConnect.getJdbi();


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

        String query = "INSERT INTO users (username, password, role) VALUES (:username, :password, :role)";

        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createUpdate(query)
                        .bind("username", user.getUsername())
                        .bind("password", user.getPassword())
                        .bind("role", user.getRole())
                        .executeAndReturnGeneratedKeys("id")
                        .mapTo(int.class)
                        .one()
        );
    }


}
