package vn.edu.hcmuaf.fit.crocodile.dao.address;

import vn.edu.hcmuaf.fit.crocodile.config.JdbiConnect;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Address;

public class AddressDao implements IAddressDao {
    @Override
    public Address getAddressByIdAndUserId(int addressId, int userId) {
        String sql = "SELECT * FROM addresses where id = :addressId AND userId = :userId";
        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("addressId", addressId)
                        .bind("userId", userId)
                        .mapToBean(Address.class)
                        .findOne()
                        .orElse(null)
        );
    }
}
