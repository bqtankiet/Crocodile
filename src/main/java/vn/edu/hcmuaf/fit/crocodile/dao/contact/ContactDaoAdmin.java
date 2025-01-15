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

    @Override
    public int updateContact(String title, String location, String phone, String iframe) {
        String sql = "update contacts set title = :title, location = :location, phone = :phone, iframe = :iframe";
        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("title", title)
                        .bind("location", location)
                        .bind("phone", phone)
                        .bind("iframe", iframe)
                        .execute()
        );
    }
}
