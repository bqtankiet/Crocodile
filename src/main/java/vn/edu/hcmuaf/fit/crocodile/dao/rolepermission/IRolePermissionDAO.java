package vn.edu.hcmuaf.fit.crocodile.dao.rolepermission;

import vn.edu.hcmuaf.fit.crocodile.model.entity.Role;

import java.util.List;
import java.util.Set;
import java.util.TreeMap;

public interface IRolePermissionDAO {


    int getPermissionId(int idRole, String scope, String action);

    List<Role> getRolesByUserId(int idUser);

    boolean userHasPermission(int idUser, String scope, String action);

    Set<String> getAllPermissionNamesByUserId(int userId);

    String getRoleName(int roleId);

    TreeMap<String, List<String>> getAllPermissionMap();

    TreeMap<String, List<String>> getAllCheckedPermissionMap(int roleId);

    TreeMap<String, List<Permission>> getCheckedPermissionsMap(int roleId);

    TreeMap<String, List<Permission>> getAllPermissionsMap();

    List<Role> getAllRoles();

    List<RoleTotalUsersDTO> getAllRoleTotalUsers();
}
