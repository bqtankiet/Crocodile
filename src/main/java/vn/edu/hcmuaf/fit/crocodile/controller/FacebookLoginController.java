package vn.edu.hcmuaf.fit.crocodile.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;
import vn.edu.hcmuaf.fit.crocodile.service.FacebookService;
import vn.edu.hcmuaf.fit.crocodile.model.entity.FaceBookUser;

import java.io.IOException;

@WebServlet("/facebook-login")
public class FacebookLoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String code = req.getParameter("code");

        try {
            if (code == null) {
                resp.sendRedirect(FacebookService.getLoginUrl());
            } else {
                JSONObject tokenResponse = FacebookService.getAccessToken(code);
                String accessToken = tokenResponse.getString("access_token");

                JSONObject userProfile = FacebookService.getUserProfile(accessToken);
                String name = userProfile.getString("name");
                String avatar = userProfile.getJSONObject("picture").getJSONObject("data").getString("url");

                FaceBookUser user = new FaceBookUser(name, avatar);

                HttpSession session = req.getSession();
                session.setAttribute("facebookUser", user);
                session.setAttribute("userName", user.getName());
                session.setAttribute("userAvatar", user.getAvatarUrl());
                System.out.println("User Name: " + user.getName());
                System.out.println("User Avatar: " + user.getAvatarUrl());

                resp.sendRedirect("home.jsp");
            }
        } catch (Exception e) {
            throw new ServletException("Error Login", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
