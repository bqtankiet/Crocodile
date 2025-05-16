package vn.edu.hcmuaf.fit.crocodile_admin.filter;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.crocodile_admin.utils.PermissionHelper;

import java.io.IOException;

public abstract class AbstractPermissionFilter implements Filter {
    protected abstract String getPermissionKey();

    protected abstract String getAction();

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;

        System.out.println(request.getRequestURI());

        boolean haveAccess = PermissionHelper.checkPermission(request, getPermissionKey(), getAction());

        if (haveAccess) {
            chain.doFilter(req, res);
        } else {
            response.setStatus(HttpServletResponse.SC_FORBIDDEN);
        }
    }
}
