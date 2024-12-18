package vn.edu.hcmuaf.fit.crocodile.service;

import vn.edu.hcmuaf.fit.crocodile.config.properties.AssetsProperties;
import vn.edu.hcmuaf.fit.crocodile.dao.category.CategoryDao;
import vn.edu.hcmuaf.fit.crocodile.dao.category.CategoryDaoImpl;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Category;

import java.util.List;

public class CategoryService {
    private static final String IMAGE_FOLDER = AssetsProperties.categoriesImageDir();
    private final CategoryDao categoryDao;

    public CategoryService() {
        categoryDao = new CategoryDaoImpl();
    }

    public List<Category> getAllCategory(){
        List<Category> result = categoryDao.findAll();
        result.forEach(c -> c.setImage(IMAGE_FOLDER +"/"+ c.getImage()));
        return result;
    }
}
