package vn.edu.hcmuaf.fit.crocodile.model.entity;

public class FaceBookUser {
    private String name;
    private String avatarUrl;

    // Constructor
    public FaceBookUser(String name, String avatarUrl) {
        this.name = name;
        this.avatarUrl = avatarUrl;
    }

    // Getters and Setters
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAvatarUrl() {
        return avatarUrl;
    }

    public void setAvatarUrl(String avatarUrl) {
        this.avatarUrl = avatarUrl;
    }
}
