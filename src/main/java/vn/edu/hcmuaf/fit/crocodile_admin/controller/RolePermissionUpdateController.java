package vn.edu.hcmuaf.fit.crocodile_admin.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.crocodile.dao.rolepermission.RolePermissionService;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@WebServlet(urlPatterns = "/admin/role-permission/update")
public class RolePermissionUpdateController extends HttpServlet {
    private final RolePermissionService roleService = new RolePermissionService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String roleNameParam = req.getParameter("roleName");
        String roleIdParam = req.getParameter("roleId");
        String[] permissionsParam = req.getParameterValues("permissions");

        int roleId;
        List<Integer> permissions;
        try {
            roleId = Integer.parseInt(roleIdParam);
            if(roleId == RolePermissionService.ID_ADMIN) {
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Cannot update role Admin");
                return;
            }
            permissions = Arrays.stream(permissionsParam).map(Integer::parseInt).toList();
            roleService.updateRoleName(roleId, roleNameParam);
            roleService.updatePermission(roleId, permissions);
            resp.setStatus(HttpServletResponse.SC_OK);
        } catch (Exception e) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Update failed");
        }
    }
}
