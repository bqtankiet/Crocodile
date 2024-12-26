package vn.edu.hcmuaf.fit.crocodile.dao.category;

import vn.edu.hcmuaf.fit.crocodile.dao.BasicDao;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Category;

import java.util.List;

public interface ICategoryDao extends BasicDao<Integer, Category> {

    @Override
    Category findById(Integer integer);

    @Override
    List<Category> findAll();
}
