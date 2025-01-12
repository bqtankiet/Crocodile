package vn.edu.hcmuaf.fit.crocodile.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.crocodile.model.entity.User;
import vn.edu.hcmuaf.fit.crocodile.service.AuthenticationService;
import vn.edu.hcmuaf.fit.crocodile.util.Gender;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet(name = "SignupController", urlPatterns = {"/signup"})
public class SignupController extends HttpServlet {
    AuthenticationService auth = new AuthenticationService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/signup.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");

        String day = String.format("%02d", Integer.parseInt(request.getParameter("day")));
        String month = String.format("%02d", Integer.parseInt(request.getParameter("month")));
        String year = request.getParameter("year");

        String birthdate = year + "-" + month + "-" + day;

        String gender = request.getParameter("gender");
        String username = request.getParameter("username");
        String emailOrPhone = request.getParameter("email").trim();
        String password = request.getParameter("password");

        User user = new User();
        user.setFullname(firstName + " " + lastName);
        user.setBirthdate(LocalDate.parse(birthdate));
        user.setUsername(username);
        user.setPassword(password);

        if (gender != null) {
            user.setGender(gender);
        }

        if (emailOrPhone.matches("^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$")) {
            user.setEmail(emailOrPhone);
            user.setPhone_number(null);
        } else if (emailOrPhone.matches("^[0-9]{10,15}$")) {
            user.setPhone_number(emailOrPhone);
            user.setEmail(null);
        }

        int result = auth.signup(user);

        if (result > 0) {
            response.sendRedirect(request.getContextPath() + "/login");
        } else {
            request.setAttribute("errorMessage", "Đăng ký thất bại. Vui lòng thử lại.");
            request.getRequestDispatcher("/views/signup.jsp").forward(request, response);
        }
    }


}
