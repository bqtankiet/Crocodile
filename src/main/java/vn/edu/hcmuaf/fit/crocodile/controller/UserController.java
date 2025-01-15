package vn.edu.hcmuaf.fit.crocodile.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDaoImpl;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Address;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Order;
import vn.edu.hcmuaf.fit.crocodile.service.OrderService;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "UserController", urlPatterns = {"/user"})
public class UserController extends HttpServlet {
    private final OrderService orderService = new OrderService();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Kiểm tra session và userId
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        Integer userId = (Integer) session.getAttribute("userId");

        try {
            UserDaoImpl userDao = new UserDaoImpl();
            List<Address> addressList = userDao.getAddressesByUserId(userId);
            List<Order> ordersList = userDao.getOrdersByUserId(userId);

            request.setAttribute("addressList", addressList);
            request.setAttribute("ordersList", ordersList);

            if (addressList == null || addressList.isEmpty()) {
                request.setAttribute("message", "Bạn chưa có địa chỉ nào.");
            }
            if (ordersList == null || ordersList.isEmpty()) {
                request.setAttribute("ordersMessage", "Bạn chưa có đơn hàng nào.");
            }

            request.getRequestDispatcher("/views/user.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace(new PrintWriter(System.out, true));
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Đã xảy ra lỗi khi lấy dữ liệu người dùng.");
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
