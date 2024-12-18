package vn.edu.hcmuaf.fit.crocodile.dao.product;

import vn.edu.hcmuaf.fit.crocodile.dao.BasicDao;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Product;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Product.*;

import java.util.List;

public interface ProductDao extends BasicDao<Integer, Product> {

    List<Product> findByCategoryId(int categoryId);

    List<ProductImage> findAllImagesByProductId(int productId);

    List<ProductDetail> findAllDetailsByProductId(int productId);

    List<ProductOption> findAllOptionsByProductId(int productId, int group);

    List<ProductVariant> findAllVariantsByProductId(int productId);
}
