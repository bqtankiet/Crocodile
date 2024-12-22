package vn.edu.hcmuaf.fit.crocodile.service;

import vn.edu.hcmuaf.fit.crocodile.dao.category.CategoryDao;
import vn.edu.hcmuaf.fit.crocodile.dao.category.CategoryDaoImpl;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Category;

import java.util.List;

public class CategoryService {
    private final CategoryDao categoryDao;

    public CategoryService() {
        categoryDao = new CategoryDaoImpl();
    }

    public List<Category> getAllActiveCategory(){
        return categoryDao.findAllActive();
    }
}
