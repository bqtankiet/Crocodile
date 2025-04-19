import org.junit.jupiter.api.Test;
import vn.edu.hcmuaf.fit.crocodile.dao.rolepermission.Permission;
import vn.edu.hcmuaf.fit.crocodile.dao.rolepermission.RolePermissionConst;
import vn.edu.hcmuaf.fit.crocodile.dao.rolepermission.RolePermissionService;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Role;

import java.util.List;
import java.util.Set;
import java.util.TreeMap;

import static vn.edu.hcmuaf.fit.crocodile.dao.rolepermission.RolePermissionConst.READ;

public class PermissionTest {

    @Test
    public void test() {
        RolePermissionService service = new RolePermissionService();
        System.out.println(service.hasPermission(3, RolePermissionConst.PRODUCT_MANAGEMENT, READ));
    }

    @Test
    public void test2() {
        RolePermissionService service = new RolePermissionService();
        List< Role> roles = service.getRolesByUserId(15);
        for (Role role : roles) {
            System.out.println(role);
        }
    }

    @Test
    public void test3() {
        RolePermissionService service = new RolePermissionService();
        System.out.println(service.userHasPermission(1, "Admin Page", "access"));
    }

    @Test
    public void test4() {
        RolePermissionService service = new RolePermissionService();
        Set<String> permissions = service.getAllPermissionNamesByUserId(1);
        for (String permission : permissions) {
            System.out.println(permission);
        }
    }

    @Test
    public void test5() {
        RolePermissionService service = new RolePermissionService();
        TreeMap<String, List<Permission>> result = service.getAllPermissionsMap();
        result.forEach((scope, actions) -> {
            System.out.println("Scope: " + scope);
            System.out.println("Actions: " + actions);
        });
    }

    @Test
    public void test6() {
        RolePermissionService service = new RolePermissionService();
        List<Role> result = service.getAllRoles();
        result.forEach(System.out::println);
    }
}
