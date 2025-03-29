package vn.edu.hcmuaf.fit.crocodile.dao.order;

import org.jdbi.v3.core.mapper.reflect.ConstructorMapper;
import vn.edu.hcmuaf.fit.crocodile.config.JdbiConnect;
import vn.edu.hcmuaf.fit.crocodile.model.dto.OrderDetailDTO;
import vn.edu.hcmuaf.fit.crocodile.model.dto.OrderItemDTO;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Order;
import vn.edu.hcmuaf.fit.crocodile.model.entity.OrderManagement;

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

    @Override
    public List<OrderManagement> finAllOrder() {
        String sql = "select o.id, u.fullname, u.phoneNumber, o.total, o.paymentMethod, o.status, o.invoiceDate " +
                "from orders o " +
                "join users u on o.idUser = u.id";
        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .mapToBean(OrderManagement.class)
                        .list()
        );
    }

    @Override
    public int processing(int id) {
        String sql = "update orders set status = :status where id = :id";
        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("id", id)
                        .bind("status", Order.Status.PROCESSING)
                        .execute()
        );
    }

    @Override
    public int cancelled(int id) {
        String sql = "update orders set status = :status where id = :id";
        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("id", id)
                        .bind("status", Order.Status.CANCELLED)
                        .execute()
        );
    }

    @Override
    public OrderDetailDTO getOrderDetail(int id) {
        String query = """
                SELECT
                  o.id,
                  `code`, idUser,
                  orderDate, u.fullname,
                  paymentMethod, u.phoneNumber,
                  total, u.email,
                  recipientName, shippingCompany,
                  recipientPhone, shippingCode,
                  shippingAddress, isDelete
                FROM orders_v2 o
                JOIN users u
                  ON o.idUser = u.id
                WHERE o.id = :id;
                """;
        return JdbiConnect.getJdbi().withHandle(handle ->
            handle.createQuery(query)
                    .bind("id", id)
                    .registerRowMapper(ConstructorMapper.factory(OrderDetailDTO.class))
                    .mapTo(OrderDetailDTO.class)
                    .findFirst()
                    .orElse(null)
        );
    }

    @Override
    public List<OrderItemDTO> getOrderItems(int id) {
        String query = """
                SELECT
                  pv.id,
                  p.`name`,
                  oi.unitPrice,
                  oi.amount,
                  oi.amount * oi.unitPrice AS total,
                  oi.o1Key, oi.o1Value,
                  oi.o2Key, oi.o2Value
                FROM product_variants pv
                JOIN products p ON pv.idProduct = p.id
                JOIN order_items oi ON oi.idProductVariant = pv.id
                WHERE oi.idOrder = :id
                
                """;
        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createQuery(query)
                        .bind("id", id)
                        .registerRowMapper(ConstructorMapper.factory(OrderItemDTO.class))
                        .mapTo(OrderItemDTO.class)
                        .list()
        );
    }
}
