package vn.edu.hcmuaf.fit.crocodile.dao.order;

import vn.edu.hcmuaf.fit.crocodile.dao.BasicDao;
import vn.edu.hcmuaf.fit.crocodile.model.dto.OrderDetailDTO;
import vn.edu.hcmuaf.fit.crocodile.model.dto.OrderItemDTO;
import vn.edu.hcmuaf.fit.crocodile.model.entity.EnumType;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Order;
import vn.edu.hcmuaf.fit.crocodile.model.entity.OrderManagement;

import java.time.LocalDateTime;
import java.util.List;

public interface IOrderDao extends BasicDao<Integer, Order> {
    @Override
    Order findById (Integer id);

    @Override
    List<Order> findAll();

    int insertOrder(int idUser, int idAddress, int total, LocalDateTime invoiceDate,
                    Order.PaymentMethod paymentMethod, Order.Status status);

    int updateStock(int idVariant, int quantity);

    int insertOrderDetail(int idOrder, int idVariant, int quantity, double unitPrice);

    int insertInventoryHistory(int idVariant, int idOrder, int quantity, EnumType type, int idSupplier);

    List<OrderManagement> finAllOrder();

    int processing(int id);

    int cancelled(int id);

    OrderDetailDTO getOrderDetail(int id);

    /**
     * @param id id của order (không phải id sản phẩm)
     * @return
     */
    List<OrderItemDTO> getOrderItems(int id);

}
