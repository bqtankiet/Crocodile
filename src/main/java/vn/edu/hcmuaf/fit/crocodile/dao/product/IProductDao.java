package vn.edu.hcmuaf.fit.crocodile.dao.product;

import vn.edu.hcmuaf.fit.crocodile.dao.BasicDao;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Product;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Product.*;

import java.util.List;

public interface IProductDao extends BasicDao<Integer, Product> {

    @Override
    Product findById(Integer integer);

    @Override
    List<Product> findAll();

    List<Product> findByCategoryId(int categoryId);

    List<ProductImage> findAllImagesByProductId(int productId);

    List<ProductAttribute> findAllAttributesByProductId(int productId);

    List<ProductOption> findAllOptionsByProductId(int productId, int group);

    List<ProductOption> findAllOptionsByProductIdV1(int productId, int group);

    List<ProductVariant> findAllVariantsByProductId(int productId);

    // ------------------------ em khoi test ----------------------------
    ProductOption findOptionsById(int id);

    ProductVariant getProductVariantById(int idVariant);

    List<Product> findAllProductsByCategoryId(int categoryId);

    List<Product> findProductsByCategoryAndPage(int idCate, int page);

    int getMaxPage(int idCate);

    List<Product> searchProduct(String keyWord);
    // ------------------------ em khoi test ----------------------------
}
