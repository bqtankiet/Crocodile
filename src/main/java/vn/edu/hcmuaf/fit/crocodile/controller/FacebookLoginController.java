package vn.edu.hcmuaf.fit.crocodile.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;
import vn.edu.hcmuaf.fit.crocodile.service.FacebookService;
import vn.edu.hcmuaf.fit.crocodile.model.entity.FaceBookUser;

import java.io.IOException;

@WebServlet(value = "/facebook-login")
public class FacebookLoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
