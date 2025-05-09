package vn.edu.hcmuaf.fit.crocodile.util.log;

import vn.edu.hcmuaf.fit.crocodile.dao.log.LogDAO;
import vn.edu.hcmuaf.fit.crocodile.service.LogService;

public class LogDataChange extends LogBase{
    protected LogService logService;
    public static final String ACTION_UPDATE = "UPDATE";
    public static final String ACTION_DELETE = "DELETE";
    public static final String ACTION_CREATE = "CREATE";

    public LogDataChange(String category) {
        super(LogDataChange.class, category);
        this.logService = new LogService(new LogDAO());
    }

    public void logUpdate(String userId, String userName, String ip, String table, int oldId, int newId){
        String message = String.format("User '%s' (ID: %s) updated record in '%s' (ID: %d -> %d) from IP '%s'.",
                userName, userId, table, oldId, newId, ip);

        log(userId, userName, ip, message, LogBase.WARN);
        int lastEventId = logService.getLastLogEventId();
        logService.logDetail(lastEventId, table, oldId, newId, ACTION_UPDATE);
    }

    public void logDelete(String userId, String userName, String ip, String table, int deletedId) {
        String message = String.format("User '%s' (ID: %s) deleted record from '%s' (ID: %d) from IP '%s'.",
                userName, userId, table, deletedId, ip);

        log(userId, userName, ip, message, LogBase.ERROR);
        int lastEventId = logService.getLastLogEventId();
        logService.logDetail(lastEventId, table, deletedId, -1, ACTION_DELETE);  // -1 cho newId tức là bản ghi đã bị xóa
    }

    public void logCreate(String userId, String userName, String ip, String table, int newId) {
        String message = String.format("User '%s' (ID: %s) created new record in '%s' (ID: %d) from IP '%s'.",
                userName, userId, table, newId, ip);

        log(userId, userName, ip, message, LogBase.INFO);
        int lastEventId = logService.getLastLogEventId();
        logService.logDetail(lastEventId, table, -1, newId, ACTION_CREATE);  // -1 cho oldId tức là không có dữ liệu cũ
    }


}
