package vn.edu.hcmuaf.fit.crocodile.dao.rolepermission;

import vn.edu.hcmuaf.fit.crocodile.config.JdbiConnect;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Role;

import java.util.Arrays;
import java.util.List;
import java.util.Set;
import java.util.TreeMap;
import java.util.stream.Collectors;

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

    @Override
    public String getRoleName(int roleId) {
        String query = "SELECT name FROM roles WHERE id=:roleId";
        return JdbiConnect.getJdbi().withHandle(handle -> handle
                .createQuery(query)
                .bind("roleId", roleId)
                .mapTo(String.class)
                .findFirst()
                .orElse(null)
        );
    }

    @Override
    public TreeMap<String, List<String>> getAllPermissionMap() {
        String query = """
                SELECT
                  scope,
                  GROUP_CONCAT(DISTINCT action ORDER BY action ASC) AS actions
                FROM permissions
                GROUP BY scope
                ORDER BY scope
                """;

        return JdbiConnect.getJdbi().withHandle(handle -> handle
                .createQuery(query)
                .mapToMap()
                .list()
                .stream()
                .collect(Collectors.toMap(
                        row -> (String) row.get("scope"),
                        row -> Arrays.asList(((String) row.get("actions")).split(",")),
                        (existing, replacement) -> existing,
                        TreeMap::new // Dùng TreeMap để giữ thứ tự
                ))
        );
    }

    @Override
    public TreeMap<String, List<String>> getAllCheckedPermissionMap(int roleId) {
        String query = """
                SELECT
                  p.scope,
                  GROUP_CONCAT(DISTINCT p.action ORDER BY p.action ASC) AS actions
                FROM permissions p
                JOIN roles_permissions rp ON p.id = rp.idPermission
                WHERE rp.idRole = :roleId
                GROUP BY p.scope
                ORDER BY p.scope
                """;

        return JdbiConnect.getJdbi().withHandle(handle -> handle
                .createQuery(query)
                .bind("roleId", roleId)
                .reduceRows(new TreeMap<>(), (map, rowView) -> {
                    String scope = rowView.getColumn("scope", String.class);
                    String actionsStr = rowView.getColumn("actions", String.class);
                    List<String> actions = Arrays.asList(actionsStr.split(","));
                    map.put(scope, actions);
                    return map;
                })
        );
    }

    @Override
    public TreeMap<String, List<Permission>> getCheckedPermissionsMap(int roleId) {
        String query = """
                SELECT
                  p.id AS id,
                  p.name as name,
                  p.scope AS scope,
                  p.action AS action
                FROM permissions p
                JOIN roles_permissions rp ON p.id = rp.idPermission
                WHERE rp.idRole = :roleId
                ORDER BY p.scope, p.action
                """;

        return JdbiConnect.getJdbi().withHandle(handle -> handle
                .createQuery(query)
                .bind("roleId", roleId)
                .mapToBean(Permission.class)
                .stream()
                .collect(Collectors.groupingBy(
                        Permission::getScope,
                        TreeMap::new,
                        Collectors.toList()
                ))
        );
    }

    @Override
    public TreeMap<String, List<Permission>> getAllPermissionsMap() {
        String query = """
                    SELECT id, name, scope, action
                    FROM permissions
                    ORDER BY scope ASC, action ASC
                """;

        return JdbiConnect.getJdbi().withHandle(handle -> handle
                .createQuery(query)
                .mapToBean(Permission.class)
                .stream()
                .collect(Collectors.groupingBy(
                        Permission::getScope,
                        TreeMap::new, // preserve order by scope
                        Collectors.toList()
                ))
        );
    }

    @Override
    public List<Role> getAllRoles() {
        String query = """
                SELECT id, name, description
                FROM roles
                ORDER BY name
                """;
        return JdbiConnect.getJdbi().withHandle(handle -> handle
                .createQuery(query)
                .mapToBean(Role.class)
                .list()
        );
    }

    @Override
    public List<RoleTotalUsersDTO> getAllRoleTotalUsers() {
        String query = """
                SELECT r.id, r.`name`, COUNT(u.id) AS totalUsers
                FROM roles r
                LEFT JOIN users u ON r.id = u.role
                GROUP BY r.id
                ORDER BY r.`name`
                """;
        return JdbiConnect.getJdbi().withHandle(handle -> handle
                .createQuery(query)
                .mapToBean(RoleTotalUsersDTO.class)
                .list()
        );
    }
}
