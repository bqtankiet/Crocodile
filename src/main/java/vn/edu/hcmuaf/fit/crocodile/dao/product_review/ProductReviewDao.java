package vn.edu.hcmuaf.fit.crocodile.dao.product_review;

import vn.edu.hcmuaf.fit.crocodile.config.JdbiConnect;
import vn.edu.hcmuaf.fit.crocodile.model.entity.ProductReview;

import java.util.List;

public class ProductReviewDao implements IProductReviewDao {

    @Override
    public List<ProductReview> getReviewsByProductId(int idProduct, int offset, int limit) {
        String sql = """
                SELECT
                    pr.*,
                    u.username AS username,
                    po1.value AS option1Value,
                    po2.value AS option2Value
                FROM product_reviews pr
                JOIN users u ON pr.idUser = u.id
                JOIN product_variants pv ON pr.idVariant = pv.id
                LEFT JOIN product_options po1 ON pv.idOption1 = po1.id
                LEFT JOIN product_options po2 ON pv.idOption2 = po2.id
                WHERE pr.idProduct = :idProduct
                ORDER BY pr.createdAt DESC
                LIMIT :limit OFFSET :offset
            """;

        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("idProduct", idProduct)
                        .bind("limit", limit)
                        .bind("offset", offset)
                        .mapToBean(ProductReview.class)
                        .list()
        );
    }

    @Override
    public List<ProductReview.ReviewImage> getImagesByReviewId(int idReview) {
        String sql = "SELECT * FROM review_images WHERE idReview = :idReview";

        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("idReview", idReview)
                        .mapToBean(ProductReview.ReviewImage.class)
                        .list()
        );
    }

    @Override
    public boolean incrementLike(int idReview) {
        String sql = "UPDATE product_reviews SET likeCount = likeCount + 1 WHERE id = :idReview";
        return JdbiConnect.getJdbi().withHandle(handle ->
                    handle.createUpdate(sql)
                            .bind("idReview", idReview)
                            .execute() > 0
        );
    }

    @Override
    public double getAverageRatingForProduct(int idProduct) {
        String sql = "SELECT AVG(rating) FROM product_reviews WHERE idProduct = :idProduct";

        return JdbiConnect.getJdbi().withHandle(handle ->
                  handle.createQuery(sql)
                          .bind("idProduct", idProduct)
                          .mapTo(Double.class)
                          .findOne()
                          .orElse(0.0)
                );
    }

    @Override
    public List<ProductReview> getReviewsByRating(int idProduct, int rating) {
        String sql = """
                    SELECT
                    pr.*,
                    u.username AS username,
                    po1.value AS option1Value,
                    po2.value AS option2Value
                FROM product_reviews pr
                JOIN users u ON pr.idUser = u.id
                JOIN product_variants pv ON pr.idVariant = pv.id
                LEFT JOIN product_options po1 ON pv.idOption1 = po1.id
                LEFT JOIN product_options po2 ON pv.idOption2 = po2.id
                WHERE pr.idProduct = :idProduct AND pr.rating = :rating
                ORDER BY pr.createdAt DESC""";

        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("idProduct", idProduct)
                        .bind("rating", rating)
                        .mapToBean(ProductReview.class)
                        .list()
                );
    }

    @Override
    public int evaluateProduct(int idProduct, int idVariant, int idUser, int rating, String productQuality, String matchDescription, String reviewText, int isShowUsername) {
        String sql = """
            INSERT INTO product_reviews (idProduct, idVariant, idUser, rating, productQuality, matchDescription, reviewText, isShowUsername) 
            VALUES (:idProduct, :idVariant, :idUser, :rating, :productQuality, :matchDescription, :reviewText, :isShowUsername)
            """;
        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("idProduct", idProduct)
                        .bind("idVariant", idVariant)
                        .bind("idUser", idUser)
                        .bind("rating", rating)
                        .bind("productQuality", productQuality)
                        .bind("matchDescription", matchDescription)
                        .bind("reviewText", reviewText)
                        .bind("isShowUsername", isShowUsername)
                        .execute()
        );
    }

}
