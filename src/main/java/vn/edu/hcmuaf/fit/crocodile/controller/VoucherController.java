package vn.edu.hcmuaf.fit.crocodile.controller;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.crocodile.api.util.Authentication;
import vn.edu.hcmuaf.fit.crocodile.dao.discount.DiscountCodeDAO;
import vn.edu.hcmuaf.fit.crocodile.dao.discount.IDiscountCodeDAO;
import vn.edu.hcmuaf.fit.crocodile.dao.userdiscount.IUserDiscountDAO;
import vn.edu.hcmuaf.fit.crocodile.dao.userdiscount.UserDiscountDAO;
import vn.edu.hcmuaf.fit.crocodile.model.entity.DiscountCode;
import vn.edu.hcmuaf.fit.crocodile.model.entity.UserDiscount;
import vn.edu.hcmuaf.fit.crocodile.service.AuthenticationService;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/voucher-detail/*")
public class VoucherController extends HttpServlet {
    private DiscountCodeDAO discountCodeDAO;

    @Override
    public void init() throws ServletException {
        discountCodeDAO = new DiscountCodeDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String paramId = req.getParameter("id");
        int id = 0;
        try {
            id = Integer.parseInt(paramId);
        } catch (NumberFormatException e) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST);
        }

        DiscountCode voucher = discountCodeDAO.findById(id);

        req.setAttribute("voucher", voucher);

        req.getRequestDispatcher("views/voucher.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();
        if (pathInfo.equals("/save")) {
            Gson gson = new Gson();
            Map<String, Object> json = gson.fromJson(req.getReader(), Map.class);
            int id = ((Number) json.get("id")).intValue();
            if (id == -1) {
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "id is invalid");
                return;
            }

            // kiểm tra đã đăng nhập chưa?
            Authentication authentication = new Authentication();
            int userId = authentication.authenticate(req);
            if(userId == -1) {
                resp.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                return;
            }

            // kiểm tra đã lưu mã chưa?
            IUserDiscountDAO userDiscountDAO = new UserDiscountDAO();
            List<UserDiscount> userDiscounts = userDiscountDAO.findAllByUserId(userId);
            for (UserDiscount ud : userDiscounts) {
                if(ud.getIdDiscount() == id) {
                    resp.setStatus(HttpServletResponse.SC_NOT_ACCEPTABLE);
                    return;
                }
            }

            // kiểm tra mã hợp lệ không?
            // kiểm tra mã còn số lượng không?
            IDiscountCodeDAO discountCodeDAO = new DiscountCodeDAO();
            DiscountCode discountCode = discountCodeDAO.findById(id);
            if(discountCode == null || discountCode.getMaxUses() <= 0) {
                resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                return;
            }

            // Nếu thỏa mãn -> lưu vào db và response success
            userDiscountDAO.saveDiscountForUser(id, userId);
            discountCodeDAO.decreaseMaxUses(id);
            resp.setStatus(HttpServletResponse.SC_OK);
        }
    }

    private int tryToGetId(String paramId) {
        try {
            return Integer.parseInt(paramId);
        } catch (NumberFormatException e) {
            return -1;
        }
    }
}
