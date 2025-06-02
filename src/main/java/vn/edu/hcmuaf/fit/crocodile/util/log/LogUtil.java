package vn.edu.hcmuaf.fit.crocodile.util.log;

import jakarta.servlet.http.HttpServletRequest;

import java.net.InetAddress;
import java.net.UnknownHostException;

public class LogUtil {


    public static String getClientIp(HttpServletRequest request) {
        String header = request.getHeader("X-Forwarded-For");
        if (header != null && !header.isEmpty() && !"unknown".equalsIgnoreCase(header)) {
            return header.split(",")[0].trim();
        }

        String ip = request.getRemoteAddr();
        try {
            InetAddress inetAddress = InetAddress.getByName(ip);
            if (inetAddress instanceof java.net.Inet6Address) {
                if ("0:0:0:0:0:0:0:1".equals(ip)) {
                    return "127.0.0.1";
                }
            }
            return inetAddress.getHostAddress();
        } catch (UnknownHostException e) {
            return ip;
        }
    }

}
