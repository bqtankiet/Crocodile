package vn.edu.hcmuaf.fit.crocodile.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Product;
import vn.edu.hcmuaf.fit.crocodile.service.CarouselService;
import vn.edu.hcmuaf.fit.crocodile.service.CategoryService;
import vn.edu.hcmuaf.fit.crocodile.service.ProductService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeController", value = "")
public class HomeController extends HttpServlet {
    private CarouselService carouselService;
    private CategoryService categoryService;
    private ProductService productService;

    @Override
    public void init() throws ServletException {
        super.init();
        carouselService = new CarouselService();
        categoryService = new CategoryService();
        productService = new ProductService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("carousels", carouselService.getAllActiveCarousel());
        request.setAttribute("categories", categoryService.getAllActiveCategory());

        List<Product> topSellingProducts = productService.getTopSellingProductsInDays(10, 30);
        request.setAttribute("topSellingProducts", topSellingProducts);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/home.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}