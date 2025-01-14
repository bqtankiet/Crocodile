package vn.edu.hcmuaf.fit.crocodile.service;

import vn.edu.hcmuaf.fit.crocodile.dao.order.IOrderDao;
import vn.edu.hcmuaf.fit.crocodile.dao.order.OrderDao;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Order;

import java.time.LocalDateTime;

public class OrderService {
    private final IOrderDao orderDao;

    public OrderService() {
        orderDao = new OrderDao();
    }

    public int insertOrder(int idUser, int idAddress, int total, LocalDateTime invoiceDate,
                           Order.PaymentMethod paymentMethod, Order.Status status) {

        return orderDao.insertOrder(idUser, idAddress, total, invoiceDate, paymentMethod, status);
    }
}
