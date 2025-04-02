package vn.edu.hcmuaf.fit.crocodile.config.database;

import com.mysql.cj.jdbc.MysqlDataSource;
import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.crocodile.config.properties.DBLogsProperties;

import java.sql.SQLException;

public class CrocodileLogs {

    private static final Jdbi JDBI;
    public static final String DATABASE_URL = "jdbc:mysql://" + DBLogsProperties.host() + ":" + DBLogsProperties.port() + "/" + DBLogsProperties.dbname() + "?" + DBLogsProperties.option();

    static {
        try {
            JDBI = createJdbi();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static Jdbi getJdbiConnect() {
        return JDBI;
    }

    private static Jdbi createJdbi() throws SQLException {
        MysqlDataSource dataSource = new MysqlDataSource();
        dataSource.setServerName(DBLogsProperties.host());
        dataSource.setPortNumber(DBLogsProperties.port());
        dataSource.setUser(DBLogsProperties.user());
        dataSource.setPassword(DBLogsProperties.password());
        dataSource.setDatabaseName(DBLogsProperties.dbname());
        dataSource.setUrl(DATABASE_URL);
        dataSource.setUseCompression(true);
        dataSource.setAutoReconnect(true);

        return Jdbi.create(dataSource);
    }
}
