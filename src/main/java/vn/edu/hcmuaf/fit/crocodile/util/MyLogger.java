package vn.edu.hcmuaf.fit.crocodile.util;

import jakarta.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Enumeration;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class MyLogger {

    private static final Logger logger;

    static {
        logger = LoggerFactory.getLogger(MyLogger.class);
    }

    public static void logAttribute(String name, String attributeName, Object attribute) {
        logger.info("[{}] attribute: {}={}", name, attributeName, attribute);
    }

    public static void logRequestAttributes(String servletName, HttpServletRequest request) {
        Enumeration<String> attributeNames = request.getAttributeNames();
        while (attributeNames.hasMoreElements()) {
            String attributeName = attributeNames.nextElement();
            Object attributeValue = request.getAttribute(attributeName);
            logger.info("[{}] attribute: {}={}", servletName, attributeName, attributeValue);
        }
    }

}
