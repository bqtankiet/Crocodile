package vn.edu.hcmuaf.fit.crocodile.dao.user;

import vn.edu.hcmuaf.fit.crocodile.config.JdbiConnect;
import vn.edu.hcmuaf.fit.crocodile.model.entity.User;

import java.util.List;

public class UserDaoAdmin implements IUserDaoAdmin{
    @Override
    public int banUser(int id) {
        String sql = "update users set active = case when active = 0 then 1 else 0 end where id = :id";

        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("id", id)
                        .execute()
                );
    }

    @Override
    public List<User> getAllUser() {
        String sql = "SELECT * FROM users";
        return JdbiConnect.getJdbi().withHandle(handle ->
            handle.createQuery(sql)
                    .mapToBean(User.class)
                    .list()
        );
    }
}
