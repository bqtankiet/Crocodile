package vn.edu.hcmuaf.fit.crocodile_admin.controller.CRUD.product;

import com.google.gson.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.JSONObject;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Product;
import vn.edu.hcmuaf.fit.crocodile.service.CategoryService;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@WebServlet(name = "InsertProductController", value = "/admin/product/insert")
public class InsertProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/admin/views/product-detail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JsonUtils jsonUtils = new JsonUtils();
        JsonObject jsonData = jsonUtils.getJsonData(request);

        // extract product data
        Product product = jsonUtils.extractProduct(jsonData);
        System.out.println(product);

        // extract product's images
        List<Product.ProductImage> images = jsonUtils.extractImages(jsonData);
        images.forEach(System.out::println);

        // extract product's attributes
        List<Product.ProductAttribute> attributes = jsonUtils.extractAttributes(jsonData);
        attributes.forEach(System.out::println);

        // extract product's variants
        List<Product.ProductVariant> variants = jsonUtils.extractProductVariants(jsonData);
        variants.forEach(System.out::println);

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

}

class JsonUtils {

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

    public List<Product.ProductVariant> extractProductVariants(JsonObject jsonData) {
        List<Product.ProductVariant> variants = new ArrayList<>();
        JsonArray jsonArr = jsonData.get("variants").getAsJsonArray();
        for (JsonElement jsonElement : jsonArr) {
            JsonObject jsonVariant = jsonElement.getAsJsonObject();
            Product.ProductVariant v = createVariant(jsonVariant);
            variants.add(v);
        }
        return variants;
    }

    private Product.ProductVariant createVariant(JsonObject jsonVariant) {
        try {
            int stock = parseIntOrElse(jsonVariant.get("stock").getAsString(), 0);
            String sku = jsonVariant.get("sku").getAsString();
            Product.ProductOption option1 = null;
            Product.ProductOption option2 = null;
            if (jsonVariant.has("option1")) {
                JsonObject jsonOption = jsonVariant.get("option1").getAsJsonObject();
                option1 = new Product.ProductOption();
                option1.setGroup(1);
                option1.setKey(jsonOption.get("key").getAsString());
                option1.setValue(jsonOption.get("value").getAsString());
                option1.setImage(jsonOption.get("image").getAsString());
            }
            if (jsonVariant.has("option2")) {
                JsonObject jsonOption = jsonVariant.get("option2").getAsJsonObject();
                option2 = new Product.ProductOption();
                option2.setGroup(2);
                option2.setKey(jsonOption.get("key").getAsString());
                option2.setValue(jsonOption.get("value").getAsString());
                option2.setImage(null);
            }

            Product.ProductVariant pv = new Product.ProductVariant();
            pv.setStock(stock);
            pv.setSku(sku);
            pv.setOption1(option1);
            pv.setOption2(option2);
            return pv;
        } catch (Exception e) {
            e.printStackTrace(new PrintWriter(System.out, true));
        }
        return null;
    }

    static int parseIntOrElse(String value, int defaultValue) {
        try {
            return Integer.parseInt(value);
        } catch (NumberFormatException e) {
            return defaultValue;
        }
    }

}

