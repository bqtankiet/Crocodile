package vn.edu.hcmuaf.fit.crocodile.dao.rolepermission;

import vn.edu.hcmuaf.fit.crocodile.model.entity.Role;

import java.util.List;
import java.util.Set;

public interface IRolePermissionDAO {


    int getPermissionId(int idRole, String scope, String action);

    List<Role> getRolesByUserId(int idUser);

    boolean userHasPermission(int idUser, String scope, String action);

    Set<String> getAllPermissionNamesByUserId(int userId);
}
