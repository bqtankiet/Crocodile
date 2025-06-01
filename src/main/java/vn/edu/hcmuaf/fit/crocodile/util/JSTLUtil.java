package vn.edu.hcmuaf.fit.crocodile.util;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class JSTLUtil {
    public static String formatLocalDateTime(LocalDateTime dateTime, String pattern) {
        if (dateTime == null) return "";
        return dateTime.format(DateTimeFormatter.ofPattern(pattern));
    }
}
