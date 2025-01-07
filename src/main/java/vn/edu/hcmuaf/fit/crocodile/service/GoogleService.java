package vn.edu.hcmuaf.fit.crocodile.service;

import org.json.JSONObject;
import vn.edu.hcmuaf.fit.crocodile.util.HttpUtil;

public class GoogleService {

    private static final String CLIENT_ID = "183146911471-otedkdah3ihnpvc5fovddjsubn5ma5pn.apps.googleusercontent.com";
    private static final String CLIENT_SECRET = "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";
    private static final String REDIRECT_URI = "http://localhost:8080/crocodile/googlelogin";

    public static String getLoginUrl() {
        return "https://accounts.google.com/o/oauth2/v2/auth?" +
                "scope=openid profile email" +
                "&response_type=code" +
                "&redirect_uri=" + REDIRECT_URI +
                "&client_id=" + CLIENT_ID;
    }

    public static JSONObject getAccessToken(String code) throws Exception {
        String url = "https://oauth2.googleapis.com/token?" +
                "code=" + code +
                "&client_id=" + CLIENT_ID +
                "&client_secret=" + CLIENT_SECRET +
                "&redirect_uri=" + REDIRECT_URI +
                "&grant_type=authorization_code";

        String response = HttpUtil.sendGet(url);
        return new JSONObject(response);
    }

    public static JSONObject getUserProfile(String accessToken) throws Exception {
        String url = "https://www.googleapis.com/oauth2/v2/userinfo?access_token=" + accessToken;
        String response = HttpUtil.sendGet(url);
        return new JSONObject(response);
    }
}
