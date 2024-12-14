package vn.edu.hcmuaf.fit.crocodile.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
//TODO
//@WebFilter(urlPatterns = {"*.jsp", "/assets/*"})
public class ResourceAccessFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        // Chặn truy cập trực tiếp vào các file JSP
        httpResponse.sendError(HttpServletResponse.SC_FORBIDDEN, "Access to the requested resource has been denied");
    }
}
