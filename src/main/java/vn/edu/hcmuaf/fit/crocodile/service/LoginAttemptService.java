package vn.edu.hcmuaf.fit.crocodile.service;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class LoginAttemptService {
    private static final int MAX_ATTEMPTS = 5;
    private static final int LOCK_DURATION_MINUTES = 15;

    // Map để lưu trữ thông tin các lần thử đăng nhập thất bại
    // Key: username + "|" + IP, Value: LoginAttemptInfo
    private final Map<String, LoginAttemptInfo> failedAttempts = new ConcurrentHashMap<>();

    // Cleanup thread để xóa các record cũ
    private static final LoginAttemptService INSTANCE = new LoginAttemptService();

    static {
        // Chạy cleanup task mỗi 30 phút
        Thread cleanupThread = new Thread(() -> {
            while (true) {
                try {
                    Thread.sleep(30 * 60 * 1000); // 30 phút
                    INSTANCE.cleanupExpiredRecords();
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                    break;
                }
            }
        });
        cleanupThread.setDaemon(true);
        cleanupThread.start();
    }

    public static class LoginAttemptInfo {
        private int attemptCount;
        private LocalDateTime firstAttemptTime;
        private LocalDateTime lastAttemptTime;
        private LocalDateTime lockTime;
        private String lastUserAgent;

        public LoginAttemptInfo() {
            this.attemptCount = 0;
            this.firstAttemptTime = LocalDateTime.now();
            this.lastAttemptTime = LocalDateTime.now();
        }

        // Getters and setters
        public int getAttemptCount() { return attemptCount; }
        public void setAttemptCount(int attemptCount) { this.attemptCount = attemptCount; }

        public LocalDateTime getFirstAttemptTime() { return firstAttemptTime; }
        public void setFirstAttemptTime(LocalDateTime firstAttemptTime) { this.firstAttemptTime = firstAttemptTime; }

        public LocalDateTime getLastAttemptTime() { return lastAttemptTime; }
        public void setLastAttemptTime(LocalDateTime lastAttemptTime) { this.lastAttemptTime = lastAttemptTime; }

        public LocalDateTime getLockTime() { return lockTime; }
        public void setLockTime(LocalDateTime lockTime) { this.lockTime = lockTime; }

        public String getLastUserAgent() { return lastUserAgent; }
        public void setLastUserAgent(String lastUserAgent) { this.lastUserAgent = lastUserAgent; }
    }

    /**
     * Ghi nhận một lần thử đăng nhập thất bại
     * @param username Tên đăng nhập hoặc email
     * @param clientIP Địa chỉ IP của client
     * @param userAgent User agent của browser
     * @return Số lần thử thất bại hiện tại
     */
    public int recordFailedAttempt(String username, String clientIP, String userAgent) {
        String key = generateKey(username, clientIP);

        failedAttempts.compute(key, (k, attemptInfo) -> {
            if (attemptInfo == null) {
                attemptInfo = new LoginAttemptInfo();
            }

            attemptInfo.setAttemptCount(attemptInfo.getAttemptCount() + 1);
            attemptInfo.setLastAttemptTime(LocalDateTime.now());
            attemptInfo.setLastUserAgent(userAgent);

            // Nếu đạt đến giới hạn thất bại, khóa tài khoản
            if (attemptInfo.getAttemptCount() >= MAX_ATTEMPTS) {
                attemptInfo.setLockTime(LocalDateTime.now());
            }

            return attemptInfo;
        });

        return failedAttempts.get(key).getAttemptCount();
    }

    /**
     * Kiểm tra xem tài khoản có bị khóa không
     * @param username Tên đăng nhập hoặc email
     * @param clientIP Địa chỉ IP của client
     * @return true nếu tài khoản bị khóa
     */
    public boolean isAccountLocked(String username, String clientIP) {
        String key = generateKey(username, clientIP);
        LoginAttemptInfo attemptInfo = failedAttempts.get(key);

        if (attemptInfo == null || attemptInfo.getLockTime() == null) {
            return false;
        }

        // Kiểm tra xem thời gian khóa đã hết chưa
        LocalDateTime unlockTime = attemptInfo.getLockTime().plusMinutes(LOCK_DURATION_MINUTES);
        boolean isLocked = LocalDateTime.now().isBefore(unlockTime);

        // Nếu hết thời gian khóa, tự động reset
        if (!isLocked) {
            failedAttempts.remove(key);
        }

        return isLocked;
    }

    /**
     * Lấy thời gian còn lại của việc khóa (tính bằng milliseconds)
     * @param username Tên đăng nhập hoặc email
     * @param clientIP Địa chỉ IP của client
     * @return Thời gian còn lại tính bằng milliseconds, 0 nếu không bị khóa
     */
    public long getRemainingLockTime(String username, String clientIP) {
        String key = generateKey(username, clientIP);
        LoginAttemptInfo attemptInfo = failedAttempts.get(key);

        if (attemptInfo == null || attemptInfo.getLockTime() == null) {
            return 0;
        }

        LocalDateTime unlockTime = attemptInfo.getLockTime().plusMinutes(LOCK_DURATION_MINUTES);
        LocalDateTime now = LocalDateTime.now();

        if (now.isBefore(unlockTime)) {
            return ChronoUnit.MILLIS.between(now, unlockTime);
        }

        return 0;
    }

    /**
     * Reset các lần thử thất bại khi đăng nhập thành công
     * @param username Tên đăng nhập hoặc email
     * @param clientIP Địa chỉ IP của client
     */
    public void resetFailedAttempts(String username, String clientIP) {
        String key = generateKey(username, clientIP);
        failedAttempts.remove(key);
    }

    /**
     * Lấy thông tin các lần thử đăng nhập thất bại
     * @param username Tên đăng nhập hoặc email
     * @param clientIP Địa chỉ IP của client
     * @return LoginAttemptInfo hoặc null nếu không có
     */
    public LoginAttemptInfo getAttemptInfo(String username, String clientIP) {
        String key = generateKey(username, clientIP);
        return failedAttempts.get(key);
    }

    /**
     * Tạo key để lưu trữ thông tin attempts
     * @param username Tên đăng nhập
     * @param clientIP Địa chỉ IP
     * @return Key string
     */
    private String generateKey(String username, String clientIP) {
        return (username != null ? username.toLowerCase() : "") + "|" +
                (clientIP != null ? clientIP : "unknown");
    }

    /**
     * Cleanup các record đã hết hạn để tránh memory leak
     */
    private void cleanupExpiredRecords() {
        LocalDateTime cutoffTime = LocalDateTime.now().minusHours(24); // Xóa record cũ hơn 24 giờ

        failedAttempts.entrySet().removeIf(entry -> {
            LoginAttemptInfo info = entry.getValue();
            return info.getLastAttemptTime().isBefore(cutoffTime);
        });

        System.out.println("LoginAttemptService: Cleaned up expired records. Current size: " + failedAttempts.size());
    }

    /**
     * Lấy tổng số record hiện tại (để debug/monitoring)
     * @return Số lượng record
     */
    public int getCurrentRecordCount() {
        return failedAttempts.size();
    }
}