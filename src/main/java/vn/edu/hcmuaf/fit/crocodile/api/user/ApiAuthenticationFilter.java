package vn.edu.hcmuaf.fit.crocodile.api.user;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter("/api/user/*")
public class ApiAuthenticationFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        int userId = authenticate(request);
        // Chưa xác thực, chặn lại
        if (userId == -1) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }
        // Đã xác thực, tiếp tục request
        filterChain.doFilter(request, response);
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }

    private int authenticate(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            return -1;
        }
        return Integer.parseInt(session.getAttribute("userId").toString());
    }

}
