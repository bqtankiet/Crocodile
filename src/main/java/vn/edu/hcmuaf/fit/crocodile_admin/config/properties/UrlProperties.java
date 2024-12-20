package vn.edu.hcmuaf.fit.crocodile_admin.config.properties;

import vn.edu.hcmuaf.fit.crocodile.config.properties.ApplicationProperties;

public class UrlProperties extends ApplicationProperties {

    public static String account() { return getProperty("admin.account"); }

    public static String category() { return getProperty("admin.category"); }

    public static String product() { return getProperty("admin.product"); }

    public static String order() { return getProperty("admin.order"); }

    public static String user() { return getProperty("admin.user"); }

    public static String delCate() { return getProperty("admin.category.delete"); }
}
