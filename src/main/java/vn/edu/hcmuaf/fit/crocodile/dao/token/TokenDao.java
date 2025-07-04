package vn.edu.hcmuaf.fit.crocodile.dao.token;

import vn.edu.hcmuaf.fit.crocodile.config.JdbiConnect;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Token;

import java.time.LocalDateTime;


public class TokenDao implements ITokenDao {
    @Override
    public Token findByToken(String token) {
        // TODO: Viết sql lấy token ở đây
        String sql = "SELECT * FROM tokens WHERE token=:token";
        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("token", token)
                        .mapToBean(Token.class)
                        .findFirst().orElse(null)
        );
//        return null;
    }

    @Override
    public int updateTokenStatus(String token, int status) {
        // TODO: viết sql update status của token ở đây
        String sql = "UPDATE tokens SET status=:status WHERE token=:token";
        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("status", status)
                        .bind("token", token)
                        .execute()
        );
    }

    public int insertToken(Token token) {
        String sql = """
            INSERT INTO tokens (idUser, token, tokenType, createAt, expiresAt, status)
            VALUES (:idUser, :token, :tokenType, :createdAt, :expiresAt, :status)
            """;
        return JdbiConnect.getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("idUser", token.getIdUser())
                        .bind("token", token.getToken())
                        .bind("tokenType", token.getTokenType().name()) // Chuyển enum thành chuỗi
                        .bind("createdAt", token.getCreatedAt() != null ? token.getCreatedAt() : LocalDateTime.now())
                        .bind("expiresAt", token.getExpiresAt())
                        .bind("status", token.getStatus())
                        .executeAndReturnGeneratedKeys("id")
                        .mapTo(int.class)
                        .findFirst()
                        .orElse(-1)
        );
    }
}