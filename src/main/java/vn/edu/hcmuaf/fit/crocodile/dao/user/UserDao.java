package vn.edu.hcmuaf.fit.crocodile.dao.user;

import vn.edu.hcmuaf.fit.crocodile.model.entity.Address;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Order;
import vn.edu.hcmuaf.fit.crocodile.model.entity.User;

import java.util.List;
import java.util.Optional;

public interface UserDao {


    Optional<User> findById(int id);

    List<Address> getAddressesByUserId(int userId);

    int create(User user);

    Optional<User> findByUsername(String username);

    void update(User user);

    Optional<User> findByEmail(String email);

    void updatePassword(int userId, String newPassword);

    void addAddress(Address address);

    List<Order> getOrdersByUserId(int userId);
}
