package vn.edu.hcmuaf.fit.crocodile.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.crocodile.model.orderv2.OrderJson;
import vn.edu.hcmuaf.fit.crocodile.model.orderv2.OrderJsonException;
import vn.edu.hcmuaf.fit.crocodile.model.orderv2.OrderV2;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/checkout/v2")
public class CheckoutControllerV2 extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/cart");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        configureResponse(response);

        String payload = readRequestPayload(request);
        OrderJson orderJson = new OrderJson();

        try {
            OrderV2 order = orderJson.fromJson(payload);
            sendSuccessResponse(response, orderJson, order);
            forwardSuccess(request, response, order);
        } catch (OrderJsonException e) {
            sendErrorResponse(response, e.getMessage());
        }
    }

    private void forwardSuccess(HttpServletRequest request, HttpServletResponse response, OrderV2 order) throws ServletException, IOException {
        request.setAttribute("order", order);
        request.setAttribute("address", order.getAddress());
        request.setAttribute("items", order.getItems());
        request.getRequestDispatcher("/views/checkout.jsp").forward(request, response);
    }

    private void configureResponse(HttpServletResponse response) {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
    }

    private String readRequestPayload(HttpServletRequest request) throws IOException {
        StringBuilder payload = new StringBuilder();
        try (BufferedReader reader = request.getReader()) {
            String line;
            while ((line = reader.readLine()) != null) {
                payload.append(line);
            }
        }
        return payload.toString();
    }

    private void sendSuccessResponse(HttpServletResponse response, OrderJson orderJson, OrderV2 order) throws IOException {
        response.setStatus(HttpServletResponse.SC_OK);
        try (PrintWriter out = response.getWriter()) {
            out.print(orderJson.toStringJson(order));
        }
    }

    private void sendErrorResponse(HttpServletResponse response, String errorMessage) throws IOException {
        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        try (PrintWriter out = response.getWriter()) {
            out.printf("{\"errorMessage\": \"%s\"}", errorMessage);
        }
    }
}