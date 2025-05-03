package vn.edu.hcmuaf.fit.crocodile.dao.dashboard;

import org.jdbi.v3.core.mapper.RowMapper;
import vn.edu.hcmuaf.fit.crocodile.config.JdbiConnect;
import vn.edu.hcmuaf.fit.crocodile_admin.controller.dashboard.DashboardNewProducts;

import java.util.List;
import java.util.Map;

public class DashboardDAO implements IDashboardDAO {
    @Override
    public Map<String, Object> getRevenueChange() {
        return JdbiConnect.getJdbi().withHandle(handle -> handle
                .createCall("CALL GetRevenueChange()")
                .invoke()
                .getResultSet()
                .mapToMap()
                .first()
        );
    }

    @Override
    public Map<String, Object> getOrderChange() {
        return JdbiConnect.getJdbi().withHandle(handle -> handle
                .createCall("CALL GetOrderChange()")
                .invoke()
                .getResultSet()
                .mapToMap()
                .first()
        );
    }

    @Override
    public Map<String, Object> getCustomerChange() {
        return JdbiConnect.getJdbi().withHandle(handle -> handle
                .createCall("CALL GetCustomerChange()")
                .invoke()
                .getResultSet()
                .mapToMap()
                .first()
        );
    }

    @Override
    public List<Long> getMonthlyRevenue(int year) {
        RowMapper<Long> rowmapper = (resultSet, rowNum) -> resultSet.getObject(2, Long.class);

        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createCall("CALL GetMonthlyRevenue(:year)")
                        .bind("year", year)
                        .invoke()
                        .getResultSet()
                        .map(rowmapper)
                        .list()
        );
    }

    @Override
    public List<Map<String, Object>> getTop10NewProducts() {
        String sql = """
                SELECT id, name, image
                FROM products
                ORDER BY createDate DESC
                LIMIT 10
                """;
        return JdbiConnect.getJdbi().withHandle(handle -> handle
                .createQuery(sql)
                .mapToMap()
                .list()
        );
    }

    @Override
    public List<Map<String, Object>> getTop10BestSaleProducts(String period) {
        return JdbiConnect.getJdbi().withHandle(handle -> handle
                .createCall("CALL getTop10BestSaleProducts(:period)")
                .bind("period", period)
                .invoke()
                .getResultSet()
                .mapToMap()
                .list()
        );
    }


    public static void main(String[] args) {
        DashboardDAO dao = new DashboardDAO();
        List<Map<String, Object>> result = dao.getTop10BestSaleProducts("month");
        System.out.println(result);
    }

}
