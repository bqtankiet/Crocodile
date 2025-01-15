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


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy thông tin từ form
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phone-number");
        String gender = request.getParameter("gender");
        String birthDateString = request.getParameter("birth-date");

        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");


        if (userId == null) {
            // Nếu userId không tồn tại trong session, yêu cầu đăng nhập lại
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            // Chuyển đổi ngày sinh từ chuỗi sang LocalDate
            LocalDate birthDate = birthDateString != null && !birthDateString.isEmpty()
                    ? LocalDate.parse(birthDateString)
                    : null;

            // Tạo đối tượng User với thông tin cập nhật
            User user = new User();
            user.setId(userId);
            user.setFullname(fullname);
            user.setEmail(email);
            user.setPhoneNumber(phoneNumber);
            user.setGender(gender);
            user.setBirthdate(birthDate);
            // Cập nhật session chỉ khi giá trị không null
            if (fullname != null) session.setAttribute("fullName", fullname);
            if (email != null) session.setAttribute("email", email);
            if (phoneNumber != null) session.setAttribute("phone", phoneNumber);
            if (gender != null) session.setAttribute("gender", gender);
            if (birthDate != null) session.setAttribute("birthDate", birthDate);


            // Gọi service để cập nhật thông tin người dùng
            AuthenticationService authService = new AuthenticationService();
            boolean isUpdated = authService.updateProfile(user);

            if (isUpdated) {

                // Cập nhật lại thông tin trong session
                session.setAttribute("fullName", fullname != null ? fullname : "");
                session.setAttribute("email", email != null ? email : "");
                session.setAttribute("phone", phoneNumber != null ? phoneNumber : "");
                session.setAttribute("gender", gender != null ? gender : "");
                session.setAttribute("birthDate", birthDate);

                // Chuyển hướng về trang thông tin cá nhân
                response.sendRedirect(request.getContextPath() + "/user");
            } else {
                // Nếu không cập nhật được, thông báo lỗi
                request.setAttribute("errorMessage", "Cập nhật thông tin thất bại. Vui lòng thử lại.");
                request.getRequestDispatcher("/views/user.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Có lỗi xảy ra khi cập nhật thông tin.");
            request.getRequestDispatcher("/views/user.jsp").forward(request, response);
        }
    }

}