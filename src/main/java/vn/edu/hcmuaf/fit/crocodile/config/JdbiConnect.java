package vn.edu.hcmuaf.fit.crocodile.config;

import com.mysql.cj.jdbc.MysqlDataSource;
import vn.edu.hcmuaf.fit.crocodile.config.properties.DBProperties;
import org.jdbi.v3.core.Jdbi;

import java.sql.SQLException;
import java.util.List;

public class JdbiConnect {
    private static final Jdbi JDBI;
    public static final String DATABASE_URL = "jdbc:mysql://" + DBProperties.host() + ":" + DBProperties.port() + "/" + DBProperties.dbname() + "?" + DBProperties.option();

    static {
        try {
            JDBI = createJdbi();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static Jdbi getJdbi() {
        return JDBI;
    }

    private static Jdbi createJdbi() throws SQLException {
        MysqlDataSource dataSource = new MysqlDataSource();
        dataSource.setServerName(DBProperties.host());
        dataSource.setPortNumber(DBProperties.port());
        dataSource.setUser(DBProperties.user());
        dataSource.setPassword(DBProperties.password());
        dataSource.setDatabaseName(DBProperties.dbname());
        dataSource.setUrl(DATABASE_URL);
        dataSource.setUseCompression(true);
        dataSource.setAutoReconnect(true);

        return Jdbi.create(dataSource);
    }

    // TEST
    public static void main(String[] args) {
        Jdbi jdbi = JdbiConnect.getJdbi();

        List<String> results = jdbi.withHandle(handle ->
            handle.createQuery("select name from categories")
                    .mapTo(String.class)
                    .list()
        );

        results.forEach(System.out::println);
    }
}
