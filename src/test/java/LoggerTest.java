import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import vn.edu.hcmuaf.fit.crocodile.dao.log.LogDAO;
import vn.edu.hcmuaf.fit.crocodile.service.LogService;
import vn.edu.hcmuaf.fit.crocodile.util.log.LogAuthentication;
import vn.edu.hcmuaf.fit.crocodile.util.log.LogDataChange;

public class LoggerTest {

    private static final Logger log = LoggerFactory.getLogger(LoggerTest.class);

    public static void main(String[] args) {
        LogAuthentication logAuthentication = new LogAuthentication();
        logAuthentication.logSpamSignIn("127.0.0.1");
        logAuthentication.logSpamSignIn("127.0.0.1");
        logAuthentication.logSpamSignIn("127.0.0.1");
        logAuthentication.logSpamSignIn("127.0.0.1");
        logAuthentication.logSpamSignIn("127.0.0.1");
        logAuthentication.logSpamSignIn("127.0.0.1");
        logAuthentication.logSpamSignIn("127.0.0.1");
        logAuthentication.logSpamSignIn("127.0.0.1");
        logAuthentication.logSpamSignIn("127.0.0.1");
        logAuthentication.logSpamSignIn("127.0.0.1");
        logAuthentication.logSpamSignIn("127.0.0.1");
        logAuthentication.logSpamSignIn("127.0.0.1");
        logAuthentication.logSpamSignIn("127.0.0.1");
        logAuthentication.logSpamSignIn("127.0.0.1");
        logAuthentication.logSpamSignIn("127.0.0.1");
        logAuthentication.logSpamSignIn("127.0.0.1");
        logAuthentication.logSpamSignIn("127.0.0.1");
        logAuthentication.logSpamSignIn("127.0.0.1");
    }

    @Test
    public void testReportLog() {
        LogService logService = new LogService(new LogDAO());
        logService.reportLogEvents().forEach(System.out::println);
    }

    @Test
    public void test() {
        LogDataChange logDataChange = new LogDataChange("Product");
//        logDataChange.logCreate("1", "test", "127.0.0.1", "products", 1000);
        logDataChange.logUpdate("2", "test", "127.0.0.1", "products", 1000, 1001);
        logDataChange.logDelete("2", "test", "127.0.0.1", "products", 1000);
    }

    @Test
    public void test2() {
        LogAuthentication logAuthentication = new LogAuthentication();
        logAuthentication.logSuccess("1", "test", "127.0.0.1", "admin");
    }
}
