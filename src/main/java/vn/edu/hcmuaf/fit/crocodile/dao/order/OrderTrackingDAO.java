package vn.edu.hcmuaf.fit.crocodile.dao.order;

import vn.edu.hcmuaf.fit.crocodile.config.JdbiConnect;
import vn.edu.hcmuaf.fit.crocodile.model.entity.OrderTracking;

import java.util.ArrayList;
import java.util.List;

public class OrderTrackingDAO {

    public List<OrderTracking> getOrderTrackingByOrderID(int orderID) {
        String query = """
                SELECT ot.*, os.description AS statusDescript
                FROM `orders_v2_tracking` ot
                JOIN order_status os
                  ON ot.`status` = os.enumValue
                WHERE ot.idOrder = :orderID
                ORDER BY ot.updateAt DESC;
                """;
        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createQuery(query)
                        .bind("orderID", orderID)
                        .mapToBean(OrderTracking.class)
                        .list()
        );
    }

}
