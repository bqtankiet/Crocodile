package vn.edu.hcmuaf.fit.crocodile.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.crocodile.dao.discount.DiscountCodeDAO;
import vn.edu.hcmuaf.fit.crocodile.model.entity.DiscountCode;

import java.io.IOException;

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
}
