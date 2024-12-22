package vn.edu.hcmuaf.fit.crocodile.dao.carousel;

import vn.edu.hcmuaf.fit.crocodile.dao.BasicDao;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Carousel;

import java.util.List;

public interface CarouselDao extends BasicDao<Integer, Carousel> {

    @Override
    Carousel findById(Integer integer);

    @Override
    List<Carousel> findAll();

    List<Carousel> findAllActive();

}
