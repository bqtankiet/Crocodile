package vn.edu.hcmuaf.fit.crocodile.controller;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Product;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Product.*;
import vn.edu.hcmuaf.fit.crocodile.service.ProductService;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "ProductDetailController", value = "/product-detail")
public class ProductDetailController extends HttpServlet {
    private ProductService productService;

    @Override
    public void init() throws ServletException {
        this.productService = new ProductService();
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

        // "productDetails"
        List<Product.ProductDetail> productDetails = productService.getAllDetailsByProductId(productId);
        request.setAttribute("productDetails", productDetails);

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


        // forward
        request.getRequestDispatcher("/views/product-detail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}