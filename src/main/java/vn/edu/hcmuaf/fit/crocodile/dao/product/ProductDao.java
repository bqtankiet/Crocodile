package vn.edu.hcmuaf.fit.crocodile.dao.product;

import vn.edu.hcmuaf.fit.crocodile.dao.BasicDao;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Product;

import java.util.List;

public interface ProductDao extends BasicDao<Integer, Product> {

    List<Product> findByCategoryId(int categoryId);

}
