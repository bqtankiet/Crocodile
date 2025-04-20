package vn.edu.hcmuaf.fit.crocodile_admin.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.crocodile.dao.rolepermission.RolePermissionService;
import vn.edu.hcmuaf.fit.crocodile.dao.rolepermission.RoleTotalUsersDTO;
import vn.edu.hcmuaf.fit.crocodile.dao.rolepermission.UserRoleDTO;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Role;

import java.io.IOException;
import java.util.List;
import java.util.TreeMap;

@WebServlet(urlPatterns = "/admin/role-permission")
public class RolePermissionController extends HttpServlet {
    private final RolePermissionService roleService = new RolePermissionService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Role> roles = roleService.getAllRoles();
        List<RoleTotalUsersDTO> totalUsersByRole = roleService.reportTotalUsersByRole();
        TreeMap<Integer, List<UserRoleDTO>> top3UsersByRole = roleService.reportTop3UserByRole();

        req.setAttribute("roles", roles);
        req.setAttribute("top3UsersByRole", top3UsersByRole);
        req.setAttribute("totalUsersByRole", totalUsersByRole);
        req.getRequestDispatcher("/admin/views/role-permission.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
