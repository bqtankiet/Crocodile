package vn.edu.hcmuaf.fit.crocodile.dao.token;

import vn.edu.hcmuaf.fit.crocodile.model.entity.Token;

public interface ITokenDao {
    Token findByToken(String token);

    int updateTokenStatus(String token, int status);

    int insertToken(Token token);
}