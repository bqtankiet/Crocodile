package vn.edu.hcmuaf.fit.crocodile.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Cart;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Product;
import vn.edu.hcmuaf.fit.crocodile.service.ProductService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "CartController", value = "/cart")
public class CartController extends HttpServlet {
    ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) { cart = new Cart(); }

        session.setAttribute("cart", cart);
        request.getRequestDispatcher("/views/cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idVariant = Integer.parseInt(request.getParameter("idVariant"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        Product.ProductVariant productVariant = productService.getProductVariantById(idVariant);

        Product product = productService.getProductById(productVariant.getIdProduct());

        Product.ProductOption pOption1 = productService.findOptionsById(productVariant.getIdOption1());
        Product.ProductOption pOption2 = productService.findOptionsById(productVariant.getIdOption2());

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) { cart = new Cart(); }

        cart.addProduct(idVariant, product, quantity, pOption1, pOption2);

        session.setAttribute("cart", cart);
    }
}
