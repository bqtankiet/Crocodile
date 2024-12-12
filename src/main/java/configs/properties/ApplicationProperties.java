package configs.properties;

import java.io.IOException;
import java.util.Properties;

public abstract class ApplicationProperties {

    protected static final Properties properties;

    static {
        properties = new Properties();
        try {
            properties.load(DBProperties.class.getClassLoader().getResourceAsStream("application.properties"));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static String getProperty(String key) {
        return properties.getProperty(key);
    }
}
