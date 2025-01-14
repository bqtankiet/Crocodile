package vn.edu.hcmuaf.fit.crocodile.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDao;
import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDaoImpl;
import vn.edu.hcmuaf.fit.crocodile.model.entity.User;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet(name = "UpdateProfileController", urlPatterns = {"/update-profile"})
public class UpdateProfileController extends HttpServlet {

    private UserDao userDao;

    @Override
    public void init() {
        userDao = new UserDaoImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String fullName = request.getParameter("fullname");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String phone = request.getParameter("phone-number");
        String birthDate = request.getParameter("birth-date");

        User user = (User) request.getSession().getAttribute("user");

        if (user == null) {
            response.sendRedirect("/views/login.jsp");
            return;
        }

        user.setUsername(username);
        user.setFullname(fullName);
        user.setEmail(email);
        user.setGender(gender);
        user.setPhoneNumber(phone);
        user.setBirthdate(LocalDate.parse(birthDate));

        userDao.update(user);

        request.getSession().setAttribute("user", user);

        response.sendRedirect("views/user.jsp");
    }
}