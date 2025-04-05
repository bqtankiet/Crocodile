package vn.edu.hcmuaf.fit.crocodile.service;

import vn.edu.hcmuaf.fit.crocodile.dao.log.ILogDAO;
import vn.edu.hcmuaf.fit.crocodile.dao.log.LogEvent;
import vn.edu.hcmuaf.fit.crocodile.dao.log.LogEventDetail;

import java.util.List;
import java.util.Map;

public class LogService {

    private final ILogDAO logDAO;

    public LogService(ILogDAO logDAO) {
        this.logDAO = logDAO;
    }

    public List<LogEvent> reportLogEvents() {
        return logDAO.reportLogEvents();
    }

    public int getLastLogEventId() {
        return logDAO.getLastLogEventId();
    }

    public void logDetail(int lastEventId, String table, int oldId, int newId, String action) {
        logDAO.logDetail(lastEventId, table, oldId, newId, action);
    }

    public List<Map<String, Object>> findOldAndNew(String tableName, int oldId, int newId) {
        return logDAO.findOldAndNew(tableName, oldId, newId);
    }


    public List<Map<String, Object>> getLogDetailWithOldNewDataByEventId(int eventId) {
        LogEventDetail logEventDetail = logDAO.getLogDetailByEventId(eventId);
        if (logEventDetail == null) return null;
        return logDAO.findOldAndNew(logEventDetail.getTableName(), logEventDetail.getOldId(), logEventDetail.getNewId());
    }
}
