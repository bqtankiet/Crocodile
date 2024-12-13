package vn.edu.hcmuaf.fit.crocodile.config.properties;

public class DBProperties extends ApplicationProperties {

    public static String host() {
        return getProperty("db.host");
    }

    public static int port() {
        return Integer.parseInt(getProperty("db.port"));
    }

    public static String user() {
        return getProperty("db.user");
    }

    public static String password() {
        return getProperty("db.password");
    }

    public static String option() {
        return getProperty("db.option");
    }

    public static String dbname() {
        return getProperty("db.dbname");
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