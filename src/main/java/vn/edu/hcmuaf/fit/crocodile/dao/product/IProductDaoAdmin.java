package vn.edu.hcmuaf.fit.crocodile.dao.product;

import vn.edu.hcmuaf.fit.crocodile.model.entity.Product;

import java.util.List;

public interface IProductDaoAdmin extends IProductDao{

    int insertAndGetIdProduct(Product product);

    int insertAndGetIdProductOption(Product.ProductOption option, int productId);

    int insertAllAttributes(List<Product.ProductAttribute> attributes, int productId);

    int insertAllImages(List<Product.ProductImage> images, int productId);

    int insertAllProductVariants(List<Product.ProductVariant> variants, int productId);

    int insertAndGetIdProductVariant(Product.ProductVariant variant, int productId);

    int deleteProduct(int id);
}
