import vn.edu.hcmuaf.fit.crocodile.model.entity.Category;
import org.junit.jupiter.api.Test;
import vn.edu.hcmuaf.fit.crocodile.service.CategoryService;

import java.util.List;

public class CategoryServiceTest  {

    @Test
    public void test() {
        CategoryService categoryService = new CategoryService();
        List<Category> categories = categoryService.getAllActiveCategory();
        categories.forEach(System.out::println);
    }

}
