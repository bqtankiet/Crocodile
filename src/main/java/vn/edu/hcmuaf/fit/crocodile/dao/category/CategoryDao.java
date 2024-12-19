package vn.edu.hcmuaf.fit.crocodile.dao.category;

import vn.edu.hcmuaf.fit.crocodile.model.entity.Category;

import java.util.List;

public interface CategoryDao {

    List<Category> getAllCategory();


    // ------------------------Admin của e Khoi ------------------------
    List<Category> getAllCategoryAdmin();
    void updateCategory(Category category);
    void insertCategory(Category category);
    void deleteCategory(int id);

    // ------------------------Admin của e Khoi ------------------------
}
