package vn.edu.hcmuaf.fit.crocodile.dao;

import vn.edu.hcmuaf.fit.crocodile.model.entity.Carousel;

import java.util.List;

public interface BasicDao <ID, Entity> {

    Entity findById (ID id);

    List<Entity> findAll();

}
