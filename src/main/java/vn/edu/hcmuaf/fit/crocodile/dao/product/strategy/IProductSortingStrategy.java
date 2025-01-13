package vn.edu.hcmuaf.fit.crocodile.dao.product.strategy;

import vn.edu.hcmuaf.fit.crocodile.model.entity.Product;

import java.util.List;

public interface IProductSortingStrategy {
    List<Product> findAllWithPagination(int idCate, int page, int size);
    String getName();
}
