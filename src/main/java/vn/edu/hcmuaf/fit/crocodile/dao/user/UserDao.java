package vn.edu.hcmuaf.fit.crocodile.dao.user;

import vn.edu.hcmuaf.fit.crocodile.model.entity.User;

import java.util.List;
import java.util.Optional;

public interface UserDao {
    public List<User> getAllUser();


    Optional<User> findById(int id);

    int create(User user);

    Optional<User> findByUsername(String username);
}
