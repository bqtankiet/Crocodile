package vn.edu.hcmuaf.fit.crocodile.dao.product;

import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.core.statement.Batch;
import vn.edu.hcmuaf.fit.crocodile.config.JdbiConnect;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Product;

import java.util.Arrays;
import java.util.List;

public class ProductDaoAdmin extends ProductDao implements IProductDaoAdmin {
    @Override
    public int insertAndGetIdProduct(Product product) {
        String sql = """
                INSERT INTO products (idCategory, name, image, price, description, active)
                VALUES (:idCategory, :name, :image, :price, :description, :active)
                """;
        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("idCategory", product.getCategory().getId())
                        .bind("name", product.getName())
                        .bind("image", product.getImage())
                        .bind("price", product.getPrice())
                        .bind("description", product.getDescription())
                        .bind("active", 1)
                        .executeAndReturnGeneratedKeys("id")
                        .mapTo(int.class)
                        .findFirst().orElse(-1)
        );
    }

    @Override
    public int insertAllAttributes(List<Product.ProductAttribute> attributes, int productId) {
        String sql = """
                INSERT INTO product_attributes (idProduct, `key`, value)
                VALUES (:idProduct, :key, :value)
                """;
        return JdbiConnect.getJdbi().withHandle(handle -> {
            var batch = handle.prepareBatch(sql);
            for (Product.ProductAttribute attr : attributes) {
                batch.bind("idProduct", productId)
                        .bind("key", attr.getKey())
                        .bind("value", attr.getValue())
                        .add();
            }
            return Arrays.stream(batch.execute()).sum();
        });
    }

    @Override
    public int insertAllImages(List<Product.ProductImage> images, int productId) {
        String sql = "INSERT INTO product_images (idProduct, `index`, image) VALUES (:idProduct, :index, :image)";
        return JdbiConnect.getJdbi().withHandle(handle -> {
            var batch = handle.prepareBatch(sql);
            for (Product.ProductImage image : images) {
                batch.bind("idProduct", productId)
                        .bind("index", image.getIndex())
                        .bind("image", image.getImage())
                        .add();
            }
            return Arrays.stream(batch.execute()).sum();
        });
    }

//    @Override
//    public int insertAllProductVariants(List<Product.ProductVariant> variants, int productId) {
//        String sql = """
//                INSERT INTO product_variants (idProduct, sku, idOption1, idOption2, stock)
//                VALUES (:idProduct, :sku, :idOption1, :idOption2, :stock)
//                """;
//        return JdbiConnect.getJdbi().withHandle(handle -> {
//            var batch = handle.prepareBatch(sql);
//            for (Product.ProductVariant variant : variants) {
//                int idOpt1 = insertAndGetIdProductOption(variant.getOption1(), productId);
//                int idOpt2 = insertAndGetIdProductOption(variant.getOption2(), productId);
//                batch.bind("idProduct", productId)
//                        .bind(("sku"), variant.getSku())
//                        .bind("idOption1", idOpt1 == -1 ? null : idOpt1)
//                        .bind("idOption2", idOpt2 == -1 ? null : idOpt2)
//                        .bind("stock", variant.getStock())
//                        .add();
//            }
//            return Arrays.stream(batch.execute()).sum();
//        });
//    }

    public int insertAllProductVariants(List<Product.ProductVariant> variants, int productId) {
        String sql = """
                INSERT INTO product_variants (idProduct, sku, idOption1, idOption2, stock)
                VALUES (:idProduct, :sku, :idOption1, :idOption2, :stock)
                """;

        return JdbiConnect.getJdbi().withHandle(handle -> {
            var batch = handle.prepareBatch(sql);

            for (Product.ProductVariant variant : variants) {
                int idOpt1 = -1;
                if (variant.getpOption1() != null) {
                    idOpt1 = getExistingOptionId(variant.getpOption1().getValue(), productId);
                    if (idOpt1 == -1) {
                        idOpt1 = insertAndGetIdProductOption(variant.getpOption1(), productId);
                    }
                }

                int idOpt2 = -1;
                if (variant.getpOption2() != null) {
                    idOpt2 = getExistingOptionId(variant.getpOption2().getValue(), productId);
                    if (idOpt2 == -1) {
                        idOpt2 = insertAndGetIdProductOption(variant.getpOption2(), productId);
                    }
                }

                batch.bind("idProduct", productId)
                        .bind("sku", variant.getSku())
                        .bind("idOption1", idOpt1 == -1 ? null : idOpt1) // Nếu không có idOpt1, gán null
                        .bind("idOption2", idOpt2 == -1 ? null : idOpt2) // Nếu không có idOpt2, gán null
                        .bind("stock", variant.getStock())
                        .add();
            }

            return Arrays.stream(batch.execute()).sum();
        });
    }

    @Override
    public int insertAndGetIdProductVariant(Product.ProductVariant variant, int productId) {
        String sql = """
                INSERT INTO product_variants (idProduct, sku, idOption1, idOption2, stock)
                VALUES (:idProduct, :sku, :idOption1, :idOption2, :stock)
                """;
        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("idProduct", productId)
                        .bind("sku", variant.getSku())
                        .bind("idOption1", variant.getIdOption1())
                        .bind("idOption2", variant.getIdOption2())
                        .bind("stock", variant.getStock())
                        .executeAndReturnGeneratedKeys("id")
                        .mapTo(int.class)
                        .findFirst().orElse(-1)
        );

    }

    @Override
    public int insertAndGetIdProductOption(Product.ProductOption option, int productId) {
        if (option == null) {
            return -1;
        }
        String sql = """
                INSERT INTO product_options (idProduct, `group`, `key`, value, imageIndex)
                VALUES (:idProduct, :group, :key, :value, :imageIndex)
                """;
        return JdbiConnect.getJdbi().withHandle(handle -> {
            String image = option.getImage();
            int imageIndex = getExistingImageIndex(image, productId);
            if (image != null && imageIndex == -1) {
                imageIndex = insertAndGetIndexProductImage(image, productId);
            }

            return handle.createUpdate(sql)
                            .bind("idProduct", productId)
                            .bind("group", option.getGroup())
                            .bind("key", option.getKey())
                            .bind("value", option.getValue())
                            .bind("imageIndex", imageIndex == -1 ? null : imageIndex)
                            .executeAndReturnGeneratedKeys("id")
                            .mapTo(int.class)
                            .findFirst().orElse(-1);
                }
        );
    }

    private int getExistingOptionId(String optionValue, int productId) {
        String query = "SELECT id FROM product_options WHERE value = :value AND idProduct = :idProduct";
        return JdbiConnect.getJdbi().withHandle(handle -> {
            return handle.createQuery(query)
                    .bind("idProduct", productId)
                    .bind("value", optionValue)
                    .mapTo(int.class)
                    .findFirst()
                    .orElse(-1); // -1 nếu không tìm thấy
        });
    }

    public int insertAndGetIndexProductImage(String image, int productId) {
        String sql = """
                INSERT INTO product_images (idProduct, `index`, image)
                VALUES (:idProduct, :index, :image)
                """;
        int maxIndex = getMaxImageIndex(productId);
        final int index = maxIndex != -1 ? maxIndex + 1 : 0;

        int rowAffected = JdbiConnect.getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("idProduct", productId)
                        .bind("index", index)
                        .bind("image", image)
                        .execute()
        );
        return rowAffected > 0 ? index : -1;
    }

    private int getExistingImageIndex(String image, int productId) {
        String query = """
                SELECT `index`
                FROM product_images
                WHERE image = :image AND idProduct = :idProduct
                LIMIT 1
                """;

        return JdbiConnect.getJdbi().withHandle(handle -> {
            return handle.createQuery(query)
                    .bind("image", image)
                    .bind("idProduct", productId)
                    .mapTo(int.class)
                    .findFirst()
                    .orElse(-1);  // Nếu không tìm thấy, trả về -1
        });
    }

    private int getMaxImageIndex(int idProduct) {
        String sql = """
                SELECT COALESCE(MAX(`index`), 0) AS maxIndex
                FROM product_images
                WHERE idProduct = :idProduct
                """;
        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("idProduct", idProduct)
                        .mapTo(int.class)
                        .findFirst()
                        .orElse(-1) // -1 là ko có hình ảnh trong bảng
        );

    }
}
