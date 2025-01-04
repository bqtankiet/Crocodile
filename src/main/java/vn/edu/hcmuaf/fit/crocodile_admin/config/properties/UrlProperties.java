package vn.edu.hcmuaf.fit.crocodile_admin.config.properties;

import vn.edu.hcmuaf.fit.crocodile.config.properties.ApplicationProperties;

public class UrlProperties extends ApplicationProperties {


    public static String account() { return getProperty("admin.account"); }

    public static String contact() { return getProperty("admin.contact"); }


    // --------------------- category --------------------
    public static String category() { return getProperty("admin.category"); }

    public static String deleteCate() { return getProperty("admin.category.delete"); }

    public static String insertCate() { return getProperty("admin.category.insert"); }

    public static String updateCate() { return getProperty("admin.category.update"); }
    // --------------------- category --------------------


    // --------------------- product ---------------------
    public static String product() { return getProperty("admin.product"); }

    public static String productCreate() { return getProperty("admin.product.insert"); }

    // --------------------- product ---------------------

    // --------------------- order -----------------------
    public static String order() { return getProperty("admin.order"); }

    // --------------------- order -----------------------

    // --------------------- user ------------------------
    public static String user() { return getProperty("admin.user"); }

    public static String deleteUser() { return getProperty("admin.user.delete"); }

    public static String insertUser() { return getProperty("admin.user.insert"); }

    public static String updateUser() { return getProperty("admin.user.update"); }
    // --------------------- user ------------------------






}
