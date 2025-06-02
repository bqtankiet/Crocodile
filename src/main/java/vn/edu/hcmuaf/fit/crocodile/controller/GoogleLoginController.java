package vn.edu.hcmuaf.fit.crocodile.controller;

import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseAuthException;
import com.google.firebase.auth.FirebaseToken;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.crocodile.dao.rolepermission.RolePermissionService;
import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDao;
import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDaoImpl;
import vn.edu.hcmuaf.fit.crocodile.model.entity.User;

import java.io.IOException;
import java.time.LocalDate;
import java.util.Optional;

@WebServlet(name = "GoogleLoginController", urlPatterns = {"/google-login"})
public class GoogleLoginController extends HttpServlet {

    private final UserDao userDao = new UserDaoImpl();
    private final RolePermissionService permissionService = new RolePermissionService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idToken = request.getParameter("idToken");
        String forwardUrl = request.getParameter("forwardUrl");

        System.out.println("Received Google login request");
        System.out.println("Forward URL: " + forwardUrl);

        if (idToken == null || idToken.trim().isEmpty()) {
            System.err.println("ID token is null or empty");
            response.sendRedirect(request.getContextPath() + "/login?error=missing_token");
            return;
        }

        try {
            // Verify the ID token
            FirebaseToken decodedToken = FirebaseAuth.getInstance().verifyIdToken(idToken);

            String email = decodedToken.getEmail();
            String name = decodedToken.getName();
            String uid = decodedToken.getUid();

            System.out.println("Token verified successfully");
            System.out.println("Email: " + email);
            System.out.println("Name: " + name);
            System.out.println("UID: " + uid);

            if (email == null || uid == null) {
                System.err.println("Email or UID is null");
                response.sendRedirect(request.getContextPath() + "/login?error=invalid_token");
                return;
            }

            // Tìm hoặc tạo user - CẢI THIỆN LOGIC
            User user = findOrCreateUser(email, name, uid);

            if (user == null) {
                System.err.println("Failed to find or create user");
                response.sendRedirect(request.getContextPath() + "/login?error=user_creation_failed");
                return;
            }

            // Kiểm tra tài khoản có bị vô hiệu hóa không
            if (!userDao.checkActive(user.getId())) {
                System.err.println("User account is inactive: " + user.getId());
                request.setAttribute("errorMessage", "Tài khoản của bạn đã bị vô hiệu hóa.");
                request.getRequestDispatcher("/views/login.jsp").forward(request, response);
                return;
            }

            // Tạo session
            createUserSession(request, user);
            System.out.println("User session created successfully");

            // Chuyển hướng
            handleRedirect(request, response, forwardUrl, user);

        } catch (FirebaseAuthException e) {
            System.err.println("Firebase Auth Error: " + e.getErrorCode() + " - " + e.getMessage());
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/login?error=firebase_auth&code=" + e.getErrorCode());
        } catch (Exception e) {
            System.err.println("Unexpected error during Google login: " + e.getMessage());
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/login?error=unexpected");
        }
    }

    /**
     * CẢI THIỆN: Logic tìm hoặc tạo user với xử lý tốt hơn
     */
    private User findOrCreateUser(String email, String name, String googleId) {
        try {
            System.out.println("=== FINDING OR CREATING USER ===");
            System.out.println("Email: " + email);
            System.out.println("Name: " + name);
            System.out.println("Google ID: " + googleId);

            // BƯỚC 1: Tìm user bằng Google ID trước (ưu tiên cao nhất)
            Optional<User> userByGoogleId = userDao.findByGoogleId(googleId);
            if (userByGoogleId.isPresent()) {
                User existingUser = userByGoogleId.get();
                System.out.println("✓ Found existing user by Google ID: " + existingUser.getId());

                // Cập nhật thông tin nếu có thay đổi
                boolean needUpdate = false;

                if (!email.equals(existingUser.getEmail())) {
                    System.out.println("→ Updating email from " + existingUser.getEmail() + " to " + email);
                    existingUser.setEmail(email);
                    needUpdate = true;
                }

                if (name != null && !name.equals(existingUser.getFullname())) {
                    System.out.println("→ Updating name from " + existingUser.getFullname() + " to " + name);
                    existingUser.setFullname(name);
                    needUpdate = true;
                }

                if (needUpdate) {
                    userDao.update(existingUser);
                    System.out.println("✓ User information updated");
                }

                return existingUser;
            }

            // BƯỚC 2: Tìm user bằng email
            Optional<User> userByEmail = userDao.findByEmail(email);
            if (userByEmail.isPresent()) {
                User existingUser = userByEmail.get();
                System.out.println("✓ Found existing user by email: " + existingUser.getId());

                // Kiểm tra xem user này đã có Google ID chưa
                if (existingUser.getGoogleId() != null && !existingUser.getGoogleId().isEmpty()) {
                    System.out.println("⚠ User already has different Google ID: " + existingUser.getGoogleId());
                    // Có thể xử lý trường hợp này theo business logic
                    // Ở đây chúng ta cập nhật Google ID mới
                    System.out.println("→ Updating Google ID to: " + googleId);
                }

                // Cập nhật Google ID và thông tin khác nếu cần
                userDao.updateGoogleInfo(existingUser.getId(), googleId);
                existingUser.setGoogleId(googleId);

                // Cập nhật tên nếu chưa có hoặc khác
                boolean needUpdate = false;
                if (name != null && (existingUser.getFullname() == null ||
                        existingUser.getFullname().trim().isEmpty() ||
                        !existingUser.getFullname().equals(name))) {
                    existingUser.setFullname(name);
                    needUpdate = true;
                }

                if (needUpdate) {
                    userDao.update(existingUser);
                    System.out.println("✓ User information updated");
                }

                System.out.println("✓ Google ID linked to existing account");
                return existingUser;
            }

            // BƯỚC 3: Tạo user mới hoàn toàn
            System.out.println("→ Creating new user account...");
            User newUser = createNewGoogleUser(email, name, googleId);

            // Tạo user trong database
            int userId = userDao.create(newUser);
            if (userId <= 0) {
                System.err.println("✗ Failed to create user in database");
                return null;
            }

            newUser.setId(userId);
            System.out.println("✓ Successfully created new user with ID: " + userId);
            System.out.println("✓ User details:");
            System.out.println("  - Email: " + newUser.getEmail());
            System.out.println("  - Name: " + newUser.getFullname());
            System.out.println("  - Google ID: " + newUser.getGoogleId());
            System.out.println("  - Role: " + newUser.getRole());
            System.out.println("  - Active: " + newUser.getActive());

            return newUser;

        } catch (Exception e) {
            System.err.println("✗ Error in findOrCreateUser: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }

    /**
     * CẢI THIỆN: Tạo user mới với thông tin đầy đủ hơn
     */
    private User createNewGoogleUser(String email, String name, String googleId) {
        User user = new User();

        // Thông tin cơ bản
        user.setEmail(email);
        user.setFullname(name != null && !name.trim().isEmpty() ? name : "Người dùng Google");
        user.setGoogleId(googleId);

        // Thông tin mặc định cho Google user
        user.setPassword(""); // Google users không cần password
        user.setActive(1); // Google users được active ngay lập tức
        user.setRole(16); // Role mặc định là customer (0)

        // Thông tin cá nhân mặc định
        user.setBirthdate(LocalDate.now()); // Có thể để null hoặc một ngày mặc định
        user.setGender(""); // Để trống để user tự cập nhật sau
        user.setPhoneNumber(""); // Để trống để user tự cập nhật sau

        System.out.println("→ Created new Google user object:");
        System.out.println("  - Email: " + user.getEmail());
        System.out.println("  - Name: " + user.getFullname());
        System.out.println("  - Google ID: " + user.getGoogleId());

        return user;
    }

    private void createUserSession(HttpServletRequest request, User user) {
        HttpSession session = request.getSession();

        // Clear any existing session data
        session.invalidate();
        session = request.getSession(true);

        // Set user information in session
        session.setAttribute("userId", user.getId());
        session.setAttribute("loginId", user.getEmail());
        session.setAttribute("fullName", user.getFullname() != null ? user.getFullname() : "");
        session.setAttribute("email", user.getEmail());
        session.setAttribute("gender", user.getGender() != null ? user.getGender() : "");
        session.setAttribute("phone", user.getPhoneNumber() != null ? user.getPhoneNumber() : "");
        session.setAttribute("birthDate", user.getBirthdate());
        session.setAttribute("role", user.getRole());
        session.setAttribute("permissions", permissionService.getAllPermissionNamesByUserId(user.getId()));

        // Clone user object để tránh expose password
        User sessionUser = new User();
        sessionUser.setId(user.getId());
        sessionUser.setEmail(user.getEmail());
        sessionUser.setFullname(user.getFullname());
        sessionUser.setGender(user.getGender());
        sessionUser.setPhoneNumber(user.getPhoneNumber());
        sessionUser.setBirthdate(user.getBirthdate());
        sessionUser.setActive(user.getActive());
        sessionUser.setRole(user.getRole());
        sessionUser.setGoogleId(user.getGoogleId());
        // Không set password

        session.setAttribute("user", sessionUser);

        // Xử lý hiển thị giới tính
        String genderDisplay = switch (user.getGender() != null ? user.getGender() : "") {
            case "NAM" -> "Nam";
            case "NỮ" -> "Nữ";
            case "KHÁC" -> "Khác";
            default -> "";
        };
        session.setAttribute("genderDisplay", genderDisplay);

        System.out.println("✓ Session created for user: " + user.getEmail());
        System.out.println("  - User ID: " + user.getId());
        System.out.println("  - Full name: " + session.getAttribute("fullName"));
        System.out.println("  - Role: " + user.getRole());
    }

    private void handleRedirect(HttpServletRequest request, HttpServletResponse response,
                                String forwardUrl, User user) throws IOException {

        String redirectUrl;

        // Xác định URL chuyển hướng
        if (forwardUrl != null && !forwardUrl.trim().isEmpty() &&
                !forwardUrl.contains("/login") && !forwardUrl.contains("/register")) {
            redirectUrl = forwardUrl;
            System.out.println("→ Redirecting to provided forward URL: " + redirectUrl);
        } else {
            // Kiểm tra role để chuyển hướng phù hợp
            if (user.getRole() == 1) {
                redirectUrl = request.getContextPath() + "/admin";
                System.out.println("→ Redirecting admin user to admin panel");
            } else {
                redirectUrl = request.getContextPath() + "/";
                System.out.println("→ Redirecting regular user to home page");
            }
        }

        // Thêm success parameter để frontend có thể hiển thị thông báo
        String separator = redirectUrl.contains("?") ? "&" : "?";
        redirectUrl += separator + "login=success&method=google";

        System.out.println("✓ Final redirect URL: " + redirectUrl);
        response.sendRedirect(redirectUrl);
    }
}