package vn.edu.hcmuaf.fit.crocodile.service;

import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDao;
import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDaoImpl;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Order;

import java.util.List;

public class OrderService {
    private final UserDao userDao;

    public OrderService() {
        this.userDao = new UserDaoImpl();
    }

    public List<Order> getOrdersByUserId(int userId) {
        System.out.println("UserId: " + userId);
        System.out.println("Order List: " + userDao.getOrdersByUserId(userId));
        return userDao.getOrdersByUserId(userId);
    }
}
