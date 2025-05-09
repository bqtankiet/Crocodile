package vn.edu.hcmuaf.fit.crocodile.dao.rolepermission;

import java.io.Serializable;

public class RoleTotalUsersDTO implements Serializable {

    private int id;
    private String name;
    private int totalUsers;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getTotalUsers() {
        return totalUsers;
    }

    public void setTotalUsers(int totalUsers) {
        this.totalUsers = totalUsers;
    }
}
