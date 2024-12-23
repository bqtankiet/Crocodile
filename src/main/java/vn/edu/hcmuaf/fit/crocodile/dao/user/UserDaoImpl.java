package vn.edu.hcmuaf.fit.crocodile.dao.user;

import vn.edu.hcmuaf.fit.crocodile.config.JdbiConnect;
import vn.edu.hcmuaf.fit.crocodile.model.entity.User;

import java.util.List;

public class UserDaoImpl implements UserDao {


    // ------------------------ Begin admin method ------------------------
    @Override
    public List<User> getAllUser() {
        String sql = "select * from users where role = 0";
        return JdbiConnect.getJdbi().withHandle(handle ->
            handle.createQuery(sql)
                    .mapToBean(User.class)
                    .list()
            );

    }
    // ------------------------ End admin method ------------------------
}
