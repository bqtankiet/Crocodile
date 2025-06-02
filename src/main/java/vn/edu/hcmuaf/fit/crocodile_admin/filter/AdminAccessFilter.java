package vn.edu.hcmuaf.fit.crocodile_admin.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.crocodile.dao.rolepermission.RolePermissionService;
import vn.edu.hcmuaf.fit.crocodile.model.entity.User;
import vn.edu.hcmuaf.fit.crocodile.util.log.LogAuthentication;
import vn.edu.hcmuaf.fit.crocodile.util.log.LogUtil;

import java.io.IOException;

import static vn.edu.hcmuaf.fit.crocodile.dao.rolepermission.RolePermissionConst.ACCESS;
import static vn.edu.hcmuaf.fit.crocodile.dao.rolepermission.RolePermissionConst.ADMIN_PAGE;

@WebFilter(filterName = "AdminFilter", urlPatterns = "/admin/*")
public class AdminAccessFilter implements Filter {
    private final RolePermissionService rolePermissionService = new RolePermissionService();

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if(user != null && rolePermissionService.userHasPermission(user.getId(), ADMIN_PAGE, ACCESS)) {
            filterChain.doFilter(request, response);
        } else {
            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
        }
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }


    @Override
    public void destroy() {
    }
}
