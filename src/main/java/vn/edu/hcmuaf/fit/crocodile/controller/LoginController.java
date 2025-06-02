package vn.edu.hcmuaf.fit.crocodile.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.crocodile.dao.rolepermission.RolePermissionService;
import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDao;
import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDaoImpl;
import vn.edu.hcmuaf.fit.crocodile.model.entity.User;
import vn.edu.hcmuaf.fit.crocodile.service.AuthenticationService;
import vn.edu.hcmuaf.fit.crocodile.util.log.LogAuthentication;
import vn.edu.hcmuaf.fit.crocodile.util.log.LogUtil;

import java.io.IOException;
import java.util.Optional;

@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {
    private final AuthenticationService auth = new AuthenticationService();
    private final RolePermissionService permissionService = new RolePermissionService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String forwardUrl = request.getParameter("forwardUrl");
        request.setAttribute("forwardUrl", forwardUrl);
        request.getRequestDispatcher("/views/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        int userId = auth.login(username, password);

        if (userId != -1) {
            if (userId == -2) {
                request.setAttribute("errorMessage", "Tài khoản của bạn đã bị vô hiệu hóa.");
                request.getRequestDispatcher("/views/login.jsp").forward(request, response);
                return;
            }

            UserDao userDao = new UserDaoImpl();
            Optional<User> optionalUser = userDao.findById(userId);

            if (optionalUser.isPresent()) {
                User user = optionalUser.get();
                HttpSession session = request.getSession();
                session.setAttribute("userId", userId);
                session.setAttribute("userName", user.getUsername());
                session.setAttribute("fullName", user.getFullname() != null ? user.getFullname() : "");
                session.setAttribute("email", user.getEmail());
                session.setAttribute("gender", user.getGender() != null ? user.getGender() : "");
                session.setAttribute("phone", user.getPhoneNumber() != null ? user.getPhoneNumber() : "");
                session.setAttribute("birthDate", user.getBirthdate());
                session.setAttribute("role", user.getRole());
                session.setAttribute("permissions", permissionService.getAllPermissionNamesByUserId(userId));
//                System.out.println(("role "+user.getRole()));
                user.setPassword(null);
                session.setAttribute("user", user);

                String gender = user.getGender();
                String genderDisplay = "";

                // log
                LogAuthentication logAuthentication = new LogAuthentication();
                logAuthentication.logSuccess(String.valueOf(user.getId()), user.getUsername(), LogUtil.getClientIp(request), new RolePermissionService().getRoleName(user.getRole()));

                if ("NAM".equals(gender)) {
                    genderDisplay = "Nam";
                } else if ("NỮ".equals(gender)) {
                    genderDisplay = "Nữ";
                } else if ("KHÁC".equals(gender)) {
                    genderDisplay = "Khác";
                }

                session.setAttribute("gender", genderDisplay);
                String forwardUrl = request.getParameter("forwardUrl");
                if(forwardUrl != null && !forwardUrl.isBlank()) {
                    request.getRequestDispatcher(forwardUrl).forward(request, response);
                    return;
                }
                Optional<String> roleOpt = auth.checkRole(userId);
                if (roleOpt.isPresent() && "1".equals(roleOpt.get())) {
                    System.out.println(auth.checkRole(userId));
                    response.sendRedirect(request.getContextPath() + "/admin");
                } else {
                    response.sendRedirect(request.getContextPath() + "/");
                }
            } else {
                request.setAttribute("errorMessage", "Không tìm thấy thông tin người dùng.");
                request.getRequestDispatcher("/views/login.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("errorMessage", "Sai Tài Khoản Hoặc Mật Khẩu.");
            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
            LogAuthentication logAuthentication = new LogAuthentication();
            logAuthentication.logFailure(username, LogUtil.getClientIp(request));
        }
    }

}