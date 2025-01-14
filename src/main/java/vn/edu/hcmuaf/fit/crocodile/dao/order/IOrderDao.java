package vn.edu.hcmuaf.fit.crocodile.dao.order;

import vn.edu.hcmuaf.fit.crocodile.dao.BasicDao;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Order;

import java.time.LocalDateTime;
import java.util.List;

public interface IOrderDao extends BasicDao<Integer, Order> {
    @Override
    Order findById (Integer id);

    @Override
    List<Order> findAll();

    int insertOrder(int idUser, int idAddress, int total, LocalDateTime invoiceDate, Order.PaymentMethod paymentMethod);
}
