package vn.edu.hcmuaf.fit.crocodile.dao.user;

import vn.edu.hcmuaf.fit.crocodile.model.entity.OrderManagement;
import vn.edu.hcmuaf.fit.crocodile.model.entity.User;

import java.util.List;

public interface IUserDaoAdmin {
    int banUser(int id);

    List<User> getAllUser();

    List<OrderManagement> getAllUserOrder(int id);
}
