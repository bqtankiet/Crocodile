package vn.edu.hcmuaf.fit.crocodile.service;

import vn.edu.hcmuaf.fit.crocodile.dao.order.OrderTrackingDAO;
import vn.edu.hcmuaf.fit.crocodile.model.entity.OrderTracking;

import java.util.List;

public class OrderDetailService {

    public List<OrderTracking> getTrackingTimeline(int orderID){
        return new OrderTrackingDAO().getOrderTrackingByOrderID(orderID);
    }

}
