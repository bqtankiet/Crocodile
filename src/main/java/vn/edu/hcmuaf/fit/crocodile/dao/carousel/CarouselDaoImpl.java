package vn.edu.hcmuaf.fit.crocodile.dao.carousel;

import vn.edu.hcmuaf.fit.crocodile.config.JdbiConnect;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Carousel;

import java.util.List;

public class CarouselDaoImpl implements CarouselDao {

    @Override
    public Carousel findById(Integer integer) {
        return null;
    }

    @Override
    public List<Carousel> findAll() {
        String sql = "SELECT * FROM carousels WHERE active=1";

        List<Carousel> result;
        result = JdbiConnect.getJdbi().withHandle(handle ->
            handle.createQuery(sql)
                    .mapToBean(Carousel.class)
                    .list()
        );
        return result;
    }
}
