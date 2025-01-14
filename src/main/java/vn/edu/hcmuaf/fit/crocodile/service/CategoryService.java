package vn.edu.hcmuaf.fit.crocodile.service;

import vn.edu.hcmuaf.fit.crocodile.dao.category.CategoryDaoAdmin;
import vn.edu.hcmuaf.fit.crocodile.dao.category.ICategoryDao;
import vn.edu.hcmuaf.fit.crocodile.dao.category.CategoryDao;
import vn.edu.hcmuaf.fit.crocodile.dao.category.ICategoryDaoAdmin;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Category;

import java.util.List;

public class CategoryService {
    private final ICategoryDao categoryDao;
    private final ICategoryDaoAdmin categoryDaoAdmin;

    public CategoryService() {
        this.categoryDao = new CategoryDao();
        this.categoryDaoAdmin = new CategoryDaoAdmin();
    }

    public Category getCategoryById(int id){
        return categoryDao.findById(id);
    }

    public List<Category> getAllActiveCategory(){
        return categoryDao.findAll();
    }

    // ------------------------ begin admin method ------------------------
    public List<Category> getAllCategoryAdmin(){
        return categoryDaoAdmin.findAll();
    }

    public int updateCategory(int id, String name, String image, int active) {
        return categoryDaoAdmin.updateCategory(id, name, image, active);
    }

    public int insertCategory(String name, String uniqueFileName, int active) {
        return categoryDaoAdmin.insertCategory(name, uniqueFileName, active);
    }

    public int deleteCategory(int id) {
        return categoryDaoAdmin.deleteCategory(id);
    }
    // ------------------------ close admin method ------------------------

    public List<Category> getTopSellingCategoriesInDays(int topN, int days){
        return categoryDao.getTopSellingCategoriesInDays(topN, days);
    }

}
