package vn.edu.hcmuaf.fit.crocodile.model.entity;

public class GoogleUser {
    private String name;
    private String avatar;

    // Constructor
    public GoogleUser(String name, String avatar) {
        this.name = name;
        this.avatar = avatar;
    }

    // Getters and Setters
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
}
