package vn.edu.hcmuaf.fit.crocodile_admin.controller.CRUD.product;

import com.google.gson.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.BufferedReader;
import java.io.IOException;

@WebServlet(name = "InsertProductController", value = "/admin/product/insert")
public class InsertProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/admin/views/product-detail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set response content type to JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Read the JSON payload from the request body
        StringBuilder jsonPayload = new StringBuilder();
        try (BufferedReader reader = request.getReader()) {
            String line;
            while ((line = reader.readLine()) != null) {
                jsonPayload.append(line);
            }
        }

        // Parse the JSON payload
        Gson gson = new Gson();
        JsonObject requestData;
        try {
            requestData = JsonParser.parseString(jsonPayload.toString()).getAsJsonObject();
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("{\"error\": \"Invalid JSON format\"}");
            return;
        }

        // Extract specific fields from the JSON (example: name, category_id, etc.)
        String name = requestData.has("name") ? requestData.get("name").getAsString() : "Unknown";
        String categoryId = requestData.has("category_id") ? requestData.get("category_id").getAsString() : "0";
        String description = requestData.has("description") ? requestData.get("description").getAsString() : "No description provided";

        // Log the received data (optional)
        System.out.println("Received product data:");
        System.out.println("Name: " + name);
        System.out.println("Category ID: " + categoryId);
        System.out.println("Description: " + description);

        // Prepare a JSON response with the redirect URL
        JsonObject jsonResponse = new JsonObject();
        jsonResponse.addProperty("status", "success");
        jsonResponse.addProperty("message", "Product data received successfully");
        jsonResponse.add("received_data", requestData); // Include the received data in the response

        // Send the JSON response
        response.setStatus(HttpServletResponse.SC_OK);
        response.getWriter().write(gson.toJson(jsonResponse));

    }
}
