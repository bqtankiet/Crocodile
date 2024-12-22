package vn.edu.hcmuaf.fit.crocodile.dao.category;

import vn.edu.hcmuaf.fit.crocodile.config.JdbiConnect;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Category;

import java.util.List;

public class CategoryDaoImpl implements CategoryDao {

    @Override
    public Category findById(Integer integer) {
        return null;
    }

    @Override
    public List<Category> findAll() {
        String sql = "SELECT * FROM categories";

        List<Category> results;
        results = JdbiConnect.getJdbi().withHandle(handle ->
            handle.createQuery(sql)
                    .mapToBean(Category.class)
                    .list()
        );
        return results;
    }

    @Override
    public List<Category> findAllActive() {
        String sql = "SELECT * FROM categories WHERE active=1";

        List<Category> results;
        results = JdbiConnect.getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .mapToBean(Category.class)
                        .list()
        );
        return results;
    }
}
