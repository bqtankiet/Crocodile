package vn.edu.hcmuaf.fit.crocodile.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDao;
import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDaoImpl;
import vn.edu.hcmuaf.fit.crocodile.model.entity.User;
import vn.edu.hcmuaf.fit.crocodile.service.AuthenticationService;

import java.io.IOException;
import java.util.Optional;

@WebServlet(name = "ForgetPasswordController", urlPatterns = {"/forgetPasswordController"})
public class ForgetPasswordController extends HttpServlet {
    private UserDao userDao;
    private final AuthenticationService auth = new AuthenticationService();


    @Override
    public void init() throws ServletException {
        userDao = new UserDaoImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/forgetPassword.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        Optional<User> userOptional = auth.findEmail(email);

        if (userOptional.isPresent()) {
            request.setAttribute("success", true);
        } else {
            request.setAttribute("error", true);

        }

        request.getRequestDispatcher("/views/forgetPassword.jsp").forward(request, response);
    }


}
