package vn.edu.hcmuaf.fit.crocodile.dao.address;

import vn.edu.hcmuaf.fit.crocodile.model.entity.Address;

public interface IAddressDao {

    Address getAddressByIdAndUserId(int addressId, int userId);

}
