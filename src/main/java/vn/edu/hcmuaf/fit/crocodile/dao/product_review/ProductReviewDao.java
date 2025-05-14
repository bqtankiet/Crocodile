package vn.edu.hcmuaf.fit.crocodile.dao.product_review;

import vn.edu.hcmuaf.fit.crocodile.config.JdbiConnect;
import vn.edu.hcmuaf.fit.crocodile.model.entity.ProductReview;

import java.util.List;

public class ProductReviewDao implements IProductReviewDao {

    @Override
    public List<ProductReview> getReviewsByProductId(int idVariant) {
        String sql = "select * from product_review where idProduct = :idVariant";

        return JdbiConnect.getJdbi().withHandle(handle ->
            handle.createQuery(sql)
                    .bind("idVariant", idVariant)
                    .mapToBean(ProductReview.class)
                    .list()
        );
    }
}
