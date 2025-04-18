package vn.edu.hcmuaf.fit.crocodile.dao.rolepermission;

import vn.edu.hcmuaf.fit.crocodile.config.JdbiConnect;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Role;

import java.util.List;
import java.util.Set;

public class RolePermissionDAO implements IRolePermissionDAO {
    @Override
    public int getPermissionId(int idRole, String scope, String action) {
        String query = """
                SELECT p.id
                FROM roles_permissions rp
                JOIN permissions p ON rp.idPermission = p.id
                WHERE rp.idRole = :idRole
                AND LOWER(scope) = LOWER(:scope)
                AND LOWER(action) = LOWER(:action)
                """;
        return JdbiConnect.getJdbi().withHandle(handle -> handle
                .createQuery(query)
                .bind("idRole", idRole)
                .bind("scope", scope)
                .bind("action", action)
                .mapTo(Integer.class)
                .findFirst()
                .orElse(0)
        );
    }

    @Override
    public List<Role> getRolesByUserId(int idUser) {
        String query = """
                SELECT r.id, r.name, r.description
                FROM roles r
                WHERE r.id IN (
                    SELECT ur.idRole FROM users_roles ur WHERE ur.idUser = :idUser
                    UNION
                    SELECT id FROM roles WHERE name
                )
                OR (
                    r.name = 'guest' AND NOT EXISTS (
                        SELECT 1 FROM users_roles ur WHERE ur.idUser = :idUser
                    )
                );
                """;
        return JdbiConnect.getJdbi().withHandle(handle -> handle
                .createQuery(query)
                .bind("idUser", idUser)
                .mapToBean(Role.class)
                .list()
        );
    }

    @Override
    public boolean userHasPermission(int idUser, String scope, String action) {
        String query = """
                SELECT 1 AS permission
                FROM roles r
                LEFT JOIN roles_permissions rp ON r.id = rp.idRole
                LEFT JOIN permissions p ON rp.idPermission = p.id
                LEFT JOIN users u ON u.role = r.id
                WHERE u.id = :idUser
                  AND (
                    (p.scope = :scope AND p.action = :action)
                    OR r.`name` = "Admin"
                  );
                """;
        return JdbiConnect.getJdbi().withHandle(handle -> handle
                .createQuery(query)
                .bind("idUser", idUser)
                .bind("scope", scope)
                .bind("action", action)
                .mapTo(Boolean.class)
                .findFirst()
                .orElse(false)
        );
    }

    @Override
    public Set<String> getAllPermissionNamesByUserId(int userId) {
        String query = """
                SELECT p.`name`
                FROM permissions p
                WHERE
                    (SELECT u.role FROM users u WHERE u.id = :userId) = 1
                    OR p.id IN (
                        SELECT rp.idPermission
                        FROM roles_permissions rp
                        JOIN users u ON u.role = rp.idRole
                        WHERE u.id = :userId
                    );
                """;
        return JdbiConnect.getJdbi().withHandle(handle -> handle
                .createQuery(query)
                .bind("userId", userId)
                .mapTo(String.class)
                .set()
        );
    }
}
