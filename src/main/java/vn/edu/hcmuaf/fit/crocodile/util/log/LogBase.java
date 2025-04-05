package vn.edu.hcmuaf.fit.crocodile.util.log;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.slf4j.MDC;

public abstract class LogBase {
    private final Logger logger;
    private final String category;
    // mapped key
    public static String CATEGORY = "category";
    public static String KEY1 = "key1";
    public static String KEY2 = "key2";
    public static String KEY3 = "key3";
    public static String VALUE1 = "value1";
    public static String VALUE2 = "value2";
    public static String VALUE3 = "value3";
    // mapped value
    public static String USERID = "UserID";
    public static String USERNAME = "Username";
    public static String IP = "IP";
    // level
    public static int TRACE = 1;
    public static int DEBUG = 2;
    public static int INFO = 3;
    public static int WARN = 4;
    public static int ERROR = 5;

    protected LogBase(Class<?> clazz, String category) {
        this.logger = LoggerFactory.getLogger(clazz);
        this.category = category;
    }

    protected void log(String userId, String username, String ipAddress, String message, int level) {
        MDC.put(CATEGORY, this.category);
        MDC.put(KEY1, USERID);
        MDC.put(VALUE1, userId);
        MDC.put(KEY2, USERNAME);
        MDC.put(VALUE2, username);
        MDC.put(KEY3, IP);
        MDC.put(VALUE3, ipAddress);

        if(level == TRACE) logger.trace(message);
        else if(level == DEBUG) logger.debug(message);
        else if(level == INFO) logger.info(message);
        else if(level == WARN) logger.warn(message);
        else if(level == ERROR) logger.error(message);
        MDC.clear();
    }
}
