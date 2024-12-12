package services;

import configs.properties.AssetsProperties;
import dao.carousel.CarouselDao;
import dao.carousel.CarouselDaoImpl;
import models.Carousel;

import java.util.List;

public class CarouselService {
    private static final String IMAGE_FOLDER = AssetsProperties.carouselsImageDir();
    private final CarouselDao carouselDao;

    public CarouselService() {
        this.carouselDao = new CarouselDaoImpl();
    }

    public List<Carousel> getAllCarousel() {
        List<Carousel> result = carouselDao.getAllCarousel();
        result.forEach(c -> c.setImage(IMAGE_FOLDER + "/" + c.getImage()));
        return result;
    }

}
