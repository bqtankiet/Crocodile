package vn.edu.hcmuaf.fit.crocodile.controller;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Product;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Product.*;
import vn.edu.hcmuaf.fit.crocodile.model.entity.ProductReview;
import vn.edu.hcmuaf.fit.crocodile.model.entity.User;
import vn.edu.hcmuaf.fit.crocodile.service.ProductReviewService;
import vn.edu.hcmuaf.fit.crocodile.service.ProductService;
import vn.edu.hcmuaf.fit.crocodile.service.UserService;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@WebServlet(name = "ProductDetailController", value = "/product-detail")
public class ProductDetailController extends HttpServlet {
    private ProductService productService;
    private ProductReviewService productReviewService;
    private UserService userService;

    @Override
    public void init() throws ServletException {
        this.productService = new ProductService();
        this.productReviewService = new ProductReviewService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // check parameter
        String paramId = request.getParameter("id");
        if (paramId == null || paramId.isBlank()) return;

        // handle parameter
        // "product"
        int productId = Integer.parseInt(paramId);
        Product product = productService.getProductById(productId);
        if (product == null || !product.isActive()) return;
        request.setAttribute("product", product);

        // "productImages"
        List<ProductImage> productImages = productService.getAllImagesByProductId(productId);
        request.setAttribute("productImages", productImages);

        // "productAttributes"
        List<Product.ProductAttribute> productAttributes = productService.getAllAttributesByProductId(productId);
        request.setAttribute("productDetails", productAttributes);

        // "productOptionGroup"
        ProductOptionGroup optionGroup1 = productService.getProductOptionGroupById(productId, 1);
        ProductOptionGroup optionGroup2 = productService.getProductOptionGroupById(productId, 2);
        List<ProductOptionGroup> optionGroups = Arrays.asList(optionGroup1, optionGroup2);
        request.setAttribute("optionGroups", optionGroups);

        // "productVariants"
//        List<ProductVariant> productVariants = productService.getAllVariantsByProductId(productId);
//        request.setAttribute("productVariants", productVariants);

        // "productVariantsJson"
        List<ProductVariant> productVariants = productService.getAllVariantsByProductId(productId);
        Gson gson = new Gson();
        String productVariantsJson = gson.toJson(productVariants);
        request.setAttribute("productVariantsJson", productVariantsJson);

        // List similar products
        List<Product> similarProducts = productService.findRandomNSimilarProducts(10, productId);
        request.setAttribute("similarProducts", similarProducts);

        // ------------------------------cho phần đánh giá sản phẩm------------------------------
        // List product review
        List<ProductReview> productReviews = productReviewService.getReviewsByProductId(productId, 0, 999);

        for (ProductReview review : productReviews) {
            List<ProductReview.ReviewImage> images = productReviewService.getImagesByReviewId(review.getId());
            review.setImages(images);
        }

        List<ProductReview> firstFive = productReviews
                .stream()
                .limit(5)
                .collect(Collectors.toList());

        request.setAttribute("productReviews", firstFive);
        request.setAttribute("hasMore", productReviews.size() > 5);

        double avgRating = productReviewService.getAverageRatingForProduct(productId);
        request.setAttribute("avgRating", avgRating);
        // ------------------------------cho phần đánh giá sản phẩm------------------------------

        // forward
        request.getRequestDispatcher("/views/product-detail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}