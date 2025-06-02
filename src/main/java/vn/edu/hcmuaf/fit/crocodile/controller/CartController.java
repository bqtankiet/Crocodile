package vn.edu.hcmuaf.fit.crocodile.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
//import vn.edu.hcmuaf.fit.crocodile.model.entity.Cart;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Product;
import vn.edu.hcmuaf.fit.crocodile.model.entity.User;
import vn.edu.hcmuaf.fit.crocodile.service.ProductService;
import java.io.IOException;
import java.util.List;
import java.util.Objects;

import vn.edu.hcmuaf.fit.crocodile.model.cart.Cart;
import vn.edu.hcmuaf.fit.crocodile.model.cart.CartItem;
import vn.edu.hcmuaf.fit.crocodile.util.log.LogCart;
import vn.edu.hcmuaf.fit.crocodile.util.log.LogUtil;

@WebServlet(name = "CartController", value = "/cart")
public class CartController extends HttpServlet {
    ProductService productService = new ProductService();
    LogCart logCart = new LogCart();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

//        Cart cart = (Cart) session.getAttribute("cart");
//        if (cart == null) { cart = new Cart(); }
//
//        session.setAttribute("cart", cart);
//        request.getRequestDispatcher("/views/cart.jsp").forward(request, response);

        // my test
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null || cart.getTotalQuantity() == 0) {}
        request.getRequestDispatcher("/views/cart.jsp").forward(request, response);
    }

//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        int idVariant = Integer.parseInt(request.getParameter("idVariant"));
//        int quantity = Integer.parseInt(request.getParameter("quantity"));
//
//        Product.ProductVariant productVariant = productService.getProductVariantById(idVariant);
//
//        Product product = productService.getProductById(productVariant.getIdProduct());
//
//        Product.ProductOption pOption1 = productService.findOptionsById(productVariant.getIdOption1());
//        Product.ProductOption pOption2 = productService.findOptionsById(productVariant.getIdOption2());
//
//        HttpSession session = request.getSession();
//        Cart cart = (Cart) session.getAttribute("cart");
//        if (cart == null) { cart = new Cart(); }
//
//        cart.addProduct(idVariant, product, quantity, pOption1, pOption2);
//
//        session.setAttribute("cart", cart);
//    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        int idVariant = Integer.parseInt(request.getParameter("idVariant"));
        User user = (User) request.getSession().getAttribute("user");

        switch (action){
            case "add" ->{
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                Product.ProductVariant pv = productService.getProductVariantById(idVariant);

                HttpSession session = request.getSession();
                Cart cart = (Cart) session.getAttribute("cart");
                if (cart == null) { cart = new Cart(); }
                CartItem cartItem = new CartItem(pv, quantity);
                cart.addItem(cartItem);

                session.setAttribute("cart", cart);

                if(user != null) {
                    logCart.logAddToCart(String.valueOf(user.getId()), String.valueOf(user.getFullname()), LogUtil.getClientIp(request), String.valueOf(pv.getId()), quantity);
                } else {
                    logCart.logGuestAddToCart(LogUtil.getClientIp(request), String.valueOf(pv.getId()), quantity);
                }
            }

            case "update" -> {
                HttpSession session = request.getSession();
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                Product.ProductVariant pv = productService.getProductVariantById(idVariant);

                Cart cart = (Cart) session.getAttribute("cart");

                CartItem cartItem = new CartItem(pv, quantity);

                cart.updateItemQuantity(pv.getId(), quantity);

                session.setAttribute("cart", cart);
            }

            case "remove" -> {
                HttpSession session = request.getSession();

                Cart cart = (Cart) session.getAttribute("cart");

                cart.removeItem(idVariant);

                session.setAttribute("cart", cart);
            }

        }

    }
}
