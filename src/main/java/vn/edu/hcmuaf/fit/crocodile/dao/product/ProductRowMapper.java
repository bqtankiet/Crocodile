package vn.edu.hcmuaf.fit.crocodile.dao.product;

import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Category;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Product;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ProductRowMapper implements RowMapper<Product> {

    @Override
    public Product map(ResultSet rs, StatementContext ctx) throws SQLException {
        // Map category
        Category category = new Category();
        category.setId(rs.getInt("categoryId"));
        category.setName(rs.getString("categoryName"));

        // Map product
        Product product = new Product();
        product.setId(rs.getInt("id"));
        product.setName(rs.getString("name"));
        product.setImage(rs.getString("image"));
        product.setDescription(rs.getString("description"));
        product.setCreateDate(rs.getDate("createDate"));
        product.setPrice(rs.getInt("price"));
        product.setActive(rs.getBoolean("active"));
        product.setCategory(category);

        return product;
    }
}
