package vn.edu.hcmuaf.fit.crocodile.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.crocodile.model.entity.User;
import vn.edu.hcmuaf.fit.crocodile.service.AuthenticationService;

import java.io.IOException;

@WebServlet(name = "VerifyOtpController", urlPatterns = {"/verifyOtp"})
public class VerifyOtpController extends HttpServlet {
    private AuthenticationService auth = new AuthenticationService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy OTP do người dùng nhập từ form
        String inputOtp = request.getParameter("otp");

        HttpSession session = request.getSession();
        String sessionOtp = (String) session.getAttribute("otp");

        // Bổ sung kiểm tra thời gian hiệu lực OTP (5 phút)
        Long otpTimestamp = (Long) session.getAttribute("otpTimestamp");
        if (otpTimestamp == null || System.currentTimeMillis() > otpTimestamp + (5 * 60 * 1000)) {
            // Nếu OTP đã hết hạn
            request.setAttribute("errorMessage", "Mã OTP đã hết hạn. Vui lòng yêu cầu gửi lại.");
            request.getRequestDispatcher("/views/verify-otp.jsp").forward(request, response);
            return;
        }

        // So sánh OTP nhập vào với OTP đã lưu trong session
        if (inputOtp != null && inputOtp.equals(sessionOtp)) {
            // Nếu OTP khớp, tiến hành hoàn tất đăng ký

            // Lấy các thông tin đăng ký đã lưu tạm trong session
            String fullName = (String) session.getAttribute("fullName");
            String gender = (String) session.getAttribute("gender");
            String password = (String) session.getAttribute("password");
            String phone = (String) session.getAttribute("userPhone");

            // Tạo đối tượng User và set thông tin đăng ký
            User user = new User();
            user.setFullname(fullName);
            user.setGender(gender);
            user.setPhoneNumber(phone);
            user.setEmail(null); // Vì đăng ký bằng số điện thoại
            user.setPassword(password);

            // Gọi service để thực hiện đăng ký
            int result = auth.signup(user);
            if (result > 0) {
                // Xóa các thuộc tính không cần thiết trong session
                session.removeAttribute("otp");
                session.removeAttribute("otpTimestamp");
                session.removeAttribute("fullName");
                session.removeAttribute("gender");
                session.removeAttribute("password");
                session.removeAttribute("userPhone");

                // Đăng ký thành công, chuyển hướng đến trang đăng nhập
                response.sendRedirect(request.getContextPath() + "/login");
            } else {
                // Nếu đăng ký thất bại, hiển thị lại trang OTP với thông báo lỗi
                request.setAttribute("errorMessage", "Đăng ký thất bại. Vui lòng thử lại.");
                request.getRequestDispatcher("/views/verify-otp.jsp").forward(request, response);
            }
        } else {
            // Nếu OTP không khớp, hiển thị thông báo lỗi và cho phép nhập lại
            request.setAttribute("errorMessage", "Mã OTP không chính xác. Vui lòng thử lại.");
            request.getRequestDispatcher("/views/verify-otp.jsp").forward(request, response);
        }

    }
}
