import models.Category;
import org.junit.jupiter.api.Test;
import services.CategoryService;

import java.util.List;

public class CategoryServiceTest  {

    @Test
    public void test() {
        CategoryService categoryService = new CategoryService();
        List<Category> categories = categoryService.getAllCategory();
        categories.forEach(System.out::println);
    }

}
