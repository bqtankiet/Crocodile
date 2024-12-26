package vn.edu.hcmuaf.fit.crocodile.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.crocodile.service.CarouselService;
import vn.edu.hcmuaf.fit.crocodile.service.CategoryService;

import java.io.IOException;

@WebServlet(name = "HomeController", value = "")
public class HomeController extends HttpServlet {
    private CarouselService carouselService;
    private CategoryService categoryService;

    @Override
    public void init() throws ServletException {
        super.init();
        carouselService = new CarouselService();
        categoryService = new CategoryService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("carousels", carouselService.getAllActiveCarousel());
        request.setAttribute("categories", categoryService.getAllActiveCategory());
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/home.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}