package vn.edu.hcmuaf.fit.crocodile.service;

import vn.edu.hcmuaf.fit.crocodile.config.properties.AssetsProperties;
import vn.edu.hcmuaf.fit.crocodile.dao.carousel.CarouselDao;
import vn.edu.hcmuaf.fit.crocodile.dao.carousel.CarouselDaoImpl;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Carousel;

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
