package vn.edu.hcmuaf.fit.crocodile.dao.user;

import vn.edu.hcmuaf.fit.crocodile.config.JdbiConnect;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Address;
import vn.edu.hcmuaf.fit.crocodile.model.entity.User;

import java.util.List;
import java.util.Optional;

public class UserDaoImpl implements UserDao {
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
    public void update(User user) {
        String query = "UPDATE users " +
                "SET fullname = :fullname, " +
                "    email = :email, " +
                "    phoneNumber = :phoneNumber, " +
                "    gender = :gender, " +
                "    birthdate = :birthdate " +
                "WHERE id = :id";

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
        String query = "select * from users where email = :email";
        return JdbiConnect.getJdbi().withHandle(
                handle ->
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
        String query = "INSERT INTO addresses (id_user, fullname, phone_number, province, district, ward, street) " +
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
    public List<Address> getAddressesByUserId(int userId) {
        String query = "SELECT * FROM addresses WHERE id_user = ?";
        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createQuery(query)
                        .bind(0, userId)
                        .mapToBean(Address.class)
                        .list()
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
