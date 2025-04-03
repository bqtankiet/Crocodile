package vn.edu.hcmuaf.fit.crocodile.dao.log;

import java.util.List;

public interface ILogDAO {

    List<LogEvent> reportLogEvents();

    int getLastLogEventId();

    void logDetail(int lastEventId, String table, int oldId, int newId, String action);
}
