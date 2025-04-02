import org.junit.jupiter.api.Test;
import vn.edu.hcmuaf.fit.crocodile.dao.log.LogDAO;
import vn.edu.hcmuaf.fit.crocodile.service.LogService;
import vn.edu.hcmuaf.fit.crocodile.util.log.LogAuthentication;

public class LoggerTest {

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
}
