package vn.edu.hcmuaf.fit.crocodile.dao.user;

import vn.edu.hcmuaf.fit.crocodile.config.JdbiConnect;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Address;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Order;
import vn.edu.hcmuaf.fit.crocodile.model.entity.OrderInfo;
import vn.edu.hcmuaf.fit.crocodile.model.entity.User;

import java.util.List;
import java.util.Optional;

public class UserDaoImpl implements UserDao {
    @Override
    public Optional<User> findById(int id) {
        String query = "SELECT * FROM users WHERE id = :id";
        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createQuery(query)
                        .bind("id", id)
                        .mapToBean(User.class)
                        .findFirst() // Nếu không tìm thấy người dùng, trả về Optional.empty()
        );
    }

    @Override
    public Optional<User> findByUsername(String username) {
        String query = "SELECT * FROM users WHERE username = :username";
        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createQuery(query)
                        .bind("username", username)
                        .mapToBean(User.class)
                        .findOne()
        );
    }

    @Override
    public Optional<String> getUserRoleById(int id) {
        String query = "SELECT role FROM users WHERE id = :id";
        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createQuery(query)
                        .bind("id", id)
                        .mapTo(String.class)
                        .findFirst()
        );
    }

    @Override
    public boolean checkActive(int userId) {
        String query = "SELECT active FROM users WHERE id = :id";
        Integer active = JdbiConnect.getJdbi().withHandle(handle ->
                handle.createQuery(query)
                        .bind("id", userId)
                        .mapTo(Integer.class)
                        .findFirst()
                        .orElse(0)
        );

        return active != null && active == 1;
    }


    @Override
    public void update(User user) {
        String query = "UPDATE users SET fullname = :fullname, gender = :gender, birthdate = :birthdate WHERE id = :id";

        JdbiConnect.getJdbi().withHandle(handle ->
                handle.createUpdate(query)
                        .bind("fullname", user.getFullname())
                        .bind("gender", user.getGender())
                        .bind("birthdate", user.getBirthdate())
                        .bind("id", user.getId())
                        .execute()
        );
    }

    @Override
    public Optional<User> findByEmail(String email) {
        String query = "SELECT * FROM users WHERE email = :email";
        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createQuery(query)
                        .bind("email", email)
                        .mapToBean(User.class)
                        .findOne()
        );
    }
    @Override
    public Optional<User> findByPhone(String phone) {
        String query = "SELECT * FROM users WHERE phoneNumber = :phone";
        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createQuery(query)
                        .bind("phone", phone)
                        .mapToBean(User.class)
                        .findOne()
        );
    }

    @Override
    public void updatePassword(int userId, String newPassword) {
        String query = "UPDATE users SET password = :password WHERE id = :userId";
        JdbiConnect.getJdbi().withHandle(handle ->
                handle.createUpdate(query)
                        .bind("userId", userId)
                        .bind("password", newPassword)
                        .execute()
        );
    }

    @Override
    public void addAddress(Address address) {
        String query = "INSERT INTO addresses (userId, fullname, phoneNumber, province, district, ward, street) " +
                "VALUES (:userId, :fullname, :phoneNumber, :province, :district, :ward, :street)";
        JdbiConnect.getJdbi().withHandle(handle ->
                handle.createUpdate(query)
                        .bind("userId", address.getUserId())
                        .bind("fullname", address.getFullname())
                        .bind("phoneNumber", address.getPhoneNumber())
                        .bind("province", address.getProvince())
                        .bind("district", address.getDistrict())
                        .bind("ward", address.getWard())
                        .bind("street", address.getStreet())
                        .execute()
        );
    }

    @Override
    public List<Order> getOrdersByUserId(int userId) {
        String query = "SELECT * FROM orders WHERE idUser = :idUser";
        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createQuery(query)
                        .bind("idUser", userId)
                        .mapToBean(Order.class)
                        .list()
        );
    }


    @Override
    public List<Address> getAddressesByUserId(int userId) {
        String query = "SELECT * FROM addresses WHERE userId = :userId";
        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createQuery(query)
                        .bind("userId", userId)
                        .mapToBean(Address.class)
                        .list()
        );
    }

    @Override
    public Address getDefaultAddressByUserId(int userId) {
        String query = "SELECT * FROM addresses WHERE userId = :userId AND isDefault = 1";
        return JdbiConnect.getJdbi().withHandle(handle ->
            handle.createQuery(query)
                    .bind("userId", userId)
                    .mapToBean(Address.class)
                    .findFirst()
                    .orElse(null)
        );
    }

    @Override
    public List<OrderInfo> getAllOrderInfoByUserId(int idUser, String status) {
        StringBuilder sql = new StringBuilder("""
                SELECT
                    o.id,
                    o.invoiceDate,
                    o.total,
                    o.status,
                
                    p.name AS productName,
                    p.image AS productImage,
                    p.price AS productPrice,
                
                    od.quantity,
                    od.idVariant,
                    po1.value AS option1Value,
                    po2.value AS option2Value
                
                FROM orders o
                JOIN order_details od ON od.idOrder = o.id
                JOIN product_variants pv ON od.idVariant = pv.id
                JOIN products p ON pv.idProduct = p.id
                LEFT JOIN product_options po1 ON pv.idOption1 = po1.id
                LEFT JOIN product_options po2 ON pv.idOption2 = po2.id
                WHERE o.idUser = :idUser
            """);
        if (status != null && !status.equalsIgnoreCase("all")) {
            sql.append(" AND o.status = :status");
        }

        return JdbiConnect.getJdbi().withHandle(handle -> {
            var query = handle.createQuery(sql.toString())
                    .bind("idUser", idUser);

            if (status != null && !status.equalsIgnoreCase("all")) {
                query.bind("status", status);
            }

            return query.mapToBean(OrderInfo.class).list();
        });
    }

    @Override
    public int create(User user) {
        String query = "INSERT INTO users (fullname, email, phoneNumber, gender, birthdate, password, active) " +
                "VALUES (:fullname, :email, :phoneNumber, :gender, :birthdate, :password, :active)";
        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createUpdate(query)
                        .bind("fullname", user.getFullname())
                        .bind("email", user.getEmail())
                        .bind("phoneNumber", user.getPhoneNumber())
                        .bind("gender", user.getGender())
                        .bind("birthdate", user.getBirthdate())
                        .bind("password", user.getPassword())
                        .bind("active", user.getActive())
                        .executeAndReturnGeneratedKeys("id")
                        .mapTo(int.class)
                        .one()
        );
    }
    @Override
    public Optional<User> findByEmailOrPhone(String input) {
        String query = "SELECT * FROM users WHERE email = :input OR phoneNumber = :input";
        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createQuery(query)
                        .bind("input", input)
                        .mapToBean(User.class)
                        .findFirst()
        );
    }
    @Override
    public void activateUser(int userId) {
        String query = "UPDATE users SET active = 1 WHERE id = :userId";
        JdbiConnect.getJdbi().withHandle(handle ->
                handle.createUpdate(query)
                        .bind("userId", userId)
                        .execute()
        );
    }
}
