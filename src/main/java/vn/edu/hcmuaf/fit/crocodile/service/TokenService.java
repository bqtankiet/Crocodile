package vn.edu.hcmuaf.fit.crocodile.service;

import vn.edu.hcmuaf.fit.crocodile.dao.token.TokenDao;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Token;

public class TokenService {
    private final TokenDao tokenDao;

    public TokenService() {
        this.tokenDao = new TokenDao();
    }

    public Token getByToken(String token) {
        return tokenDao.findByToken(token);
    }

    public int updateTokenStatus(String token, int status) {
        return tokenDao.updateTokenStatus(token, status);
    }

    /**
     * Thêm token mới vào database và trả về id của nó.
     *
     * @param token {@link Token}
     * @return trả về id autoincreament của token mới được thêm vào
     */
    public void insertToken(Token token) {
        tokenDao.insertToken(token);
    }
}