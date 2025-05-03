package vn.edu.hcmuaf.fit.crocodile.dao.dashboard;

import vn.edu.hcmuaf.fit.crocodile_admin.controller.dashboard.DashboardNewProducts;

import java.util.List;
import java.util.Map;

public interface IDashboardDAO {
    Map<String, Object> getRevenueChange();

    Map<String, Object> getOrderChange();

    Map<String, Object> getCustomerChange();

    List<Long> getMonthlyRevenue(int year);

    List<Map<String, Object>> getTop10NewProducts();

    List<Map<String, Object>> getTop10BestSaleProducts(String period);
}
