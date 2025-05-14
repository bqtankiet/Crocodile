package vn.edu.hcmuaf.fit.crocodile.service;

import vn.edu.hcmuaf.fit.crocodile.dao.user.*;
import vn.edu.hcmuaf.fit.crocodile.model.entity.OrderManagement;
import vn.edu.hcmuaf.fit.crocodile.model.entity.User;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

public class UserService {
    private UserDao userDao;
    private final IUserDaoAdmin userDaoAdmin;

    public UserService() {
        this.userDaoAdmin = new UserDaoAdmin();
        this.userDao = new UserDaoImpl();
    }

    public Optional<User> findById(int id) { return userDao.findById(id); }

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

    public User getUser(int id) { return userDaoAdmin.getUser(id); }

    public int  orderReceived(int idUser) { return userDaoAdmin.orderReceived(idUser); }

    public int  orderCanceled(int idUser) { return userDaoAdmin.orderCanceled(idUser); }

}
