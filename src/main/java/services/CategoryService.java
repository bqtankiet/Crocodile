package services;

import dao.category.CategoryDao;
import dao.category.CategoryDaoImpl;
import models.Category;

import java.util.List;

public class CategoryService {

    private final CategoryDao categoryDao;

    public CategoryService() {
        categoryDao = new CategoryDaoImpl();
    }

    public List<Category> getAllCategory(){
        return categoryDao.getAllCategory();
    }
}
