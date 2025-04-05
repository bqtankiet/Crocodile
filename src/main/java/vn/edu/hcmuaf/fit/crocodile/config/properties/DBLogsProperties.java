package vn.edu.hcmuaf.fit.crocodile.config.properties;

public class DBLogsProperties extends ApplicationProperties{

    public static String host() {
        return getProperty("dblog.host");
    }

    public static int port() {
        return Integer.parseInt(getProperty("dblog.port"));
    }

    public static String user() {
        return getProperty("dblog.user");
    }

    public static String password() {
        return getProperty("dblog.password");
    }

    public static String option() {
        return getProperty("dblog.option");
    }

    public static String dbname() {
        return getProperty("dblog.dbname");
    }

    // TEST
    public static void main(String[] args) {
        System.out.println(DBLogsProperties.host());
        System.out.println(DBLogsProperties.port());
        System.out.println(DBLogsProperties.user());
        System.out.println(DBLogsProperties.password());
        System.out.println(DBLogsProperties.dbname());
        System.out.println(DBLogsProperties.option());
    }

}
