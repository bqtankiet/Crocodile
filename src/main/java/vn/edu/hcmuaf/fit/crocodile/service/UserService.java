package vn.edu.hcmuaf.fit.crocodile.service;

import vn.edu.hcmuaf.fit.crocodile.dao.user.IUserDaoAdmin;
import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDaoAdmin;
import vn.edu.hcmuaf.fit.crocodile.model.entity.OrderManagement;
import vn.edu.hcmuaf.fit.crocodile.model.entity.User;

import java.time.LocalDate;
import java.util.List;

public class UserService {
    private final IUserDaoAdmin userDaoAdmin;

    public UserService() {
        this.userDaoAdmin = new UserDaoAdmin();
    }

    public int banUser(int id) {
        return userDaoAdmin.banUser(id);
    }

    public List<User> getAllUser() {
        return userDaoAdmin.getAllUser();
    }

    public List<OrderManagement> getAllUserOrder(int id) { return userDaoAdmin.getAllUserOrder(id); }

    public void updateUser(int id, String fullname, String phone, String email, String gender,
                           LocalDate birthdate, int active, int role) {
        userDaoAdmin.updateUser(id, fullname, phone, email, gender, birthdate, active, role);
    }
}
