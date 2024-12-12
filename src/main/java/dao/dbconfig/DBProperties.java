package dao.dbconfig;

import java.io.IOException;
import java.util.Properties;

public class DBProperties {

    private static final Properties properties;

    static {
        properties = new Properties();
        try {
            properties.load(DBProperties.class.getClassLoader().getResourceAsStream("db.properties"));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static String host() {
        return properties.get("db.host").toString();
    }

    public static int port() {
        return Integer.parseInt(properties.getProperty("db.port"));
    }

    public static String user() {
        return properties.getProperty("db.user");
    }

    public static String password() {
        return properties.getProperty("db.password");
    }

    public static String option() {
        return properties.getProperty("db.option");
    }

    public static String dbname() {
        return properties.getProperty("db.dbname");
    }

    // TEST
    public static void main(String[] args) {
        System.out.println(DBProperties.host());
        System.out.println(DBProperties.port());
        System.out.println(DBProperties.user());
        System.out.println(DBProperties.password());
        System.out.println(DBProperties.dbname());
        System.out.println(DBProperties.option());
    }
}