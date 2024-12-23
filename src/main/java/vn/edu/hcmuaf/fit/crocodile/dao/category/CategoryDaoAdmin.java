package vn.edu.hcmuaf.fit.crocodile.dao.category;

import vn.edu.hcmuaf.fit.crocodile.config.JdbiConnect;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Category;

import java.util.List;

public class CategoryDaoAdmin extends CategoryDao implements ICategoryDaoAdmin {

    // ------------------------ Begin admin method ------------------------

    @Override // (admin có thể xem cả category mà active=0)
    public List<Category> findAll() {
        String sql = "SELECT * FROM categories";

        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .mapToBean(Category.class)
                        .list()
        );
    }

    @Override
    public int updateCategory(int id, String name, String image, int active) {
        String sql = "UPDATE categories SET name= :name, image= :image, active= :active WHERE id= :id";

        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("name", name)
                        .bind("image", image)
                        .bind("active", active)
                        .bind("id", id)
                        .execute()
        );
    }

    @Override
    public int insertCategory(String name, String image, int active) {
        String sql = "INSERT INTO categories (name, image, active) VALUES (:name, :image, :active)";

        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("name", name)
                        .bind("image", image)
                        .bind("active", active)
                        .execute()
        );

    }

    @Override
    public int deleteCategory(int id) {
        String sql = "DELETE FROM categories WHERE id = :id";

        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("id", id)
                        .execute()
        );
    }

    // ------------------------ End admin method ------------------------
}


