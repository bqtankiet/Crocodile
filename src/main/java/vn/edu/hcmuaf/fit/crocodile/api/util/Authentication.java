package vn.edu.hcmuaf.fit.crocodile.api.util;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public class Authentication {

    public int authenticate(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            return -1;
        }
        return Integer.parseInt(session.getAttribute("userId").toString());
    }

}
