package vn.edu.hcmuaf.fit.crocodile.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;

@WebServlet(name = "ProductReviewController", value = "/product-review")
public class ProductReviewController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        BufferedReader reader = new BufferedReader(request.getReader());
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }
        String jsonInput = sb.toString();

        JSONObject jsonObject = new JSONObject(jsonInput);
        int productID = jsonObject.getInt("productId");
        int variantID = jsonObject.getInt("variantId");
        int rating = jsonObject.getInt("rating");
        String quality = jsonObject.getString("quality");
        String matchDescription = jsonObject.getString("descriptionMatch");
        String reviewText = jsonObject.getString("reviewText");
        boolean showName = jsonObject.getBoolean("showName");
        int isShowUsername = showName ? 1 : 0;

        System.out.println("productID::: " + productID);
        System.out.println("variantID::: " + variantID);
        System.out.println("rating::: " + rating);
        System.out.println("quality::: " + quality);
        System.out.println("matchDescription::: " + matchDescription);
        System.out.println("reviewText::: " + reviewText);
        System.out.println("showName::: " + showName);
        System.out.println("isShowUsername::: " + isShowUsername);



    }
}