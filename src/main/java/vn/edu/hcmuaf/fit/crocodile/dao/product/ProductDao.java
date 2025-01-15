package vn.edu.hcmuaf.fit.crocodile.dao.product;

import vn.edu.hcmuaf.fit.crocodile.config.JdbiConnect;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Product;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Product.*;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

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
    public List<ProductAttribute> findAllAttributesByProductId(int productId) {
        String sql = """
                SELECT id, idProduct, `key`, `value`
                FROM product_attributes
                WHERE idProduct = :productId
                """;

        List<ProductAttribute> result;
        result = JdbiConnect.getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("productId", productId)
                        .mapToBean(ProductAttribute.class)
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
                SELECT id, idProduct, sku, idOption1, idOption2, stock
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
    public ProductOption findOptionsById(int id) {
        String sql = "SELECT * FROM product_options WHERE id = :id";

        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("id", id)
                        .mapToBean(ProductOption.class)
                        .findFirst()
                        .orElse(null)
        );
    }

    @Override
    public ProductVariant getProductVariantById(int idVariant) {
        String sql = "SELECT * FROM product_variants WHERE id = :idVariant";
        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("idVariant", idVariant)
                        .mapToBean(ProductVariant.class)
                        .findFirst()
                        .orElse(null)
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
        int offset = (page - 1) * N;
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

    @Override
    public List<Product> getTopSellingProductsInDays(int topN, int days) {
        String sql = """
                SELECT
                  p.*,
                  SUM( od.quantity ) AS totalSold
                FROM
                  order_details od
                  JOIN orders o ON od.idOrder = o.id
                  JOIN product_variants pv ON od.idVariant = pv.id
                  JOIN products p ON pv.idProduct = p.id
                  JOIN categories c ON p.idCategory = c.id
                WHERE
                  DATEDIFF( CURRENT_DATE, o.invoiceDate ) <= :days
                  AND p.active = 1
                  AND c.active = 1
                GROUP BY
                  p.id,
                  p.name
                ORDER BY
                  totalSold DESC
                  LIMIT :topN;
                """;
        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("days", days)
                        .bind("topN", topN)
                        .mapToBean(Product.class)
                        .list()
        );
    }

    @Override
    public List<Product> findRandomNSimilarProducts(int n, int idProduct) {
        String sql = """
                SELECT * FROM products
                WHERE idCategory = ( SELECT idCategory FROM products WHERE id = :idProduct ) AND id != :idProduct
                ORDER BY RAND()
                LIMIT :n
                """;
        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("idProduct", idProduct)
                        .bind("n", n)
                        .mapToBean(Product.class)
                        .list()
        );
    }

    @Override
    public List<Product> getTopSellingProductsOfCategory(int topN, int days, int idCategory) {
        String sql = """
                SELECT
                  p.*,
                  SUM( od.quantity ) AS totalSold
                FROM
                  order_details od
                  JOIN orders o ON od.idOrder = o.id
                  JOIN product_variants pv ON od.idVariant = pv.id
                  JOIN products p ON pv.idProduct = p.id
                  JOIN categories c ON p.idCategory = c.id
                WHERE
                  DATEDIFF( CURRENT_DATE, o.invoiceDate ) <= :days
                  AND p.active = 1
                  AND c.active = 1
                  AND c.id = :idCategory
                GROUP BY
                  p.id,
                  p.name
                ORDER BY
                  totalSold DESC
                  LIMIT :topN;
                """;
        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("topN", topN)
                        .bind("days", days)
                        .bind("idCategory", idCategory)
                        .mapToBean(Product.class)
                        .list()
        );
    }

    @Override
    public List<Product> searchProduct(String keyWord) {
        String sql = "select * from products where name like :keyWord";
        return JdbiConnect.getJdbi().withHandle(handle ->
            handle.createQuery(sql)
                    .bind("keyWord", "%"+keyWord+"%")
                    .mapToBean(Product.class)
                    .list()
        );
    }

    public List<Product> searchProductsWithPagination(String keyWord, int page, int size) {
        // Sử dụng StringTokenizer để tách từ khóa thành các từ
        StringTokenizer tokenizer = new StringTokenizer(keyWord);
        List<String> words = new ArrayList<>();
        while (tokenizer.hasMoreTokens()) {
            words.add(tokenizer.nextToken());
        }

        // Xây dựng câu điều kiện LIKE động
        StringBuilder whereClause = new StringBuilder();
        for (int i = 0; i < words.size(); i++) {
            whereClause.append("`name` LIKE :word").append(i);
            if (i < words.size() - 1) {
                whereClause.append(" AND ");
            } else {
                whereClause.append("\n");
            }
        }

        // Tạo câu truy vấn SQL
        String sql = """
        SELECT *
        FROM products
        WHERE """ + whereClause + """
        ORDER BY id
        LIMIT :size OFFSET :offset
        """;

        // Sử dụng JDBI để thực thi truy vấn
        return JdbiConnect.getJdbi().withHandle(handle -> {
            var query = handle.createQuery(sql);

            // Gắn giá trị cho từng tham số động
            for (int i = 0; i < words.size(); i++) {
                query.bind("word" + i, "%" + words.get(i) + "%");
            }

            // Gắn các tham số phân trang
            query.bind("offset", (page - 1) * size)
                    .bind("size", size);

            return query.mapToBean(Product.class).list();
        });
    }


    // ------------------------ em khoi test ----------------------------
}
