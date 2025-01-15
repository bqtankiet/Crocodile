import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDaoImpl;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Address;

public class AddressTest {
    public static void main(String[] args) {

        UserDaoImpl userDao = new UserDaoImpl();
        System.out.println(userDao.getOrdersByUserId(4));

    }
}
