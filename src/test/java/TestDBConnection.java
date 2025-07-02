import org.jdbi.v3.core.Jdbi;
import org.junit.jupiter.api.Test;
import vn.edu.hcmuaf.fit.crocodile.config.JdbiConnect;
import vn.edu.hcmuaf.fit.crocodile.util.HashUtil;

import java.util.List;

public class TestDBConnection {

    @Test
    public void test() {
        Jdbi jdbi = JdbiConnect.getJdbi();

        List<String> results = jdbi.withHandle(handle ->
                handle.createQuery("select name from categories")
                        .mapTo(String.class)
                        .list()
        );

        results.forEach(System.out::println);
    }

    @Test
    public void test2() {
        System.out.println(HashUtil.hashMD5("developer"));
    }

}
