package vn.edu.hcmuaf.fit.crocodile.dao.contact;

import vn.edu.hcmuaf.fit.crocodile.config.JdbiConnect;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Contact;

public class ContactDaoAdmin implements IContactDaoAdmin{
    @Override
    public Contact getContact() {
        String sql = "select * from contacts";
        return JdbiConnect.getJdbi().withHandle(handle ->
            handle.createQuery(sql)
                    .mapToBean(Contact.class)
                    .findFirst().orElse(null)
        );
    }
}
