package vn.edu.hcmuaf.fit.crocodile.service;

import vn.edu.hcmuaf.fit.crocodile.dao.contact.ContactDaoAdmin;
import vn.edu.hcmuaf.fit.crocodile.dao.contact.IContactDaoAdmin;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Contact;

public class ContactService {
    IContactDaoAdmin contactDaoAdmin;

    public ContactService() {
        contactDaoAdmin = new ContactDaoAdmin();
    }

    public Contact getContact() {
        return contactDaoAdmin.getContact();
    }

    public int updateContact(String title, String location, String phone, String iframe) {
        return contactDaoAdmin.updateContact(title, location, phone, iframe);
    }
}
