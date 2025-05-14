package vn.edu.hcmuaf.fit.crocodile.dao.product_review;

import vn.edu.hcmuaf.fit.crocodile.model.entity.ProductReview;

import java.util.List;

public interface IProductReviewDao {
    List<ProductReview> getReviewsByProductId(int idVariant);

    List<ProductReview.ReviewImage> getImagesByReviewId(int idReview);
}
