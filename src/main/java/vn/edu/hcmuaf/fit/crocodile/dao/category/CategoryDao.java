package vn.edu.hcmuaf.fit.crocodile.dao.category;

import vn.edu.hcmuaf.fit.crocodile.config.JdbiConnect;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Category;

import java.util.List;

public class CategoryDao implements ICategoryDao {

    @Override
    public Category findById(Integer id) {
        String sql = "SELECT * FROM categories WHERE id= :id";
        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("id", id)
                        .mapToBean(Category.class)
                        .findOne()
                        .orElse(null)
        );
    }

    @Override
    public List<Category> findAll() {
        String sql = "SELECT * FROM categories WHERE active=1";
        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .mapToBean(Category.class)
                        .list()
        );
    }

    @Override
    public List<Category> getTopSellingCategoriesInDays(int topN, int days) {
        String sql = """
                SELECT
                  c.*,
                  SUM(od.quantity) AS totalSold
                FROM
                  order_details od
                  JOIN orders o ON od.idOrder = o.id
                  JOIN product_variants pv ON od.idVariant = pv.id
                  JOIN products p ON pv.idProduct = p.id
                  JOIN categories c ON p.idCategory = c.id
                WHERE
                  DATEDIFF(CURDATE(), o.invoiceDate) <= :days
                  AND p.active = 1
                  AND c.active = 1
                GROUP BY
                  c.id, c.name
                ORDER BY
                  totalSold DESC
                LIMIT :topN;
                """;
        return JdbiConnect.getJdbi().withHandle(handle ->
            handle.createQuery(sql)
                    .bind("topN", topN)
                    .bind("days", days)
                    .mapToBean(Category.class)
                    .list()
        );
    }
}
