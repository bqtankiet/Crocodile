package vn.edu.hcmuaf.fit.crocodile.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDao;
import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDaoImpl;
import vn.edu.hcmuaf.fit.crocodile.model.entity.User;
import vn.edu.hcmuaf.fit.crocodile.service.AuthenticationService;

import java.io.IOException;
import java.time.LocalDate;
import java.util.Optional;

@WebServlet(name = "UpdateProfileController", urlPatterns = {"/update-profile"})
public class UpdateProfileController extends HttpServlet {
    AuthenticationService authenticationService = new AuthenticationService();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("user");

        if (currentUser == null) {
            response.sendRedirect("/login");
            return;
        }

        AuthenticationService authService = new AuthenticationService();
        Optional<User> userOptional = authService.getUserById(currentUser.getId());

        if (userOptional.isPresent()) {
            currentUser = userOptional.get();
            session.setAttribute("user", currentUser);
        }

        request.getRequestDispatcher("/views/user.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("user");

        if (currentUser == null) {
            response.sendRedirect("/login");
            return;
        }

        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String phoneNumber = request.getParameter("phone-number");
        String birthdateParam = request.getParameter("birth-date");

        LocalDate birthdate = null;
        if (birthdateParam != null && !birthdateParam.isEmpty()) {
            birthdate = LocalDate.parse(birthdateParam);
        }

        currentUser.setFullname(fullname);
        currentUser.setEmail(email);
        currentUser.setGender(gender);
        currentUser.setPhoneNumber(phoneNumber);
        currentUser.setBirthdate(birthdate);

        boolean isUpdated = authenticationService.updateProfile(currentUser);

        if (isUpdated) {
            session.setAttribute("user", currentUser);
            request.setAttribute("message", "Cập nhật thông tin thành công!");
        } else {
            request.setAttribute("error", "Cập nhật thông tin thất bại. Vui lòng thử lại.");
        }

        request.getRequestDispatcher("/views/user.jsp").forward(request, response);
    }

}