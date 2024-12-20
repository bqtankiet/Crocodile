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
    public void updateCategory(int id, String name, String image, int active) {

    }

    @Override
    public void insertCategory(String name, String image, int active) {
        String sql = "INSERT INTO categories (name, image, active) VALUES (:name, :image, :active)";

        try {
            JdbiConnect.getJdbi().withHandle(handle ->
                 handle.createUpdate(sql)
                        .bind("name", name)
                        .bind("image", image)
                        .bind("active", active)
                        .execute()
            );
        } catch (Exception e) {
            System.err.println("Error inserting category: " + e.getMessage());
        }
    }


    @Override
    public void deleteCategory(int id) {
        String sql = "DELETE FROM categories WHERE id = :id";

        try {
            JdbiConnect.getJdbi().withHandle(handle ->
                    handle.createUpdate(sql)
                            .bind("id", id)
                            .execute()
            );
        } catch (Exception e) {
            System.err.println("Error deleting category: " + e.getMessage());
        }
    }


    // ------------------------ End admin method ------------------------
}
