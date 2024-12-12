package configs.properties;

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

}
