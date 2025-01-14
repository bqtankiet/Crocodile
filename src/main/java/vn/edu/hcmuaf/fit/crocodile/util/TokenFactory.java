package vn.edu.hcmuaf.fit.crocodile.util;

import vn.edu.hcmuaf.fit.crocodile.model.entity.Token;

import java.time.LocalDateTime;
import java.util.UUID;

public class TokenFactory {
    public static Token createResetPasswordToken(int idUser, LocalDateTime expiresAt) {
        Token token = new Token();
        token.setIdUser(idUser);
        token.setToken(UUID.randomUUID().toString());
        token.setTokenType(Token.TokenType.RESET_PASSWORD);
        token.setExpiresAt(expiresAt);
        token.setCreatedAt(LocalDateTime.now());
        token.setStatus(1);
        return token;
    }

    public static Token createVerifyAccountToken(int idUser, LocalDateTime expiresAt) {
        // TODO:
        return null;
    }

    public static Token createPaymoentToken(int idUser, LocalDateTime expiresAt) {
        // TODO:
        return null;
    }

    public static String generateToken() {
        return UUID.randomUUID().toString();
    }

    public static void main(String[] args) {
        Token token = TokenFactory.createResetPasswordToken(2, LocalDateTime.now().plusDays(1));
        System.out.println(token);
    }
}