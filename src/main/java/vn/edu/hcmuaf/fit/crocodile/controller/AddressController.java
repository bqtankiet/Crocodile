package vn.edu.hcmuaf.fit.crocodile.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDaoImpl;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Address;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AddressController", urlPatterns = {"/address"})
public class AddressController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
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
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            // Nếu user chưa đăng nhập, chuyển hướng tới trang đăng nhập
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // Lấy dữ liệu từ form
        String fullname = request.getParameter("name");
        String phoneNumber = request.getParameter("phone");
        String province = request.getParameter("cityName");
        String district = request.getParameter("districtName");
        String ward = request.getParameter("wardName");
        String street = request.getParameter("soNha");

        try {
            // Tạo đối tượng Address
            Address address = new Address();
            address.setUserId(userId);
            address.setFullname(fullname);
            address.setPhoneNumber(phoneNumber);
            address.setProvince(province);
            address.setDistrict(district);
            address.setWard(ward);
            address.setStreet(street);

            // Gọi DAO để thêm địa chỉ vào DB
            UserDaoImpl userDao = new UserDaoImpl();
            userDao.addAddress(address);

            // Sau khi thêm thành công, chuyển về trang địa chỉ để hiển thị danh sách địa chỉ
            response.sendRedirect(request.getContextPath() + "/user");  // Thay vì forward
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Có lỗi xảy ra khi thêm địa chỉ.");
            request.getRequestDispatcher("/views/user.jsp").forward(request, response);
        }
    }


}