package vn.edu.hcmuaf.fit.crocodile.dao.rolepermission;

import java.io.Serializable;

public class UserRoleDTO implements Serializable {

    private int id;
    private String fullName;
    private int role;
    private String roleName;

    @Override
    public String toString() {
        return "UserRoleDTO{" +
                "id=" + id +
                ", name='" + fullName + '\'' +
                ", role=" + role +
                ", roleName='" + roleName + '\'' +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String name) {
        this.fullName = name;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }
}
