package configs.dbConfig;

import com.mysql.cj.jdbc.MysqlDataSource;
import org.jdbi.v3.core.Jdbi;

import java.sql.SQLException;
import java.util.List;

public class JdbiConnect {
    private static Jdbi jdbi;

    static {
        try {
            makeConnect();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static Jdbi getJdbi() {
        return jdbi;
    }

    private static void makeConnect() throws SQLException {
        MysqlDataSource dataSource = new MysqlDataSource();
        dataSource.setServerName(DBProperties.host());
        dataSource.setPortNumber(DBProperties.port());
        dataSource.setUser(DBProperties.user());
        dataSource.setPassword(DBProperties.password());
        dataSource.setDatabaseName(DBProperties.dbname());
        dataSource.setUrl("jdbc:mysql://" + DBProperties.host() + ":" + DBProperties.port() + "/" + DBProperties.dbname() + "?" + DBProperties.option());
        dataSource.setUseCompression(true);
        dataSource.setAutoReconnect(true);

        jdbi = Jdbi.create(dataSource);
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
