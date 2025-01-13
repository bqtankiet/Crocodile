package vn.edu.hcmuaf.fit.crocodile_admin.controller.CRUD.product;

import com.google.gson.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Product;
import vn.edu.hcmuaf.fit.crocodile.service.CategoryService;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "InsertProductController", value = "/admin/product/insert")
public class InsertProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/admin/views/product-detail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        InsertProductController.Utils utils = new InsertProductController.Utils();
        JsonObject jsonData = utils.getJsonData(request);

        // extract product data
        Product product = utils.extractProduct(jsonData);
        System.out.println(product);

        // extract product's images
        List<Product.ProductImage> images = utils.extractImages(jsonData);
        images.forEach(System.out::println);

        // extract product's attributes
        List<Product.ProductAttribute> attributes = utils.extractAttributes(jsonData);
        attributes.forEach(System.out::println);

        // extract product's variants
        // extract product's options

        // Prepare a JSON response with the redirect URL
        JsonObject jsonResponse = new JsonObject();
        jsonResponse.addProperty("status", "success");
        jsonResponse.addProperty("message", "Product data received successfully");
        jsonResponse.add("received_data", jsonData); // Include the received data in the response


        // Set response content type to JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        // Send the JSON response
        Gson gson = new Gson();
        response.setStatus(HttpServletResponse.SC_OK);
        response.getWriter().write(gson.toJson(jsonResponse));

    }

    private class Utils {

        JsonObject getJsonData(HttpServletRequest request) {
            // Read the JSON payload from the request body
            StringBuilder jsonBuilder = new StringBuilder();
            try (BufferedReader reader = request.getReader()) {
                String line;
                while ((line = reader.readLine()) != null) {
                    jsonBuilder.append(line);
                }
            } catch (IOException e) {
                throw new RuntimeException(e);
            }

            // Parse the JSON payload
            JsonObject requestData;
            requestData = JsonParser.parseString(jsonBuilder.toString()).getAsJsonObject();
            return requestData;
        }

        Product extractProduct(JsonObject data) {
            int id = 0; // 0 that mean id is auto increment
            int idCategory = data.get("category_id").getAsInt();
            String name = data.get("name").getAsString();
            String image = data.get("images").getAsJsonArray().get(0).getAsString();
            int price = data.get("price").getAsInt();
            String description = data.get("description").getAsString();

            Product p = new Product();
            p.setId(id);
            p.setName(name);
            p.setImage(image);
            p.setCategory(new CategoryService().getCategoryById(idCategory));
            p.setPrice(price);
            p.setDescription(description);
            return p;
        }

        public List<Product.ProductAttribute> extractAttributes(JsonObject jsonData) {
            List<Product.ProductAttribute> attributes = new ArrayList<>();
            JsonArray jsonArr = jsonData.get("attributes").getAsJsonArray();
            for (JsonElement jsonElement : jsonArr) {
                JsonObject jsonAttribute = jsonElement.getAsJsonObject();
                String key = jsonAttribute.get("key").getAsString();
                String value = jsonAttribute.get("value").getAsString();
                Product.ProductAttribute attr = new Product.ProductAttribute();
                attr.setKey(key);
                attr.setValue(value);
                attributes.add(attr);
            }
            return attributes;
        }

        public List<Product.ProductImage> extractImages(JsonObject jsonData) {
            List<Product.ProductImage> images = new ArrayList<>();
            JsonArray jsonArr = jsonData.get("images").getAsJsonArray();
            int index = 0;
            for (JsonElement jsonElement : jsonArr) {
                String imgUrl = jsonElement.getAsString();
                Product.ProductImage image = new Product.ProductImage();
                image.setIndex(index++);
                image.setImage(imgUrl);
                images.add(image);
            }
            return images;
        }
    }
}
