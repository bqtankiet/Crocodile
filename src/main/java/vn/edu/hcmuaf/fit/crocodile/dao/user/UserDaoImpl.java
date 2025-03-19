package vn.edu.hcmuaf.fit.crocodile.dao.user;

import vn.edu.hcmuaf.fit.crocodile.config.JdbiConnect;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Address;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Order;
import vn.edu.hcmuaf.fit.crocodile.model.entity.User;

import java.time.LocalDate;
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
        String query = "UPDATE users SET fullname = :fullname, email = :email, phoneNumber = :phoneNumber, " +
                "gender = :gender, birthdate = :birthdate WHERE id = :id";

        JdbiConnect.getJdbi().withHandle(handle ->
                handle.createUpdate(query)
                        .bind("fullname", user.getFullname())
                        .bind("email", user.getEmail())
                        .bind("phoneNumber", user.getPhoneNumber())
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
    public int create(User user) {
        Optional<User> existingUser = findByUsername(user.getUsername());
        if (existingUser.isPresent()) {
            throw new IllegalArgumentException("Tài khoản đã tồn tại.");
        }

        String query = "INSERT INTO users (username, password, fullname, email, phoneNumber, gender, birthdate) " +
                "VALUES (:username, :password, :fullname, :email, :phoneNumber , :gender, :dateOfBirth)";

        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createUpdate(query)
                        .bind("username", user.getUsername())
                        .bind("password", user.getPassword())
                        .bind("fullname", user.getFullname())
                        .bind("email", user.getEmail())
                        .bind("phoneNumber", user.getPhoneNumber())
                        .bind("gender", user.getGender())
                        .bind("dateOfBirth", user.getBirthdate())
                        .executeAndReturnGeneratedKeys("id")
                        .mapTo(int.class)
                        .one()
        );
    }
}
