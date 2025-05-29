package vn.edu.hcmuaf.fit.crocodile.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.crocodile.dao.discount.DiscountCodeDAO;
import vn.edu.hcmuaf.fit.crocodile.dao.userdiscount.IUserDiscountDAO;
import vn.edu.hcmuaf.fit.crocodile.dao.userdiscount.UserDiscountDAO;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Category;
import vn.edu.hcmuaf.fit.crocodile.model.entity.DiscountCode;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Product;
import vn.edu.hcmuaf.fit.crocodile.model.entity.UserDiscount;
import vn.edu.hcmuaf.fit.crocodile.service.CarouselService;
import vn.edu.hcmuaf.fit.crocodile.service.CategoryService;
import vn.edu.hcmuaf.fit.crocodile.service.ProductService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@WebServlet(name = "HomeController", value = "")
public class HomeController extends HttpServlet {
    private CarouselService carouselService;
    private CategoryService categoryService;
    private ProductService productService;
    private DiscountCodeDAO discountDao;

    @Override
    public void init() throws ServletException {
        super.init();
        carouselService = new CarouselService();
        categoryService = new CategoryService();
        productService = new ProductService();
        discountDao = new DiscountCodeDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("carousels", carouselService.getAllActiveCarousel());
        request.setAttribute("categories", categoryService.getAllActiveCategory());

        /* Lấy danh sách 10 sản phẩm bán chạy nhất:
        ưu tiên dữ liệu trong quý trước tiên, nếu không đủ 10 sản phẩm
        thì mở rộng phạm vi thời gian ra đến tối đa 1 năm.
        */
        int period = 90;
        int topN = 10;
        List<Product> topSellingProducts = productService.getTopSellingProductsInDays(topN, period);
        while (topSellingProducts.size() < topN && period < 360) {
            period += 90;
            topSellingProducts = productService.getTopSellingProductsInDays(topN, period);
        }
        request.setAttribute("topSellingProducts", topSellingProducts);

        // Lấy danh sách 3 danh mục bán chạy nhất ưu tiên quý gần nhất và mở rộng qua các quý sau (giới hạn 1 năm)
        period = 90;
        topN = 3;
        List<Category> topSellingCategories = categoryService.getTopSellingCategoriesInDays(topN, 90);
        while (topSellingCategories.size() < topN && period < 360) {
            period += 90;
            topSellingCategories = categoryService.getTopSellingCategoriesInDays(topN, period);
        }
        request.setAttribute("topSellingCategories", topSellingCategories);

        // Lấy 10 sản phẩm bán chạy theo các danh mục đã lấy ở trên
        period = 90;
        topN = 10;

        List<List<Product>> topSellingProductsInCategory = new ArrayList<>();
        for (Category category : topSellingCategories) {
            List<Product> topProducts = Collections.emptyList();
            int searchPeriod = period;
            while (topProducts.size() < topN && searchPeriod < 360) {
                topProducts = productService.getTopSellingProductsOfCategory(topN, searchPeriod, category.getId());
                searchPeriod += 90;
            }
            topSellingProductsInCategory.add(topProducts);
        }

        List<DiscountCode> vouchers = discountDao.findAllByCategory(DiscountCode.DiscountCategory.VOUCHER, 4);
        HttpSession session = request.getSession();
        Object rawUserId = session.getAttribute("userId");
        if(rawUserId != null) {
            int userId = Integer.parseInt(rawUserId.toString());
            IUserDiscountDAO userDiscountDAO = new UserDiscountDAO();
            List<UserDiscount> userDiscounts = userDiscountDAO.findAllByUserId(userId);
            for (DiscountCode v : vouchers) {
                for(UserDiscount ud : userDiscounts) {
                    if(v.getId() == ud.getIdDiscount()) v.setSaved(true);
                }
            }
        }
        request.setAttribute("vouchers", vouchers);

// Gán danh sách vào request để sử dụng trên giao diện
        request.setAttribute("topSellingProductsInCategory", topSellingProductsInCategory);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/home.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}