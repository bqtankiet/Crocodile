package vn.edu.hcmuaf.fit.crocodile.dao.contact;

import vn.edu.hcmuaf.fit.crocodile.model.entity.Contact;

public interface IContactDaoAdmin {
    Contact getContact();
    int updateContact(String title, String location, String phone, String iframe);
}
