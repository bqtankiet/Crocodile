package vn.edu.hcmuaf.fit.crocodile.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.eclipse.tags.shaded.org.apache.xalan.xslt.Process;
import vn.edu.hcmuaf.fit.crocodile.dao.user.IUserDao;
import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDao;
import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDaoImpl;
import vn.edu.hcmuaf.fit.crocodile.model.entity.User;
import vn.edu.hcmuaf.fit.crocodile.service.Authentication;

import java.io.IOException;

@WebServlet(name = "LoginController", value = "/login")
public class LoginController extends HttpServlet {
    private final Authentication auth = new Authentication();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Authentication auth = new Authentication();
//
//        if (username == null || username.trim().isEmpty() || password == null || password.trim().isEmpty()) {
//            request.setAttribute("errorMessage", "Tên tài khoản và mật khẩu không được để trống.");
//            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
//            return;
//        }

        int userId = auth.login(username, password);
        User user = new User();
        if (userId == user.getId()) {
//            HttpSession session = request.getSession();
//            session.setAttribute("userId", userId);
            System.out.println("Session tạo thành công. Chuyển hướng đến home.jsp");
            request.getRequestDispatcher("home.jsp").forward(request, response);
        } else {
            System.out.println("Đăng nhập thất bại");
            request.setAttribute("errorMessage", "Sai Tài Khoản Hoặc Mật Khẩu");
            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
        }

    }


}