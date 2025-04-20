package vn.edu.hcmuaf.fit.crocodile_admin.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.crocodile.dao.rolepermission.RolePermissionConst;
import vn.edu.hcmuaf.fit.crocodile_admin.utils.PermissionHelper;

import java.io.IOException;

@WebFilter(urlPatterns = "/admin/product/insert")
public class ProductInsertFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        boolean haveAccess = PermissionHelper.checkPermission(request, RolePermissionConst.PRODUCT_MANAGEMENT, RolePermissionConst.CREATE);
        if (haveAccess) {
            filterChain.doFilter(servletRequest, servletResponse);
        } else {
            response.setStatus(HttpServletResponse.SC_FORBIDDEN);
        }
    }
}
