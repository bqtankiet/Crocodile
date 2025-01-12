package vn.edu.hcmuaf.fit.crocodile.dao.product.strategy;

import vn.edu.hcmuaf.fit.crocodile.config.JdbiConnect;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Product;

import java.util.List;

public class StrategySortByID implements IProductSortingStrategy{
    public static final String NAME = "sort-by-id";

    @Override
    public List<Product> findAllWithPagination(int idCate, int page, int size) {
        String sql = """
            SELECT *
            FROM products p
            WHERE p.idCategory = :idCate AND active = 1
            ORDER BY p.id
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
