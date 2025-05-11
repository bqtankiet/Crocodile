package vn.edu.hcmuaf.fit.crocodile.service;

import vn.edu.hcmuaf.fit.crocodile.dao.dashboard.DashboardDAO;
import vn.edu.hcmuaf.fit.crocodile.dao.dashboard.IDashboardDAO;
import vn.edu.hcmuaf.fit.crocodile_admin.controller.dashboard.DashboardTopSaleProducts;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class DashboardService {
    private final IDashboardDAO dao = new DashboardDAO();

    public Map<String, Object> getRevenueChange() {
        return dao.getRevenueChange();
    }

    public Map<String, Object> getOrderChange() {
        return dao.getOrderChange();
    }

    public Map<String, Object> getCustomerChange() {
        return dao.getCustomerChange();
    }

    public List<Long> getMonthlyRevenue(int year) {
        return dao.getMonthlyRevenue(year);
    }

    public List<Map<String, Object>> getTop10NewProducts() {
        return dao.getTop10NewProducts();
    }

    public List<DashboardTopSaleProducts.TopSaleProductDTO> getTop10BestSaleProducts(String period) {
        List<DashboardTopSaleProducts.TopSaleProductDTO> listProducts = new ArrayList<>();
        List<Map<String, Object>> result = dao.getTop10BestSaleProducts(period);
        for(Map<String, Object> row: result) {
            DashboardTopSaleProducts.TopSaleProductDTO dto = new DashboardTopSaleProducts.TopSaleProductDTO();
            dto.setId(Integer.parseInt(row.get("id").toString()));
            dto.setName(row.get("name").toString());
            dto.setImage(row.get("image").toString());
            dto.setSaleAmount(Integer.parseInt(row.get("quantity_sold").toString()));
            dto.setSalePercent(Double.parseDouble(row.get("percentage_of_total").toString()));
            listProducts.add(dto);
            
        }
        return listProducts;
    }

    public static void main(String[] args) {
        DashboardService service = new DashboardService();
        List<DashboardTopSaleProducts.TopSaleProductDTO> result = service.getTop10BestSaleProducts("month");
        for(DashboardTopSaleProducts.TopSaleProductDTO dto: result) {
            System.out.println(dto);
        }
    }
}
