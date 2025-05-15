package vn.edu.hcmuaf.fit.crocodile.service;

import vn.edu.hcmuaf.fit.crocodile.dao.product_review.ProductReviewDao;
import vn.edu.hcmuaf.fit.crocodile.model.entity.ProductReview;

import java.util.List;

public class ProductReviewService {
    ProductReviewDao productReviewDao;

    public ProductReviewService() {
        productReviewDao = new ProductReviewDao();
    }

    public List<ProductReview> getReviewsByProductId(int idProduct, int offset, int limit) {
        return productReviewDao.getReviewsByProductId(idProduct, offset, limit);
    }

    public List<ProductReview.ReviewImage> getImagesByReviewId(int idReview) {
        return productReviewDao.getImagesByReviewId(idReview);
    }

    public boolean incrementLike(int idReview) {
        return productReviewDao.incrementLike(idReview);
    }
}
