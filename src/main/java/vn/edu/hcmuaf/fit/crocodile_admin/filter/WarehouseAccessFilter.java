package vn.edu.hcmuaf.fit.crocodile_admin.filter;

import jakarta.servlet.annotation.WebFilter;
import vn.edu.hcmuaf.fit.crocodile.dao.rolepermission.RolePermissionConst;

@WebFilter(urlPatterns = "/admin/warehouse-management/*")
public class WarehouseAccessFilter extends AbstractPermissionFilter{
    @Override
    protected String getPermissionKey() {
        return RolePermissionConst.WAREHOUSE_MANAGEMENT;
    }

    @Override
    protected String getAction() {
        return RolePermissionConst.READ;
    }
}
