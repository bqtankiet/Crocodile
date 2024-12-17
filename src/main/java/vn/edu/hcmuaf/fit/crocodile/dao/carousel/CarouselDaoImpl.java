package vn.edu.hcmuaf.fit.crocodile.dao.carousel;

import vn.edu.hcmuaf.fit.crocodile.config.JdbiConnect;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Carousel;

import java.util.List;


public class CarouselDaoImpl implements CarouselDao {

    @Override
    public List<Carousel> getAllCarousel() {
        List<Carousel> result;
        String sql = "SELECT * FROM carousels WHERE active=1";
        result = JdbiConnect.getJdbi().withHandle(handle ->
            handle.createQuery(sql)
                    .mapToBean(Carousel.class)
                    .list()
        );
        return result;
    }
}
