package vn.edu.hcmuaf.fit.crocodile.dao.product_review;

import vn.edu.hcmuaf.fit.crocodile.model.entity.ProductReview;

import java.util.List;

public interface IProductReviewDao {
    List<ProductReview> getReviewsByProductId(int idProduct, int offset, int limit);

    List<ProductReview.ReviewImage> getImagesByReviewId(int idReview);

    boolean incrementLike(int idReview);

    double getAverageRatingForProduct(int idProduct);

    List<ProductReview> getReviewsByRating(int idProduct, int rating);

    int evaluateProduct(int idProduct, int idVariant, int idUser, int rating, String productQuality, String matchDescription, String reviewText, int isShowUsername);
}
