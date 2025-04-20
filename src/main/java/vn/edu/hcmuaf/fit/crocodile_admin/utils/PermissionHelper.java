package vn.edu.hcmuaf.fit.crocodile_admin.utils;

import jakarta.servlet.http.HttpServletRequest;
import vn.edu.hcmuaf.fit.crocodile.dao.rolepermission.RolePermissionService;

public class PermissionHelper {

    public static boolean checkPermission(HttpServletRequest request, String scope, String action) {
        int userId = (int) request.getSession().getAttribute("userId");
        if(userId == 0) return false;
        RolePermissionService rolePermissionService = new RolePermissionService();
        return rolePermissionService.userHasPermission(userId, scope, action);
    }

}
