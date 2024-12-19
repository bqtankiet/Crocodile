package vn.edu.hcmuaf.fit.crocodile.dao.category;

import vn.edu.hcmuaf.fit.crocodile.config.JdbiConnect;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Category;

import java.util.List;

public class CategoryDaoImpl implements CategoryDao {

    @Override
    public List<Category> getAllCategory() {
        List<Category> results;
        String sql = "SELECT * FROM categories WHERE active=1";
        results = JdbiConnect.getJdbi().withHandle(handle ->
            handle.createQuery(sql)
                    .mapToBean(Category.class)
                    .list()
        );
        return results;
    }

    // ------------------------ Begin admin method ------------------------
    @Override
    public List<Category> getAllCategoryAdmin() {
        String sql = "SELECT * FROM categories";
        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .mapToBean(Category.class)
                        .list()
        );
    }

    @Override
    public void updateCategory(Category category) {

    }

    @Override
    public void insertCategory(Category category) {

    }

    @Override
    public void deleteCategory(int id) {
        String sql = "DELETE FROM categories WHERE id = :id";

        JdbiConnect.getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("id", id)
                        .execute()
        );
    }


    // ------------------------ End admin method ------------------------
}
