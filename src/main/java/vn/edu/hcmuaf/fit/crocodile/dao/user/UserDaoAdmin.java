package vn.edu.hcmuaf.fit.crocodile.dao.user;

import vn.edu.hcmuaf.fit.crocodile.config.JdbiConnect;

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
}
