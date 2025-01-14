package vn.edu.hcmuaf.fit.crocodile.model.entity;

import java.io.Serializable;
import java.time.LocalDateTime;

public class Token implements Serializable {
    public enum TokenType {
        RESET_PASSWORD,
        VERIFY_EMAIL,
        PAYMENT
    }

    private int id;
    private int idUser;
    private String token;
    private TokenType tokenType;
    private LocalDateTime createdAt;
    private LocalDateTime expiresAt;
    private int status;

    @Override
    public String toString() {
        return "Token{" +
                "id=" + id +
                ", idUser=" + idUser +
                ", token='" + token + '\'' +
                ", tokenType=" + tokenType +
                ", createdAt=" + createdAt +
                ", expiresAt=" + expiresAt +
                ", status=" + status +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public TokenType getTokenType() {
        return tokenType;
    }

    public void setTokenType(TokenType tokenType) {
        this.tokenType = tokenType;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public LocalDateTime getExpiresAt() {
        return expiresAt;
    }

    public void setExpiresAt(LocalDateTime expiresAt) {
        this.expiresAt = expiresAt;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}