package vn.edu.hcmuaf.fit.crocodile.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.crocodile.dao.rolepermission.RolePermissionDAO;
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

//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String username = request.getParameter("username");
//        String password = request.getParameter("password");
//
//        int userId = auth.login(username, password);
//
//        if (userId != -1) {
//            if (userId == -2) {
//                request.setAttribute("errorMessage", "Tài khoản của bạn đã bị vô hiệu hóa.");
//                request.getRequestDispatcher("/views/login.jsp").forward(request, response);
//                return;
//            }
//
//            UserDao userDao = new UserDaoImpl();
//            Optional<User> optionalUser = userDao.findById(userId);
//
//            if (optionalUser.isPresent()) {
//                User user = optionalUser.get();
//                HttpSession session = request.getSession();
//                session.setAttribute("userId", userId);
//                session.setAttribute("userName", user.getUsername());
//                session.setAttribute("fullName", user.getFullname() != null ? user.getFullname() : "");
//                session.setAttribute("email", user.getEmail());
//                session.setAttribute("gender", user.getGender() != null ? user.getGender() : "");
//                session.setAttribute("phone", user.getPhoneNumber() != null ? user.getPhoneNumber() : "");
//                session.setAttribute("birthDate", user.getBirthdate());
//                session.setAttribute("role", user.getRole());
//                session.setAttribute("permissions", permissionService.getAllPermissionNamesByUserId(userId));
////                System.out.println(("role "+user.getRole()));
//                user.setPassword(null);
//                session.setAttribute("user", user);
//
//                String gender = user.getGender();
//                String genderDisplay = "";
//
//                // log
//                LogAuthentication logAuthentication = new LogAuthentication();
//                logAuthentication.logSuccess(String.valueOf(user.getId()), user.getUsername(), LogUtil.getClientIp(request), new RolePermissionService().getRoleName(user.getRole()));
//
//                if ("NAM".equals(gender)) {
//                    genderDisplay = "Nam";
//                } else if ("NỮ".equals(gender)) {
//                    genderDisplay = "Nữ";
//                } else if ("KHÁC".equals(gender)) {
//                    genderDisplay = "Khác";
//                }
//
//                session.setAttribute("gender", genderDisplay);
//                String forwardUrl = request.getParameter("forwardUrl");
//                if(forwardUrl != null && !forwardUrl.isBlank()) {
//                    request.getRequestDispatcher(forwardUrl).forward(request, response);
//                    return;
//                }
//                Optional<String> roleOpt = auth.checkRole(userId);
//                if (roleOpt.isPresent() && "1".equals(roleOpt.get())) {
//                    System.out.println(auth.checkRole(userId));
//                    response.sendRedirect(request.getContextPath() + "/admin");
//                } else {
//                    response.sendRedirect(request.getContextPath() + "/");
//                }
//            } else {
//                request.setAttribute("errorMessage", "Không tìm thấy thông tin người dùng.");
//                request.getRequestDispatcher("/views/login.jsp").forward(request, response);
//            }
//        } else {
//            request.setAttribute("errorMessage", "Sai Tài Khoản Hoặc Mật Khẩu.");
//
//            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
//            LogAuthentication logAuthentication = new LogAuthentication();
//            logAuthentication.logFailure(username, LogUtil.getClientIp(request));
//        }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String loginInput = request.getParameter("username"); // Giữ nguyên tên parameter nếu không đổi form
        String password = request.getParameter("password");

        int userId = auth.login(loginInput, password);

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

                // Cập nhật session attributes
                session.setAttribute("userId", userId);
                session.setAttribute("loginId", loginInput);
                session.setAttribute("fullName", user.getFullname() != null ? user.getFullname() : "");
                session.setAttribute("email", user.getEmail());
                session.setAttribute("gender", user.getGender() != null ? user.getGender() : "");
                session.setAttribute("phone", user.getPhoneNumber() != null ? user.getPhoneNumber() : "");
                session.setAttribute("birthDate", user.getBirthdate());
                session.setAttribute("role", user.getRole());
                session.setAttribute("permissions", permissionService.getAllPermissionNamesByUserId(userId));

                user.setPassword(null);
                session.setAttribute("user", user);

                // role name
                RolePermissionDAO rolePermissionDAO = new RolePermissionDAO();
                String roleName = rolePermissionDAO.getRoleName(user.getRole());
                session.setAttribute("roleName", roleName);

                // Xử lý hiển thị giới tính
                String genderDisplay = switch (user.getGender()) {
                    case "NAM" -> "Nam";
                    case "NỮ" -> "Nữ";
                    case "KHÁC" -> "Khác";
                    default -> "";
                };
                session.setAttribute("gender", genderDisplay);
                // log
                LogAuthentication logAuthentication = new LogAuthentication();
                logAuthentication.logSuccess(String.valueOf(user.getId()), user.getEmail(), LogUtil.getClientIp(request), new RolePermissionService().getRoleName(user.getRole()));


                // Xử lý chuyển hướng
                String forwardUrl = request.getParameter("forwardUrl");
                if (forwardUrl != null && !forwardUrl.isBlank()) {
                    response.sendRedirect(forwardUrl);
                    return;
                }

                // Kiểm tra role
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
            request.setAttribute("loginError", true);
            request.setAttribute("errorMessage", "Sai thông tin đăng nhập hoặc mật khẩu.");
            LogAuthentication logAuthentication = new LogAuthentication();
            logAuthentication.logFailure(loginInput, LogUtil.getClientIp(request));
            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
        }
    }
}