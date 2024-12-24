package vn.edu.hcmuaf.fit.crocodile.service;

import vn.edu.hcmuaf.fit.crocodile.dao.carousel.ICarouselDao;
import vn.edu.hcmuaf.fit.crocodile.dao.carousel.CarouselDao;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Carousel;

import java.util.List;

public class CarouselService {
    private final ICarouselDao carouselDao;

    public CarouselService() {
        this.carouselDao = new CarouselDao();
    }

    public List<Carousel> getAllActiveCarousel() {
        return carouselDao.findAllActive();
    }

}
