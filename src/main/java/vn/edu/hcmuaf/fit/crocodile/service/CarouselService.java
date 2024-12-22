package vn.edu.hcmuaf.fit.crocodile.service;

import vn.edu.hcmuaf.fit.crocodile.dao.carousel.CarouselDao;
import vn.edu.hcmuaf.fit.crocodile.dao.carousel.CarouselDaoImpl;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Carousel;

import java.util.List;

public class CarouselService {
    private final CarouselDao carouselDao;

    public CarouselService() {
        this.carouselDao = new CarouselDaoImpl();
    }

    public List<Carousel> getAllActiveCarousel() {
        return carouselDao.findAllActive();
    }

}
