package vn.edu.hcmuaf.fit.crocodile.util.log;

public class LogAuthentication extends LogBase {
    public static final String CATEGORY = "Authentication";
    public static final String GUEST_ID = "-1";
    public static final String GUEST_NAME = "Guest";

    public LogAuthentication() {
        super(LogAuthentication.class, CATEGORY);
    }

    public void logSuccess(String userId, String userName, String ip, String role) {
        String message = "Login successfully with role " + role;
        log(userId, userName, ip, message, LogBase.INFO);
    }

    public void logFailure(String emailOrPhone, String ip) {
        String message = "Login failed; Failed password for " + emailOrPhone;
        log(GUEST_ID, GUEST_NAME, ip, message, LogBase.WARN);
    }

    public void logSpamSignIn(String ip) {
        String message = "User has been locked out due to multiple failed login attempts";
        log(GUEST_ID, GUEST_NAME, ip, message, LogBase.ERROR);
    }

    public void logResetPassword(String userId, String userName, String ip, String emailOrPhone) {
        String message = "User has requested a password reset using: " + emailOrPhone;
        log(GUEST_ID, GUEST_NAME, ip, message, LogBase.ERROR);
    }
}
