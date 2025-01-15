package vn.edu.hcmuaf.fit.crocodile.service;

import vn.edu.hcmuaf.fit.crocodile.dao.order.IOrderDao;
import vn.edu.hcmuaf.fit.crocodile.dao.order.OrderDao;
import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDao;
import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDaoImpl;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Order;

import java.time.LocalDateTime;
import java.util.List;

public class OrderService {
    private final UserDao userDao;
    private final IOrderDao orderDao;

    public OrderService() {
        this.userDao = new UserDaoImpl();
        orderDao = new OrderDao();

    }

    public List<Order> getOrdersByUserId(int userId) {
        System.out.println("UserId: " + userId);
        System.out.println("Order List: " + userDao.getOrdersByUserId(userId));
        return userDao.getOrdersByUserId(userId);
    }

    public int insertOrder(int idUser, int idAddress, int total, LocalDateTime invoiceDate,
                           Order.PaymentMethod paymentMethod, Order.Status status) {

        return orderDao.insertOrder(idUser, idAddress, total, invoiceDate, paymentMethod, status);
    }
}



