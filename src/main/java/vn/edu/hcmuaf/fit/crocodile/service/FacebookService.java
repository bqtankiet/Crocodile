package vn.edu.hcmuaf.fit.crocodile.service;

import org.json.JSONObject;
import vn.edu.hcmuaf.fit.crocodile.util.HttpUtil;

public class FacebookService {
    private static final String CLIENT_ID = "605632051831778";
    private static final String CLIENT_SECRET = "ec1618beb2a76ca2da77a840b4c27809";
    private static final String REDIRECT_URI = "http://localhost:8080/facebooklogin";
    private static final String AUTH_URL = "https://www.facebook.com/v16.0/dialog/oauth";
    private static final String TOKEN_URL = "https://graph.facebook.com/v16.0/oauth/access_token";
    private static final String USER_INFO_URL = "https://graph.facebook.com/me";

    public static String getLoginUrl() {
        return AUTH_URL + "?client_id=" + CLIENT_ID + "&redirect_uri=" + REDIRECT_URI + "&scope=email,public_profile";
    }

    public static JSONObject getAccessToken(String code) throws Exception {
        String url = TOKEN_URL
                + "?client_id=" + CLIENT_ID
                + "&redirect_uri=" + REDIRECT_URI
                + "&client_secret=" + CLIENT_SECRET
                + "&code=" + code;
        String response = HttpUtil.sendGet(url);
        return new JSONObject(response);
    }

    public static JSONObject getUserProfile(String accessToken) throws Exception {
        String url = USER_INFO_URL + "?fields=id,name,email,picture&access_token=" + accessToken;
        String response = HttpUtil.sendGet(url);
        return new JSONObject(response);
    }
}
