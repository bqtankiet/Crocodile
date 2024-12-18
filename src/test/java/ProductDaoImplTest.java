import org.junit.jupiter.api.Test;
import vn.edu.hcmuaf.fit.crocodile.dao.product.ProductDaoImpl;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Product;
import vn.edu.hcmuaf.fit.crocodile.service.ProductService;

import java.util.List;

public class ProductDaoImplTest {

    @Test
    public void test() {
        // test findAll()
//        List<Product> products = new ProductDaoImpl().findAll();
//        products.forEach(System.out::println);

        // test findById()
//        ProductDaoImpl dao = new ProductDaoImpl();
//        Product product = dao.findById(1);
//        System.out.println(product);

        // test findByCategoryId()
//        ProductDaoImpl dao = new ProductDaoImpl();
//        List<Product> products = dao.findByCategoryId(1);
//        System.out.println(products);

        // test ProductService.getProductById()
        ProductService  productService = new ProductService();
        Product p = productService.getProductById(1);
        System.out.println(p);
    }

}
