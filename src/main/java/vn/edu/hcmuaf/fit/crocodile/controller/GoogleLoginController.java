package vn.edu.hcmuaf.fit.crocodile.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;
import vn.edu.hcmuaf.fit.crocodile.model.entity.GoogleUser;
import vn.edu.hcmuaf.fit.crocodile.service.GoogleService;

import java.io.IOException;

@WebServlet("/google-login")
public class GoogleLoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String code = req.getParameter("code");

        try {
            if (code == null) {
                resp.sendRedirect(GoogleService.getLoginUrl());
            } else {
                JSONObject tokenResponse = GoogleService.getAccessToken(code);
                String accessToken = tokenResponse.getString("access_token");

                JSONObject userProfile = GoogleService.getUserProfile(accessToken);
                String name = userProfile.getString("name");
                String avatar = userProfile.getString("picture");

                // Lưu thông tin người dùng vào session
                HttpSession session = req.getSession();
                GoogleUser googleUser = new GoogleUser(name, avatar);
                session.setAttribute("googleUser", googleUser);

                // Redirect về trang chủ
                resp.sendRedirect("home.jsp");
            }
        } catch (Exception e) {
            throw new ServletException("Error during Google login", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
