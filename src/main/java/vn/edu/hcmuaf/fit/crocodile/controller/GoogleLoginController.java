package vn.edu.hcmuaf.fit.crocodile.controller;

import vn.edu.hcmuaf.fit.crocodile.constant.Iconstant;

import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;

import org.json.JSONObject;

public class GoogleLoginController {
    public static String getAccessToken(String authorizationCode) throws IOException {
        // 1. Tạo URL kết nối
        URL url = new URL(Iconstant.GOOGLE_LINK_GET_TOKEN);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("POST");
        connection.setDoOutput(true);
        connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
        // 2. Tạo nội dung yêu cầu
        String params = "code=" + authorizationCode
                + "&client_id=" + Iconstant.GOOGLE_CLIENT_ID
                + "&client_secret=" + Iconstant.GOOGLE_CLIENT_SECRET
                + "&redirect_uri=" + Iconstant.GOOGLE_REDIRECT_URI
                + "&grant_type=" + Iconstant.GOOGLE_GRANT_TYPE;
        // 3. Gửi yêu cầu
        try (OutputStream os = connection.getOutputStream()) {
            os.write(params.getBytes());
            os.flush();
        }
        // 4. Kiểm tra phản hồi từ Google
        int responseCode = connection.getResponseCode();
        if (responseCode == HttpURLConnection.HTTP_OK) {
            // 5. Đọc phản hồi
            try (Scanner scanner = new Scanner(connection.getInputStream())) {
                StringBuilder response = new StringBuilder();
                while (scanner.hasNextLine()) {
                    response.append(scanner.nextLine());
                }
                // 6. Giải mã JSON và lấy access token
                JSONObject jsonResponse = new JSONObject(response.toString());
                return jsonResponse.getString("access_token");
            }
        } else {
            throw new IOException("Error while getting access token. HTTP Code: " + responseCode);
        }
    }

    // Lấy thông tin người dùng từ Google
    public static String getUserInfo(String accessToken) throws IOException {
        URL url = new URL(Iconstant.GOOGLE_LINK_GET_USER_INFO + accessToken);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("GET");

        int responseCode = connection.getResponseCode();
        if (responseCode == HttpURLConnection.HTTP_OK) {
            try (Scanner scanner = new Scanner(connection.getInputStream())) {
                StringBuilder response = new StringBuilder();
                while (scanner.hasNextLine()) {
                    response.append(scanner.nextLine());
                }
                JSONObject jsonResponse = new JSONObject(response.toString());
                return jsonResponse.toString();
            }
        } else {
            throw new IOException("Error while getting user info. HTTP Code: " + responseCode);
        }
    }
}