package vn.edu.hcmuaf.fit.crocodile.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.crocodile.model.entity.ProductReview;
import vn.edu.hcmuaf.fit.crocodile.service.ProductReviewService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductReviewFilterController", value = "/rating-filter")
public class ProductReviewFilterController extends HttpServlet {
    ProductReviewService productReviewService;

    public ProductReviewFilterController() {
        this.productReviewService = new ProductReviewService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idProduct = Integer.parseInt(request.getParameter("idProduct"));
        int rating = Integer.parseInt(request.getParameter("rating"));

        List<ProductReview> reviews;
        if (rating == 0) {
            reviews = productReviewService.getReviewsByProductId(idProduct, 0, 999);
        } else {
            reviews = productReviewService.getReviewsByRating(idProduct, rating);
        }

        for (ProductReview review : reviews) {
            List<ProductReview.ReviewImage> images = productReviewService.getImagesByReviewId(review.getId());
            review.setImages(images);
        }
        // TODO: chưa xử lý hiển hiển thị đánh giá rút gọn -> vd: hiển thị 5 đánh giá

        request.setAttribute("productReviews", reviews);
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        request.getRequestDispatcher("/views/partials/review-items.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}