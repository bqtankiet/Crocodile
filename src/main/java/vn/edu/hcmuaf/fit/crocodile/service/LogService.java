package vn.edu.hcmuaf.fit.crocodile.service;

import vn.edu.hcmuaf.fit.crocodile.dao.log.ILogDAO;
import vn.edu.hcmuaf.fit.crocodile.dao.log.LogEvent;

import java.util.List;

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
}
