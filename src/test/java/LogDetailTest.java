import org.junit.jupiter.api.Test;
import vn.edu.hcmuaf.fit.crocodile.dao.log.LogDAO;
import vn.edu.hcmuaf.fit.crocodile.dao.log.LogEventDetail;
import vn.edu.hcmuaf.fit.crocodile.service.LogService;

public class LogDetailTest {

    @Test
    void test() {

        LogService logService = new LogService(new LogDAO());
        logService.getLogDetailWithOldNewDataByEventId(35).get(0).keySet().forEach(System.out::println);
//        logService.findOldAndNew("products",1, 2).get(0).keySet().forEach(System.out::println);

    }

    @Test
    void testLogEventDetail(){
        LogDAO logDAO = new LogDAO();
        LogEventDetail detail = logDAO.getLogDetailByEventId(35);
        System.out.println(detail);
    }
}
