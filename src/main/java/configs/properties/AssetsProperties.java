package configs.properties;

public class AssetsProperties extends ApplicationProperties {

    public static String baseDir(){
        return getProperty("assets");
    }

    public static String categoriesImageDir(){
        return getProperty("assets.images.categories");
    }

    public static String carouselsImageDir(){
        return getProperty("assets.images.carousels");
    }
}
