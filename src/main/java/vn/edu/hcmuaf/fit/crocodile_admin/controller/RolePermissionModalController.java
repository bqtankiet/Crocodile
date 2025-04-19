package vn.edu.hcmuaf.fit.crocodile_admin.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.crocodile.dao.rolepermission.Permission;
import vn.edu.hcmuaf.fit.crocodile.dao.rolepermission.RolePermissionService;

import java.io.IOException;
import java.util.List;
import java.util.TreeMap;

@WebServlet(urlPatterns = "/admin/role-permission-modal")
public class RolePermissionModalController extends HttpServlet {
    private final RolePermissionService roleService = new RolePermissionService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int roleId = Integer.parseInt(req.getParameter("roleId"));
        String roleName = roleService.getRoleName(roleId);

        TreeMap<String, List<Permission>> allPermsMap = roleService.getAllPermissionsMap();
        TreeMap<String, List<Permission>> checkedPermsMap = roleId == 1 ? allPermsMap : roleService.getCheckedPermissionsMap(roleId);;

        req.setAttribute("roleName", roleName);
        req.setAttribute("allPermsMap", allPermsMap);
        req.setAttribute("checkedPermsMap", checkedPermsMap);
        req.getRequestDispatcher("/admin/views/contents/role-permission-modal.jsp").forward(req, resp);
    }
}
