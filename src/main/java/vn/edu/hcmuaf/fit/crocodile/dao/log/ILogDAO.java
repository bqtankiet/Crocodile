package vn.edu.hcmuaf.fit.crocodile.dao.log;

import java.util.List;
import java.util.Map;

public interface ILogDAO {

    List<LogEvent> reportLogEvents();

    int getLastLogEventId();

    void logDetail(int lastEventId, String table, int oldId, int newId, String action);

    List<Map<String, Object>> findOldAndNew (String tableName, int oldId, int newId);

    LogEventDetail getLogDetailByEventId(int eventId);
}
