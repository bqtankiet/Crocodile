package vn.edu.hcmuaf.fit.crocodile.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "GoogleLogin", urlPatterns = {"/login"})
public class GoogleLogin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/login.jsp").forward(request, response);
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        String code = request.getParameter("code");
        try {
            GoogleLoginController googleLogin = new GoogleLoginController();
            String accessToken = GoogleLoginController.getAccessToken(code);
            String userInfo = GoogleLoginController.getUserInfo(accessToken);
            // Gửi thông tin người dùng dưới dạng JSON tới front-end
            response.getWriter().write(userInfo);
        } catch (IOException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Unable to process Google login.");
        }
    }
}