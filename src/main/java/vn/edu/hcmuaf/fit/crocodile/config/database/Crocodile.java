package vn.edu.hcmuaf.fit.crocodile.config.database;

import com.mysql.cj.jdbc.MysqlDataSource;
import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.crocodile.config.properties.DBProperties;

import java.sql.SQLException;

public class Crocodile {

    private static final Jdbi JDBI;
    public static final String DATABASE_URL = "jdbc:mysql://" + DBProperties.host() + ":" + DBProperties.port() + "/" + DBProperties.dbname() + "?" + DBProperties.option();

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

}
