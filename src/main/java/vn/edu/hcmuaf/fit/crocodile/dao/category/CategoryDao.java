package vn.edu.hcmuaf.fit.crocodile.dao.category;

import vn.edu.hcmuaf.fit.crocodile.dao.BasicDao;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Category;

import java.util.List;

public interface CategoryDao extends BasicDao<Integer, Category> {

    @Override
    Category findById(Integer integer);

    @Override
    List<Category> findAll();

    List<Category> findAllActive();


    // ------------------------Admin của e Khoi ------------------------
    Category getCategoryById(int id);
    List<Category> getAllCategoryAdmin();
    void updateCategory(int id, String name, String image, int active);
    void insertCategory(String name, String image, int active);
    void deleteCategory(int id);

    // ------------------------Admin của e Khoi ------------------------
}
