package vn.edu.hcmuaf.fit.crocodile.service;

import vn.edu.hcmuaf.fit.crocodile.dao.order.IOrderDao;
import vn.edu.hcmuaf.fit.crocodile.dao.order.OrderDao;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Order;
import vn.edu.hcmuaf.fit.crocodile.model.entity.OrderManagement;

import java.time.LocalDateTime;
import java.util.List;

public class OrderService {
    private final IOrderDao orderDao;

    public OrderService() {
        orderDao = new OrderDao();
    }

    public List<Order> findAll() { return orderDao.findAll(); }

    public int insertOrder(int idUser, int idAddress, int total, LocalDateTime invoiceDate,
                           Order.PaymentMethod paymentMethod, Order.Status status) {

        return orderDao.insertOrder(idUser, idAddress, total, invoiceDate, paymentMethod, status);
    }

    public List<OrderManagement> findAllOrder() { return orderDao.finAllOrder(); }

    public int processing(int id) { return orderDao.processing(id); }

    public int cancelled(int id) { return orderDao.cancelled(id); }
}
