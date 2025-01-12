package vn.edu.hcmuaf.fit.crocodile.config.properties;

public class UrlProperties extends ApplicationProperties{

    public static String home() {
        return getProperty("url.home");
    }

    public static String about() {
        return getProperty("url.about");
    }

    public static String contact() {
        return getProperty("url.contact");
    }

    public static String category() {
        return getProperty("url.category");
    }

    public static String addToCart() {return getProperty("url.addToCart");}

    public static String cart() {return getProperty("url.cart");}

    public static String checkout() {return getProperty("url.checkout");}

    public static String login(){ return  getProperty("url.login");}

    public static String signup(){ return  getProperty("url.signup");}

    public static String user(){ return  getProperty("url.user");}
}
