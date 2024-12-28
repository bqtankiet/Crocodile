package vn.edu.hcmuaf.fit.crocodile_admin.controller;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Contact;
import vn.edu.hcmuaf.fit.crocodile.service.ContactService;

import java.io.IOException;

@WebServlet(name = "ContactManagementController", value = "/admin/contact")
public class ContactController extends HttpServlet {
    ContactService contactService = new ContactService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("contact", contactService.getContact());
        request.getRequestDispatcher("/admin/views/contact.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
