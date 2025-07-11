package vn.edu.hcmuaf.fit.crocodile_admin.controller.discount;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.crocodile.dao.discount.DiscountCodeDAO;
import vn.edu.hcmuaf.fit.crocodile.model.entity.DiscountCode;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

@WebServlet(urlPatterns = "/admin/discount-codes")
public class DiscountCodeManagementController extends HttpServlet {
    // configs
    // - jsp file
    public static String JSP_PAGE = "/admin/views/discount/discount-codes.jsp";
    public static String JSP_FORM = "/admin/views/discount/discount-edit-form.jsp";
    private DiscountCodeDAO discountCodeDAO;

    @Override
    public void init() throws ServletException {
        this.discountCodeDAO = new DiscountCodeDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action != null && action.equals("edit")) {
            String code = req.getParameter("code");
            DiscountCode discountCode = discountCodeDAO.findByCode(code);
            req.setAttribute("discountCode", discountCode);
            req.getRequestDispatcher(JSP_FORM).forward(req, resp);
        }
        else if (action != null && action.equals("add")) {
            req.getRequestDispatcher(JSP_FORM).forward(req, resp);
        }
        else {
            System.out.println("DiscountCodeManagementController: " + discountCodeDAO.findAll());
            List<DiscountCode> discountList = discountCodeDAO.findAll();
            req.setAttribute("discountList", discountList);
            req.getRequestDispatcher(JSP_PAGE).forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        System.out.println(action);
        if ("create".equals(action)) {
            try {
                String code = req.getParameter("code");
                String type = req.getParameter("type");
                BigDecimal value = new BigDecimal(req.getParameter("value"));
                BigDecimal maxDiscount = req.getParameter("maxDiscount").isEmpty() ? null : new BigDecimal(req.getParameter("maxDiscount"));
                LocalDateTime startDate = LocalDateTime.parse(req.getParameter("startDate"));
                LocalDateTime endDate = LocalDateTime.parse(req.getParameter("endDate"));
                int maxUses = Integer.parseInt(req.getParameter("maxUses"));
                BigDecimal minOrderValue = new BigDecimal(req.getParameter("minOrderValue"));

                System.out.println(code);
                System.out.println(type);
                System.out.println(value);
                System.out.println(maxUses);
                System.out.println(maxDiscount);
                System.out.println(startDate);
                System.out.println(endDate);
                System.out.println(minOrderValue);

                // Validate input
                if (discountCodeDAO.findByCode(code) != null) {
                    resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                    resp.getWriter().write("{\"success\": false, \"message\": \"" + "Mã giảm giá đã tồn tại" + "\"}");
                    return;
                }

                DiscountCode discountCode = new DiscountCode();
                discountCode.setCode(code);
                discountCode.setType(DiscountCode.DiscountType.valueOf(type));
                discountCode.setValue(value);
                discountCode.setMaxDiscount(maxDiscount);
                discountCode.setStartDate(startDate);
                discountCode.setEndDate(endDate);
                discountCode.setMaxUses(maxUses);
                discountCode.setMinOrderValue(minOrderValue);
                discountCode.setStatus(DiscountCode.DiscountStatus.ACTIVE);

                discountCodeDAO.createDiscountCode(discountCode);
                resp.setContentType("application/json");
                resp.getWriter().write("{\"success\": true}");
            } catch (Exception e) {
                resp.setContentType("application/json");
                resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                resp.getWriter().write("{\"success\": false, \"message\": \"" + "Thêm thất bại, vui lòng kiểm tra lại các thông tin" + "\"}");
            }
        }
    }
}
