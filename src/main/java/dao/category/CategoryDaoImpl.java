package dao.category;

import configs.dbConfig.JdbiConnect;
import models.Category;

import java.util.List;

public class CategoryDaoImpl implements CategoryDao {

    @Override
    public List<Category> getAllCategory() {
        List<Category> results;
        String sql = "SELECT * FROM categories WHERE active=1";
        results = JdbiConnect.getJdbi().withHandle(handle ->
            handle.createQuery(sql)
                    .mapToBean(Category.class)
                    .list()
        );
        return results;
    }
}
