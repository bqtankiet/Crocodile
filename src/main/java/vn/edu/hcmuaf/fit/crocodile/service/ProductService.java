package vn.edu.hcmuaf.fit.crocodile.service;

import vn.edu.hcmuaf.fit.crocodile.dao.product.IProductDao;
import vn.edu.hcmuaf.fit.crocodile.dao.product.IProductDaoAdmin;
import vn.edu.hcmuaf.fit.crocodile.dao.product.ProductDao;
import vn.edu.hcmuaf.fit.crocodile.dao.product.ProductDaoAdmin;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Product;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Product.*;

import java.util.List;

public class ProductService {

    private final IProductDao productDao;
    private final IProductDaoAdmin productDaoAdmin;

    public ProductService() {
        this.productDao = new ProductDao();
        this.productDaoAdmin = new ProductDaoAdmin();
    }

    public Product getProductById(int id) {
        return productDao.findById(id);
    }

    public List<ProductImage> getAllImagesByProductId(int productId) {
        return productDao.findAllImagesByProductId(productId);
    }

    public List<ProductAttribute> getAllAttributesByProductId(int productId) {
        return productDao.findAllAttributesByProductId(productId);
    }

    public ProductOptionGroup getProductOptionGroupById(int productId, int group) {
        List<ProductOption> options = productDao.findAllOptionsByProductIdV1(productId, group);
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

    public int getMaxPage(int idCate) {
        return productDao.getMaxPage(idCate);
    }

    public List<Product> getAllProducts() {
        return productDao.findAll();
    }

    // ------------------------ em khoi test ----------------------------

    public ProductOption findOptionsById(int id) {
        return productDao.findOptionsById(id);
    }

//    public ProductVariant getProductVariantById(int idVariant) {
//        return productDao.getProductVariantById(idVariant);
//    }

    // Em Kiet Test
    public ProductVariant getProductVariantById(int idVariant) {
        ProductVariant pv = productDao.getProductVariantById(idVariant);
        pv.setProduct(getProductById(pv.getIdProduct()));
        pv.setpOption1(productDao.findOptionsById(pv.getIdOption1()));
        pv.setpOption2(productDao.findOptionsById(pv.getIdOption2()));
        return pv;
    }

    // ------------------------ em khoi test ----------------------------

    public int insertProduct(Product product) {
        int productId = productDaoAdmin.insertAndGetIdProduct(product);
        product.setId(productId);
        return productId;
    }

    public int insertAttributes(List<ProductAttribute> attributes, int productId) {
        return productDaoAdmin.insertAllAttributes(attributes, productId);
    }

    public int insertImages(List<ProductImage> images, int productId) {
        return productDaoAdmin.insertAllImages(images, productId);
    }

    public int insertProductVariants(List<ProductVariant> variants, int productId) {
        return productDaoAdmin.insertAllProductVariants(variants, productId);
    }

    public List<Product> getTopSellingProductsInDays(int topN, int days) {
        return productDao.getTopSellingProductsInDays(topN, days);
    }

    public List<Product> findRandomNSimilarProducts(int n, int idProduct) {
        return productDao.findRandomNSimilarProducts(n, idProduct);
    }

    public List<Product> getTopSellingProductsOfCategory(int topN, int days, int idCategory) {
        return productDao.getTopSellingProductsOfCategory(topN, days, idCategory);
    }
}
