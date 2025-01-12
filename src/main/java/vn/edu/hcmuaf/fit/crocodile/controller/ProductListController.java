package vn.edu.hcmuaf.fit.crocodile.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Category;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Product;
import vn.edu.hcmuaf.fit.crocodile.service.CategoryService;
import vn.edu.hcmuaf.fit.crocodile.service.ProductService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductListController", value = "/product-list")
public class ProductListController extends HttpServlet {
    private CategoryControllerUtils utils;
    private CategoryService categoryService;
    private ProductService productService;

    @Override
    public void init() throws ServletException {
         this.utils = new CategoryControllerUtils();
         this.categoryService = new CategoryService();
         this.productService = new ProductService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = 1;
        int page = 3;
        int maxPage = 6;
        Category category = categoryService.getCategoryById(id);
        List<Product> productList = productService.getAllProducts();

        request.setAttribute("categoryName", category.getName());
        request.setAttribute("page",page);
        request.setAttribute("maxPage",maxPage);
        request.setAttribute("productList",productList);
        request.getRequestDispatcher("/views/product-list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private class CategoryControllerUtils {
        public int tryToGetId(HttpServletRequest request) {
            int id = -1;
            try {
                id = Integer.parseInt(request.getParameter("id"));
            } catch (NumberFormatException e) {
                // do nothing
            }
            return id;
        }

        public int tryToGetPage(HttpServletRequest request) {
            int page = 1;
            try {
                page = Integer.parseInt(request.getParameter("page"));
            } catch (NumberFormatException e) {
                // do nothing
            }
            return page;
        }
    }
}