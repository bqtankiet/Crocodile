import models.Carousel;
import org.junit.jupiter.api.Test;
import services.CarouselService;

import java.util.List;

public class CarouselServiceTest {

    @Test
    public void test(){
        CarouselService carouselService = new CarouselService();
        List<Carousel> result = carouselService.getAllCarousel();
        result.forEach(System.out::println);
    }

}
