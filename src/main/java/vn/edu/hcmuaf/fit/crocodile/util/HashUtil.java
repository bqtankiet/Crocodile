package vn.edu.hcmuaf.fit.crocodile.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.nio.charset.StandardCharsets;

public class HashUtil {

    public static String hashMD5(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] hashBytes = md.digest(input.getBytes(StandardCharsets.UTF_8));

            StringBuilder hexString = new StringBuilder();
            for (byte b : hashBytes) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("MD5 algorithm not available", e);
        }
    }

    public static void debugHash(String input, String expectedHash) {
        String actualHash = hashMD5(input);
        System.out.println("Input: " + input);
        System.out.println("Expected hash: " + expectedHash);
        System.out.println("Actual hash: " + actualHash);
        System.out.println("Match: " + actualHash.equals(expectedHash));
        System.out.println("---");
    }
}