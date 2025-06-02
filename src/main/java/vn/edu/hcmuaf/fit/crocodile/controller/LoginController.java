    package vn.edu.hcmuaf.fit.crocodile.controller;

    import jakarta.servlet.*;
    import jakarta.servlet.http.*;
    import jakarta.servlet.annotation.*;
    import vn.edu.hcmuaf.fit.crocodile.dao.rolepermission.RolePermissionService;
    import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDao;
    import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDaoImpl;
    import vn.edu.hcmuaf.fit.crocodile.model.entity.User;
    import vn.edu.hcmuaf.fit.crocodile.service.AuthenticationService;

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

                    // Xử lý hiển thị giới tính
                    String genderDisplay = switch (user.getGender()) {
                        case "NAM" -> "Nam";
                        case "NỮ" -> "Nữ";
                        case "KHÁC" -> "Khác";
                        default -> "";
                    };
                    session.setAttribute("gender", genderDisplay);

                    // Xử lý chuyển hướng
                    String forwardUrl = request.getParameter("forwardUrl");
                    if (forwardUrl != null && !forwardUrl.isBlank()) {
                        response.sendRedirect(forwardUrl);
                        return;
                    }

                    // Kiểm tra role
                    if ("1".equals(user.getRole())) {
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
                request.getRequestDispatcher("/views/login.jsp").forward(request, response);
            }
        }
    }