package vn.edu.hcmuaf.fit.crocodile.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.crocodile.config.properties.UrlProperties;
import vn.edu.hcmuaf.fit.crocodile.dao.product.strategy.*;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Category;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Product;
import vn.edu.hcmuaf.fit.crocodile.service.CategoryService;
import vn.edu.hcmuaf.fit.crocodile.service.ProductService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

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
        int idCate = utils.tryToGetId(request);
        int page = utils.tryToGetPage(request);
        int maxPage = productService.getMaxPage(idCate);
        String sortBy = Objects.requireNonNullElse(request.getParameter("sortBy"), "");
        IProductSortingStrategy sortStrategy = new StrategySortByID();
        switch (sortBy.toLowerCase()) {
            case StrategySortByCreateDate.NAME: {
                sortStrategy = new StrategySortByCreateDate();
                break;
            }
            case StrategySortByPriceASC.NAME: {
                sortStrategy = new StrategySortByPriceASC();
                break;
            }
            case StrategySortByPriceDESC.NAME: {
                sortStrategy = new StrategySortByPriceDESC();
                break;
            }
        }

        Category category = categoryService.getCategoryById(idCate);
        List<Product> productList = sortStrategy.findAllWithPagination(idCate, page, 12);

        request.setAttribute("sortStrategy", sortStrategy.getName());
        request.setAttribute("category", category);
        request.setAttribute("page", page);
        request.setAttribute("maxPage", maxPage);
        request.setAttribute("productList", productList);

        //      ---------------  Search ---------------
        String keyWord = request.getParameter("key");
        if(keyWord!=null) {
            List<Product> list = productService.searchProduct(keyWord);
            list.forEach(System.out::println);
            System.out.println("---------------------------------------------------------");
            request.setAttribute("listProductSearch", list);
        }
        //      ---------------  Search ---------------

        request.getRequestDispatcher("/views/product-list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private class CategoryControllerUtils {
        public int tryToGetId(HttpServletRequest request) {
            int id = 1;
            try {
                id = Integer.parseInt(request.getParameter("idCate"));
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

        public void normalizeURLParams(HttpServletRequest request, HttpServletResponse response) {
            int idCate = utils.tryToGetId(request);
            int page = utils.tryToGetPage(request);
            int maxPage = productService.getMaxPage(idCate);
            page = Math.max(1, Math.min(page, maxPage));
            try {
                response.sendRedirect(request.getContextPath() + UrlProperties.productList() + "?idCate=" + idCate + "&page=" + page);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }
}