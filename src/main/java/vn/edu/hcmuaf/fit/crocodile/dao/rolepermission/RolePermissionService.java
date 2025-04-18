package vn.edu.hcmuaf.fit.crocodile.dao.rolepermission;

import vn.edu.hcmuaf.fit.crocodile.model.entity.Role;

import java.util.List;
import java.util.Set;

public class RolePermissionService {
    public static int ID_ADMIN = 1;
    public static int NO_PERMISSION = 0;


    private final IRolePermissionDAO permissionDAO;

    public RolePermissionService() {
        this.permissionDAO = new RolePermissionDAO();
    }

    public boolean hasPermission(int idRole, String scope, String action){
        if(idRole == ID_ADMIN) return true;
        int permissionId = permissionDAO.getPermissionId(idRole, scope, action);
        return permissionId != NO_PERMISSION;
    }

    public boolean userHasPermission(int idUser, String scope, String action){
        return permissionDAO.userHasPermission(idUser, scope, action);
    }

    public List<Role> getRolesByUserId(int idUser){
        return permissionDAO.getRolesByUserId(idUser);
    }

    public Set<String> getAllPermissionNamesByUserId(int userId) {
        return permissionDAO.getAllPermissionNamesByUserId(userId);
    }
}
