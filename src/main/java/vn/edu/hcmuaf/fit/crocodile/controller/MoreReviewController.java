package vn.edu.hcmuaf.fit.crocodile.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.crocodile.model.entity.ProductReview;
import vn.edu.hcmuaf.fit.crocodile.service.ProductReviewService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "MoreReviewController", value = "/more-review")
public class MoreReviewController extends HttpServlet {
    private ProductReviewService productReviewService;

    @Override
    public void init() throws ServletException {
        this.productReviewService = new ProductReviewService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idProduct = Integer.parseInt(request.getParameter("idProduct"));
        int offset = Integer.parseInt(request.getParameter("offset"));

        int LIMIT = 5;

        List<ProductReview> moreReviews = productReviewService.getReviewsByProductId(idProduct, offset, LIMIT);

        for (ProductReview review : moreReviews) {
            List<ProductReview.ReviewImage> images = productReviewService.getImagesByReviewId(review.getId());
            review.setImages(images);
        }

        request.setAttribute("productReviews", moreReviews);

        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        request.getRequestDispatcher("/views/partials/review-items.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}