package vn.edu.hcmuaf.fit.crocodile.dao.category;

import vn.edu.hcmuaf.fit.crocodile.model.entity.Category;

import java.util.List;

public interface ICategoryDaoAdmin extends ICategoryDao {

    // ------------------------Admin của e Khoi ------------------------
    int updateCategory(int id, String name, String image, int active);

    int insertCategory(String name, String image, int active);

    int deleteCategory(int id);
    // ------------------------Admin của e Khoi ------------------------


}
