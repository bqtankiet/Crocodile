package vn.edu.hcmuaf.fit.crocodile.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDaoImpl;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Address;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserController", urlPatterns = {"/user"})
public class UserController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

//        request.getRequestDispatcher("/views/user.jsp").forward(request, response);

        Integer userId = (Integer) session.getAttribute("userId");
        System.out.println(userId);
        if (userId == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            UserDaoImpl userDao = new UserDaoImpl();
            List<Address> addressList = userDao.getAddressesByUserId(userId);
            System.out.println(addressList);

            // Nếu không có địa chỉ, bạn có thể thông báo cho người dùng
            if (addressList == null || addressList.isEmpty()) {
                request.setAttribute("message", "Bạn chưa có địa chỉ nào.");
            }

            // Đặt danh sách địa chỉ vào request attribute
//            session.setAttribute("addressList", addressList);
            request.setAttribute("addressList", addressList);

            // Chuyển tiếp đến JSP hiển thị
            request.getRequestDispatcher("/views/user.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi lấy danh sách địa chỉ.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        String fullName = request.getParameter("fullname");
        String birthDate = request.getParameter("birth-date");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone-number");

        if (fullName != null && !fullName.isEmpty()) session.setAttribute("fullName", fullName);
        if (birthDate != null && !birthDate.isEmpty()) session.setAttribute("birthDate", birthDate);
        if (gender != null && !gender.isEmpty()) session.setAttribute("gender", gender);
        if (email != null && !email.isEmpty()) session.setAttribute("email", email);
        if (phone != null && !phone.isEmpty()) session.setAttribute("phone", phone);

        String genderDisplay = "";
        if (gender.equals("NAM")) {
            genderDisplay = "Nam";
        } else if (gender.equals("NỮ")) {
            genderDisplay = "Nữ";
        } else if (gender.equals("KHÁC")) {
            genderDisplay = "Khác";
        }
        session.setAttribute("gender", genderDisplay);


        response.sendRedirect(request.getContextPath() + "/user");
    }
}
