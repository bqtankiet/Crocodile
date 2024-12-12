package services;

import configs.properties.AssetsProperties;
import dao.category.CategoryDao;
import dao.category.CategoryDaoImpl;
import models.Category;

import java.util.List;

public class CategoryService {
    private static final String IMAGE_FOLDER = AssetsProperties.categoriesImageDir();
    private final CategoryDao categoryDao;

    public CategoryService() {
        categoryDao = new CategoryDaoImpl();
    }

    public List<Category> getAllCategory(){
        List<Category> result = categoryDao.getAllCategory();
        result.forEach(c -> c.setImage(IMAGE_FOLDER +"/"+ c.getImage()));
        return result;
    }
}
