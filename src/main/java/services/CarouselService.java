package services;

import configs.properties.AssetsProperties;
import dao.carousel.CarouselDao;
import dao.carousel.CarouselDaoImpl;
import models.Carousel;
import models.Category;

import java.util.List;

public class CarouselService {
    private static final String IMAGE_FOLDER = AssetsProperties.categories_img();
    private final CarouselDao carouselDao;

    public CarouselService() {
        this.carouselDao = new CarouselDaoImpl();
    }

    public List<Carousel> getAllCarousel() {
        return carouselDao.getAllCarousel();
    }

}
