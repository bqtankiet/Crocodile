package vn.edu.hcmuaf.fit.crocodile.dao.user;

import vn.edu.hcmuaf.fit.crocodile.model.entity.User;

import java.util.List;

public interface IUserDaoAdmin {
    int banUser(int id);
    List<User> getAllUsers();
}
