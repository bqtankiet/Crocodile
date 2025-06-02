package vn.edu.hcmuaf.fit.crocodile.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;
import vn.edu.hcmuaf.fit.crocodile.service.ProductReviewService;

import java.io.BufferedReader;
import java.io.IOException;

@WebServlet(name = "ProductReviewController", value = "/product-review")
public class ProductReviewController extends HttpServlet {
    ProductReviewService productReviewService = new ProductReviewService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();

        BufferedReader reader = new BufferedReader(request.getReader());
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }
        String jsonInput = sb.toString();

        JSONObject jsonObject = new JSONObject(jsonInput);

        try {
            int userId = (int) session.getAttribute("userId");
            int productId = jsonObject.getInt("productId");
            int variantId = jsonObject.getInt("variantId");
            int rating = jsonObject.getInt("rating");
            String quality = jsonObject.getString("quality");
            String matchDescription = jsonObject.getString("descriptionMatch");
            String reviewText = jsonObject.getString("reviewText");
            boolean showName = jsonObject.getBoolean("showName");
            int isShowUsername = showName ? 1 : 0;

            productReviewService.evaluateProduct(productId, variantId, userId, rating, quality, matchDescription, reviewText, isShowUsername);

            response.setStatus(HttpServletResponse.SC_OK);
            response.getWriter().write("{\"status\": \"success\", \"message\": \"Cảm ơn bạn!\"}");

        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            JSONObject errorJson = new JSONObject();
            errorJson.put("status", "error");
            errorJson.put("message", "Đánh giá thất bại: " + e.getMessage());
            response.getWriter().write(errorJson.toString());
        }





    }
}