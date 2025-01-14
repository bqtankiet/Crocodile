package vn.edu.hcmuaf.fit.crocodile.dao.product.strategy;

import vn.edu.hcmuaf.fit.crocodile.config.JdbiConnect;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Product;

import java.util.List;

public class StrategySortByBestSeller implements IProductSortingStrategy{
    public static final String NAME = "sort-by-best-seller";

    @Override
    public List<Product> findAllWithPagination(int idCate, int page, int size) {
        String sql = """
                SELECT
                  p.*,
                  SUM( od.quantity ) AS totalSold
                FROM
                  order_details od
                  JOIN product_variants pv ON od.idVariant = pv.id
                  JOIN products p ON pv.idProduct = p.id
                  JOIN categories c ON p.idCategory = c.id
                WHERE
                  c.id = :idCate
                  AND p.active = 1
                  AND c.active = 1
                GROUP BY
                  p.id
                ORDER BY
                  totalSold DESC
                  LIMIT :size OFFSET :offset
                """;
        return JdbiConnect.getJdbi().withHandle(handle ->
            handle.createQuery(sql)
                    .bind("idCate", idCate)
                    .bind("offset", (page-1)*size)
                    .bind("size", size)
                    .mapToBean(Product.class)
                    .list()
        );
    }

    @Override
    public String getName() {
        return NAME;
    }
}
