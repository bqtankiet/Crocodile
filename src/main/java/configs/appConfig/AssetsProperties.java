package configs.appConfig;

public class AssetsProperties extends ApplicationProperties{

    public static String categories_img(){
        return getProperty("categories_img");
    }

    public static String assets_dir(){
        return getProperty("assets_dir");
    }
}
