package vn.edu.hcmuaf.fit.crocodile.service;

import vn.edu.hcmuaf.fit.crocodile.dao.product.ProductDao;
import vn.edu.hcmuaf.fit.crocodile.dao.product.ProductDaoImpl;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Product;

public class ProductService {

    private final ProductDao productDao;

    public ProductService() {
        this.productDao = new ProductDaoImpl();
    }

    public Product getProductById(int id){
        return productDao.findById(id);
    }

}
