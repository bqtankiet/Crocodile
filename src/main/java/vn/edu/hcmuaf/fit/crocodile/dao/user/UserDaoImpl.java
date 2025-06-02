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
                        .findFirst()
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
                  o.orderDate AS invoiceDate,
                  o.total,
                  o.status,

                  p.id AS idProduct,
                  p.name AS productName,
                  p.image AS productImage,
                  p.price AS productPrice,

                  oi.amount AS quantity,
                  oi.idProductVariant AS idVariant,
                  oi.o1Value AS option1Value,
                  oi.o2Value AS option2Value

                  FROM orders_v2 o
                  JOIN order_items oi ON oi.idOrder = o.id
                  JOIN product_variants pv ON oi.idProductVariant = pv.id
                  JOIN products p ON pv.idProduct = p.id
                WHERE o.idUser = :idUser
            """);
        if (status != null && !status.equalsIgnoreCase("all")) {
            sql.append(" AND o.status = :status");
        }

        sql.append(" ORDER BY o.orderDate DESC");

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
        try {
            System.out.println("=== CREATING NEW USER ===");
            System.out.println("Email: " + user.getEmail());
            System.out.println("Full name: " + user.getFullname());
            System.out.println("Google ID: " + user.getGoogleId());
            System.out.println("Role: " + user.getRole());
            System.out.println("Active: " + user.getActive());

            // ✅ VALIDATION: Kiểm tra role có tồn tại không
            String roleCheckQuery = "SELECT COUNT(*) FROM roles WHERE id = :roleId";
            int roleCount = JdbiConnect.getJdbi().withHandle(handle ->
                    handle.createQuery(roleCheckQuery)
                            .bind("roleId", user.getRole())
                            .mapTo(Integer.class)
                            .one()
            );

            if (roleCount == 0) {
                System.err.println("✗ Invalid role ID: " + user.getRole());
                throw new RuntimeException("Role ID " + user.getRole() + " does not exist in roles table. Expected role 16 for customer.");
            }

            // Kiểm tra email đã tồn tại chưa
            if (user.getEmail() != null && !user.getEmail().isEmpty()) {
                Optional<User> existingUser = findByEmail(user.getEmail());
                if (existingUser.isPresent()) {
                    System.err.println("✗ Email already exists: " + user.getEmail());
                    throw new RuntimeException("Email already exists");
                }
            }

            // Kiểm tra Google ID đã tồn tại chưa
            if (user.getGoogleId() != null && !user.getGoogleId().isEmpty()) {
                Optional<User> existingGoogleUser = findByGoogleId(user.getGoogleId());
                if (existingGoogleUser.isPresent()) {
                    System.err.println("✗ Google ID already exists: " + user.getGoogleId());
                    throw new RuntimeException("Google ID already exists");
                }
            }

            // Insert user với validation đầy đủ
            String query = """
        INSERT INTO users (
            fullname, email, phoneNumber, gender, birthdate, 
            password, active, role, google_id
        ) VALUES (
            :fullname, :email, :phoneNumber, :gender, :birthdate, 
            :password, :active, :role, :googleId
        )
        """;

            int userId = JdbiConnect.getJdbi().withHandle(handle ->
                    handle.createUpdate(query)
                            .bind("fullname", user.getFullname() != null ? user.getFullname() : "")
                            .bind("email", user.getEmail() != null ? user.getEmail() : "")
                            .bind("phoneNumber", user.getPhoneNumber() != null && !user.getPhoneNumber().isEmpty() ? user.getPhoneNumber() : null)
                            .bind("gender", user.getGender() != null ? user.getGender() : "KHÁC")
                            .bind("birthdate", user.getBirthdate())
                            .bind("password", user.getPassword() != null ? user.getPassword() : "")
                            .bind("active", user.getActive())
                            .bind("role", user.getRole()) // Đã validate ở trên
                            .bind("googleId", user.getGoogleId())
                            .executeAndReturnGeneratedKeys("id")
                            .mapTo(int.class)
                            .one()
            );

            System.out.println("✓ User created successfully with ID: " + userId);
            return userId;

        } catch (Exception e) {
            System.err.println("✗ Error creating user: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("Failed to create user", e);
        }
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

    @Override
    public Optional<User> findByGoogleId(String googleId) {
        String query = "SELECT * FROM users WHERE google_id = :googleId";
        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createQuery(query)
                        .bind("googleId", googleId)
                        .mapToBean(User.class)
                        .findFirst()
        );
    }

    @Override
    public void updateGoogleInfo(int userId, String googleId) {
        String query = "UPDATE users SET google_id = :googleId WHERE id = :userId";
        JdbiConnect.getJdbi().withHandle(handle ->
                handle.createUpdate(query)
                        .bind("googleId", googleId)
                        .bind("userId", userId)
                        .execute()
        );
    }
    @Override
    public Optional<User> findByEmailOrGoogleId(String email, String googleId) {
        String query = "SELECT * FROM users WHERE email = :email OR google_id = :googleId";
        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createQuery(query)
                        .bind("email", email)
                        .bind("googleId", googleId)
                        .mapToBean(User.class)
                        .findFirst()
        );
    }
}