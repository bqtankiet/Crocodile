package vn.edu.hcmuaf.fit.crocodile.dao.user;

import vn.edu.hcmuaf.fit.crocodile.model.entity.OrderManagement;
import vn.edu.hcmuaf.fit.crocodile.model.entity.User;

import java.time.LocalDate;
import java.util.List;

public interface IUserDaoAdmin {
    int banUser(int id);

    User getUser(int id);

    List<User> getAllUser();

    List<OrderManagement> getAllUserOrder(int id);

    int updateUser(int id, String fullname, String phone, String email, String gender, LocalDate birthdate, int active, int role);

    int orderReceived(int idUser);

    int orderCanceled(int idUser);
}
