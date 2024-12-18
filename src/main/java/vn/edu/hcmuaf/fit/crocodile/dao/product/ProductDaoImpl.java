package vn.edu.hcmuaf.fit.crocodile.dao.product;

import vn.edu.hcmuaf.fit.crocodile.config.JdbiConnect;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Product;

import java.util.List;

public class ProductDaoImpl implements ProductDao {
    @Override
    public Product findById(Integer id) {
        String sql = """
                SELECT p.*, c.id as categoryId, c.`name` as categoryName
                FROM products p
                JOIN categories c ON p.idCategory = c.id
                WHERE p.id = :id
                """;

        Product result;
        result = JdbiConnect.getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("id", id)
                        .map(new ProductRowMapper())
                        .findFirst()
                        .orElse(null)
        );
        return result;

    }

    @Override
    public List<Product> findAll() {
        String sql = """
                SELECT p.*, c.id as categoryId, c.`name` as categoryName
                FROM products p
                JOIN categories c ON p.idCategory = c.id
                """;

        List<Product> result;
        result = JdbiConnect.getJdbi().withHandle(handle ->
            handle.createQuery(sql)
                    .map(new ProductRowMapper())
                    .list()
        );
        return result;
    }

    @Override
    public List<Product> findByCategoryId(int categoryId) {
        String sql = """
                SELECT p.*, c.id as categoryId, c.`name` as categoryName
                FROM products p
                JOIN categories c ON p.idCategory = c.id
                WHERE c.id = :categoryId
                """;

        List<Product> result;
        result = JdbiConnect.getJdbi().withHandle(handle ->
            handle.createQuery(sql)
                    .bind("categoryId", categoryId)
                    .map(new ProductRowMapper())
                    .list()
        );

        return result;
    }
}
