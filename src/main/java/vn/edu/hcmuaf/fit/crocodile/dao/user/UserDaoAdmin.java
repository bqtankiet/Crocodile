package vn.edu.hcmuaf.fit.crocodile.dao.user;

import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.crocodile.config.JdbiConnect;
import vn.edu.hcmuaf.fit.crocodile.model.entity.OrderManagement;
import vn.edu.hcmuaf.fit.crocodile.model.entity.User;

import java.time.LocalDate;
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

    @Override
    public List<OrderManagement> getAllUserOrder(int id) {
        String sql = "SELECT o.id, o.total, o.paymentMethod, o.status, o.invoiceDate " +
                "FROM orders o " +
                "JOIN users u ON o.idUser = u.id " +
                "WHERE u.id = :id";
        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("id", id)
                        .mapToBean(OrderManagement.class)
                        .list()
        );
    }

    @Override
    public int updateUser(int id, String fullname, String phone, String email, String gender, LocalDate birthdate, int active, int role) {
        String sql = "UPDATE users SET fullname = :fullname, phoneNumber = :phoneNumber, email = :email, gender = :gender, birthdate = :birthdate, role = :role , active = :active WHERE id = :id";

        try (Handle handle = JdbiConnect.getJdbi().open()) {
            return handle.createUpdate(sql)
                    .bind("fullname", fullname)
                    .bind("phoneNumber", phone)
                    .bind("email", email)
                    .bind("gender", gender)
                    .bind("birthdate", birthdate)
                    .bind("role", role)
                    .bind("active", active)
                    .bind("id", id)
                    .execute();
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Error executing query", e);
        }
    }


}
