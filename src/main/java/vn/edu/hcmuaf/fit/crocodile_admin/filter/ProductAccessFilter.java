package vn.edu.hcmuaf.fit.crocodile_admin.filter;

import jakarta.servlet.annotation.WebFilter;
import vn.edu.hcmuaf.fit.crocodile.dao.rolepermission.RolePermissionConst;

@WebFilter(urlPatterns = "/admin/product/*")
public class ProductAccessFilter extends AbstractPermissionFilter {

    @Override
    protected String getPermissionKey() {
        return RolePermissionConst.PRODUCT_MANAGEMENT;
    }

    @Override
    protected String getAction() {
        return RolePermissionConst.READ;
    }
}
