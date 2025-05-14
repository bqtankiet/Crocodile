package vn.edu.hcmuaf.fit.crocodile.dao.product_review;

import vn.edu.hcmuaf.fit.crocodile.config.JdbiConnect;
import vn.edu.hcmuaf.fit.crocodile.model.entity.ProductReview;

import java.util.List;

public class ProductReviewDao implements IProductReviewDao {

    @Override
    public List<ProductReview> getReviewsByProductId(int idVariant) {
        String sql = """
            SELECT
                pr.*,
                u.username,
                po1.value AS option1Value,
                po2.value AS option2Value
            FROM product_reviews pr
            JOIN users u ON pr.idUser = u.id
            JOIN product_variants pv ON pr.idVariant = pv.id
            LEFT JOIN product_options po1 ON pv.idOption1 = po1.id
            LEFT JOIN product_options po2 ON pv.idOption2 = po2.id
            WHERE pr.idVariant = :idVariant;
        """;

        return JdbiConnect.getJdbi().withHandle(handle ->
            handle.createQuery(sql)
                    .bind("idVariant", idVariant)
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
}
