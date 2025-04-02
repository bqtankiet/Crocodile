import org.junit.jupiter.api.Test;
import vn.edu.hcmuaf.fit.crocodile.config.database.CrocodileLogs;

public class CrocodileLogsConnectionTest {

    @Test
    void testConnection() {
        CrocodileLogs.getJdbiConnect().withHandle(handle ->
                handle.createQuery("select level_string from logging_event")
                        .mapTo(String.class)
                        .findFirst().orElse(null)
        );
    }
}
