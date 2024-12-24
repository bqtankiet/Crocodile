import vn.edu.hcmuaf.fit.crocodile.model.entity.Carousel;
import org.junit.jupiter.api.Test;
import vn.edu.hcmuaf.fit.crocodile.service.CarouselService;

import java.util.List;

public class CarouselServiceTest {

    @Test
    public void test(){
        CarouselService carouselService = new CarouselService();
        List<Carousel> result = carouselService.getAllActiveCarousel();
        result.forEach(System.out::println);
    }

}
