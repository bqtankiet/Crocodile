package vn.edu.hcmuaf.fit.crocodile.config.properties;

public class UrlProperties extends ApplicationProperties {

    public static String home() {
        return getProperty("url.home");
    }

    public static String about() {
        return getProperty("url.about");
    }

    public static String contact() {
        return getProperty("url.contact");
    }

    public static String productList() {
        return getProperty("url.productList");
    }

    public static String addToCart() {
        return getProperty("url.addToCart");
    }

    public static String cart() {return getProperty("url.cart");}

    public static String checkout() {return getProperty("url.checkout");}

    public static String login() {
        return getProperty("url.login");
    }

    public static String signup() {
        return getProperty("url.signup");
    }

    public static String productDetail() {return getProperty("url.productDetail");}

    public static String user() {
        return getProperty("url.user");
    }

    public static String forgetPassword() {
        return getProperty("url.forgetPassword");
    }

    public static String resetPassword() {
        return getProperty("url.resetPassword");
    }
}
