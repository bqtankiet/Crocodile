package vn.edu.hcmuaf.fit.crocodile_admin.filter;

import jakarta.servlet.annotation.WebFilter;
import vn.edu.hcmuaf.fit.crocodile.dao.rolepermission.RolePermissionConst;

@WebFilter(urlPatterns = "/admin/role-permission/*")
public class RoleAccessFilter extends AbstractPermissionFilter{
    @Override
    protected String getPermissionKey() {
        return RolePermissionConst.ROLE_MANAGEMENT;
    }

    @Override
    protected String getAction() {
        return RolePermissionConst.READ;
    }
}
