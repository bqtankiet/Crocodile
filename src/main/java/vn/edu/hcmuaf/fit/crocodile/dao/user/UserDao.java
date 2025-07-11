package vn.edu.hcmuaf.fit.crocodile.dao.user;

import vn.edu.hcmuaf.fit.crocodile.model.entity.Address;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Order;
import vn.edu.hcmuaf.fit.crocodile.model.entity.OrderInfo;
import vn.edu.hcmuaf.fit.crocodile.model.entity.User;

import java.util.List;
import java.util.Optional;

public interface UserDao {


    Optional<User> findById(int id);

    List<Address> getAddressesByUserId(int userId);

    int create(User user);

    Optional<User> findByUsername(String username);

    Optional<String> getUserRoleById(int id);

    boolean checkActive(int userId);

    void update(User user);

    Optional<User> findByEmail(String email);

    Optional<User> findByPhone(String phone);

    void updatePassword(int userId, String newPassword);

    void addAddress(Address address);

    List<Order> getOrdersByUserId(int userId);

    Address getDefaultAddressByUserId(int userId);

    Optional<User> findByEmailOrPhone(String input);

    void activateUser(int userId);

    List<OrderInfo> getAllOrderInfoByUserId(int idUser, String status);

    Optional<User> findByGoogleId(String googleId);

    void updateGoogleInfo(int userId, String googleId);

    Optional<User> findByEmailOrGoogleId(String email, String googleId);
}
