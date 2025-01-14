package vn.edu.hcmuaf.fit.crocodile.dao.order;

import vn.edu.hcmuaf.fit.crocodile.config.JdbiConnect;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Order;

import java.time.LocalDateTime;
import java.util.List;

public class OrderDao implements IOrderDao{
    @Override
    public Order findById(Integer id) {
        String sql = "select * from orders where id = :id";
        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("id", id)
                        .mapToBean(Order.class)
                        .findFirst()
                        .orElse(null)
        );
    }

    @Override
    public List<Order> findAll() {
        String sql = "select * from orders";
        return JdbiConnect.getJdbi().withHandle(handle ->
            handle.createQuery(sql)
                    .mapToBean(Order.class)
                    .list()
        );
    }

    @Override
    public int insertOrder(int idUser, int idAddress, int total, LocalDateTime invoiceDate,
                           Order.PaymentMethod paymentMethod, Order.Status status) {

        String sql = "insert into orders (idUser, idAddress, total, invoiceDate, paymentMethod, status)" +
                " values(:idUser, :idAddress, :total, :invoiceDate, :paymentMethod, :status)";
        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("idUser", idUser)
                        .bind("idAddress", idAddress)
                        .bind("total", total)
                        .bind("invoiceDate", invoiceDate)
                        .bind("paymentMethod", paymentMethod)
                        .bind("status", status)
                        .execute()
        );
    }
}
