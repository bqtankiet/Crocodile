package vn.edu.hcmuaf.fit.crocodile.dao.product;

import vn.edu.hcmuaf.fit.crocodile.config.JdbiConnect;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Product;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Product.*;

import java.util.List;

public class ProductDao implements IProductDao {
    @Override
    public Product findById(Integer id) {
        String sql = """
                SELECT
                    p.id, p.idCategory, p.`name`, p.image,p.price,
                    p.description, p.createDate, p.active,
                    c.id as categoryId, c.`name` as categoryName
                FROM products p
                JOIN categories c ON p.idCategory = c.id
                WHERE p.id = :id
                """;

        Product result;
        result = JdbiConnect.getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("id", id)
                        .map(new ProductRowMapper())
                        .findFirst()
                        .orElse(null)
        );

        return result;

    }

    @Override
    public List<Product> findAll() {
        String sql = """
                SELECT p.*, c.id as categoryId, c.`name` as categoryName
                FROM products p
                JOIN categories c ON p.idCategory = c.id
                """;

        List<Product> result;
        result = JdbiConnect.getJdbi().withHandle(handle ->
            handle.createQuery(sql)
                    .map(new ProductRowMapper())
                    .list()
        );

        return result;
    }

    @Override
    public List<Product> findByCategoryId(int categoryId) {
        String sql = """
                SELECT p.*, c.id as categoryId, c.`name` as categoryName
                FROM products p
                JOIN categories c ON p.idCategory = c.id
                WHERE c.id = :categoryId
                """;

        List<Product> result;
        result = JdbiConnect.getJdbi().withHandle(handle ->
            handle.createQuery(sql)
                    .bind("categoryId", categoryId)
                    .map(new ProductRowMapper())
                    .list()
        );

        return result;
    }

    @Override
    public List<ProductImage> findAllImagesByProductId(int productId) {
        String sql = """
                SELECT id, idProduct, `index`, image
                FROM product_images
                WHERE idProduct = :productId
                ORDER BY `index`
                """;

        List<ProductImage> result;
        result = JdbiConnect.getJdbi().withHandle(handle ->
            handle.createQuery(sql)
                    .bind("productId", productId)
                    .mapToBean(ProductImage.class)
                    .list()
        );

        return result;
    }

    @Override
    public List<ProductDetail> findAllDetailsByProductId(int productId) {
        String sql = """
                SELECT id, idProduct, `key`, `value`
                FROM product_details
                WHERE idProduct = :productId
                """;

        List<ProductDetail> result;
        result = JdbiConnect.getJdbi().withHandle(handle ->
            handle.createQuery(sql)
                    .bind("productId", productId)
                    .mapToBean(ProductDetail.class)
                    .list()
        );

        return result;
    }

    @Override
    public List<ProductOption> findAllOptionsByProductId(int productId, int group) {
        String sql = """
                SELECT
                  po.id, po.`group`, po.`key`, po.`value`,
                  po.idImage, pi.image,
                  po.idProduct, p.`name`
                FROM products p
                JOIN product_options po ON p.id = po.idProduct
                LEFT JOIN product_images pi ON po.idImage = pi.id
                WHERE p.id = :productId AND po.`group` = :group
                """;

        List<ProductOption> result;
        result = JdbiConnect.getJdbi().withHandle(handle ->
            handle.createQuery(sql)
                    .bind("productId", productId)
                    .bind("group", group)
                    .mapToBean(ProductOption.class)
                    .list()
        );

        return result;
    }

    @Override
    public List<ProductOption> findAllOptionsByProductIdV1(int productId, int group) {
        String sql = """
                SELECT
                    po.id, po.`group`, po.`key`, po.`value`,
                    po.imageIndex, pi.image,
                    po.idProduct, p.`name`
                FROM products p
                JOIN product_options po ON p.id = po.idProduct
                LEFT JOIN product_images pi ON po.imageIndex = pi.index AND po.idProduct = pi.idProduct
                WHERE p.id = :productId AND po.`group` = :group
                """;
        List<ProductOption> result;
        result = JdbiConnect.getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("productId", productId)
                        .bind("group", group)
                        .mapToBean(ProductOption.class)
                        .list()
        );

        return result;
    }

    @Override
    public List<ProductVariant> findAllVariantsByProductId(int productId) {
        String sql = """
                SELECT
                  id, idProduct, sku, idOption1, idOption2, stock
                FROM product_variants
                WHERE idProduct = :productId
                """;

        List<ProductVariant> result;
        result = JdbiConnect.getJdbi().withHandle(handle ->
            handle.createQuery(sql)
                    .bind("productId", productId)
                    .mapToBean(ProductVariant.class)
                    .list()
        );

        return result;
    }


    // ------------------------ em khoi test ----------------------------
    @Override
    public List<ProductOption> findOptionsByProductId(int productId) {
        String sql = "select * from product_options where idProduct = :productId";

        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("productId", productId)
                        .mapToBean(ProductOption.class)
                        .list()
        );
    }

    @Override
    public List<Product> findAllProductsByCategoryId(int categoryId) {
        String sql = "SELECT * FROM products WHERE idCategory = :categoryId";

        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("idCategory", categoryId)
                        .mapToBean(Product.class)
                        .list()
        );
    }

    @Override
    public List<Product> findProductsByCategoryAndPage(int idCate, int page) {
        final int N = 12;
        int offset = (page-1)*N;
        String sql = """
                SELECT *
                FROM products p
                WHERE p.idCategory = :idCate AND active = 1
                ORDER BY p.id
                LIMIT :N OFFSET :offset
                """;
        return JdbiConnect.getJdbi().withHandle(handle ->
            handle.createQuery(sql)
                    .bind("idCate", idCate)
                    .bind("offset", offset)
                    .bind("N", N)
                    .mapToBean(Product.class)
                    .list()
        );
    }

    @Override
    public int getMaxPage(int idCate) {
        String sql = "SELECT CEIL(COUNT(*) / 12) AS maxPage FROM products WHERE idCategory = :idCate";
        return JdbiConnect.getJdbi().withHandle(handle ->
            handle.createQuery(sql)
                    .bind("idCate", idCate)
                    .mapTo(Integer.class)
                    .findFirst()
                    .orElse(1)
        );
    }

    // ------------------------ em khoi test ----------------------------
}
