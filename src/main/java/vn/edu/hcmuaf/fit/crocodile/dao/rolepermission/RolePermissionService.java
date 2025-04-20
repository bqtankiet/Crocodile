package vn.edu.hcmuaf.fit.crocodile.dao.rolepermission;

import vn.edu.hcmuaf.fit.crocodile.model.entity.Role;

import java.util.List;
import java.util.Set;
import java.util.TreeMap;

public class RolePermissionService {
    public static int ID_ADMIN = 1;
    public static int NO_PERMISSION = 0;


    private final IRolePermissionDAO permissionDAO;

    public RolePermissionService() {
        this.permissionDAO = new RolePermissionDAO();
    }

    public boolean hasPermission(int idRole, String scope, String action) {
        if (idRole == ID_ADMIN) return true;
        int permissionId = permissionDAO.getPermissionId(idRole, scope, action);
        return permissionId != NO_PERMISSION;
    }

    public boolean userHasPermission(int idUser, String scope, String action) {
        return permissionDAO.userHasPermission(idUser, scope, action);
    }

    public List<Role> getRolesByUserId(int idUser) {
        return permissionDAO.getRolesByUserId(idUser);
    }

    public Set<String> getAllPermissionNamesByUserId(int userId) {
        return permissionDAO.getAllPermissionNamesByUserId(userId);
    }

    public String getRoleName(int roleId) {
        return permissionDAO.getRoleName(roleId);
    }

    public TreeMap<String, List<String>> getAllPermissionMap() {
        return permissionDAO.getAllPermissionMap();
    }

    public TreeMap<String, List<String>> getAllCheckedPermissionMap(int roleId) {
        return permissionDAO.getAllCheckedPermissionMap(roleId);
    }

    public TreeMap<String, List<Permission>> getCheckedPermissionsMap(int roleId) {
        return permissionDAO.getCheckedPermissionsMap(roleId);
    }

    public TreeMap<String, List<Permission>> getAllPermissionsMap() {
        return permissionDAO.getAllPermissionsMap();
    }

    public List<Role> getAllRoles() {
        return permissionDAO.getAllRoles();
    }

    public List<RoleTotalUsersDTO> reportTotalUsersByRole() {
        return permissionDAO.getAllRoleTotalUsers();
    }

    public TreeMap<Integer, List<UserRoleDTO>> reportTop3UserByRole() {
        return permissionDAO.reportTop3UserByRole();
    }

    public void updatePermission(int roleId, List<Integer> permissions) {
        permissionDAO.updatePermissions(roleId, permissions);
    }

    public void updateRoleName(int roleId, String roleName) {
        permissionDAO.updateRoleName(roleId, roleName);
    }
}
