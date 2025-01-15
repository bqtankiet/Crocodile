package vn.edu.hcmuaf.fit.crocodile.service;

import vn.edu.hcmuaf.fit.crocodile.dao.user.IUserDaoAdmin;
import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDaoAdmin;
import vn.edu.hcmuaf.fit.crocodile.model.entity.User;

import java.util.List;

public class UserService {
    private final IUserDaoAdmin userDaoAdmin;

    public UserService() {
        this.userDaoAdmin = new UserDaoAdmin();
    }

    public int banUser(int id) {
        return userDaoAdmin.banUser(id);
    }

    public List<User> getAllUsers() { return userDaoAdmin.getAllUsers(); }
}
