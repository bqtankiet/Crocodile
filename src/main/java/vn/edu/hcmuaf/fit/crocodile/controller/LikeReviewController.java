package vn.edu.hcmuaf.fit.crocodile.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.crocodile.service.ProductReviewService;

import java.io.IOException;

@WebServlet(name = "LikeReviewController", value = "/like-review")
public class LikeReviewController extends HttpServlet {
    private ProductReviewService productReviewService;

    public LikeReviewController() {
        productReviewService = new ProductReviewService();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int reviewId = Integer.parseInt(request.getParameter("reviewId"));

        boolean success = productReviewService.incrementLike(reviewId);
        // TODO: xử lý like 1 lần, unlike

        response.setContentType("text/plain");
        response.getWriter().write(success ? "success" : "error");
    }
}