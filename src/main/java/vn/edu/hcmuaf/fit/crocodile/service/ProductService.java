package vn.edu.hcmuaf.fit.crocodile.service;

import vn.edu.hcmuaf.fit.crocodile.dao.product.IProductDao;
import vn.edu.hcmuaf.fit.crocodile.dao.product.ProductDao;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Product;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Product.*;

import java.util.List;

public class ProductService {

    private final IProductDao productDao;

    public ProductService() {
        this.productDao = new ProductDao();
    }

    public Product getProductById(int id){
        return productDao.findById(id);
    }

    public List<ProductImage> getAllImagesByProductId(int productId) {
        return productDao.findAllImagesByProductId(productId);
    }

    public List<ProductDetail> getAllDetailsByProductId(int productId) {
        return productDao.findAllDetailsByProductId(productId);
    }

    public ProductOptionGroup getProductOptionGroupById(int productId, int group) {
        List<ProductOption> options = productDao.findAllOptionsByProductId(productId, group);
        if (options.isEmpty()) {
            return null;
        }

        ProductOptionGroup optionGroup = new ProductOptionGroup();
        optionGroup.setGroupNo(group);
        optionGroup.setGroupName(options.get(0).getKey());
        optionGroup.setOptions(options);

        return optionGroup;
    }

    public List<ProductVariant> getAllVariantsByProductId(int productId) {
        return productDao.findAllVariantsByProductId(productId);
    }

    // ------------------------ begin admin method ------------------------
    public List<Product> getAllProducts() {
        return productDao.findAll();
    }
    // ------------------------ close admin method ------------------------

    // ------------------------ em khoi test ----------------------------
    public ProductOption findOptionsById(int id) {
        return productDao.findOptionsById(id);
    }
    public ProductVariant getProductVariantById(int idVariant) {
        return productDao.getProductVariantById(idVariant);
    }
    // ------------------------ em khoi test ----------------------------
}
