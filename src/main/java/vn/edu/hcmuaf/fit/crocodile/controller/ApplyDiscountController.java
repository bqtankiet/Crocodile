package vn.edu.hcmuaf.fit.crocodile.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.crocodile.dao.discount.DiscountCodeDAO;
import vn.edu.hcmuaf.fit.crocodile.model.entity.DiscountCode;
import vn.edu.hcmuaf.fit.crocodile.model.order.Order;

import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet("/checkout/apply-discount")
public class ApplyDiscountController extends HttpServlet {
    private final DiscountCodeDAO discountCodeDAO = new DiscountCodeDAO();
    private String discountCode;
    private HttpSession session;
    private Order order;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (!validateRequest(req)) {
            resp.setStatus(HttpServletResponse.SC_NOT_ACCEPTABLE);
            resp.setContentType("application/json");
            resp.getWriter().write("{\"status\": \"error\", \"message\": \"Mã giảm giá không tồn tại.\"}");
            return;
        }

        handleApplyDiscount(req, resp);
    }

    private boolean validateRequest(HttpServletRequest req) {
        this.discountCode = req.getParameter("discountCode");
        this.session = req.getSession();
        this.order = (Order) session.getAttribute("order");
        return session != null && order != null && discountCode != null && !discountCode.isEmpty();
    }

    private void handleApplyDiscount(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();
        int userId = (int) session.getAttribute("userId");
        DiscountCode discountCodeObj = discountCodeDAO.findByCode(discountCode);

        if (discountCodeObj == null) {
            responseDiscountNotFound(resp);
            return;
        }

        if (!discountCodeObj.isApplicable(order)) {
            responseNotApplicableOrder(resp);
            return;
        }

        if (!isValidDiscount(discountCodeObj, userId)) {
            responseDiscountNotFound(resp);
            return;
        }

        // Apply discount
        order.setDiscountCode(discountCodeObj);
        session.setAttribute("order", order);
        responseSuccess(resp);
    }

    private static void responseDiscountNotFound(HttpServletResponse resp) throws IOException {
        resp.setStatus(HttpServletResponse.SC_NOT_FOUND);
        resp.setContentType("application/json");
        resp.getWriter().write("{\"status\": \"error\", \"message\": \"Mã giảm giá không tồn tại hoặc đã được sử dụng.\"}");
    }

    private static void responseNotApplicableOrder(HttpServletResponse resp) throws IOException {
        resp.setStatus(HttpServletResponse.SC_NOT_ACCEPTABLE);
        resp.setContentType("application/json");
        resp.getWriter().write("{\"status\": \"error\", \"message\": \"Đơn hàng không đủ điều kiện áp dụng mã giảm giá.\"}");
    }

    private void responseSuccess(HttpServletResponse resp) throws IOException {
        resp.setStatus(HttpServletResponse.SC_OK);
        resp.setContentType("application/json");
        resp.getWriter().write("{\"status\": \"success\", \"message\": \"Áp dụng mã giảm giá thành công.\"}");
    }

    private boolean isValidDiscount(DiscountCode discountCode, int userId) {
        // Đã dùng chưa?
        if (discountCodeDAO.checkUserUsage(discountCode.getId(), userId)) return false;

        // Còn số lượng không?
        if (discountCode.getMaxUses() <= 0) return false;

        // Hết hạn chưa?
        LocalDateTime now = LocalDateTime.now();
        return discountCode.getEndDate() == null || !discountCode.getEndDate().isBefore(now);
    }
}
