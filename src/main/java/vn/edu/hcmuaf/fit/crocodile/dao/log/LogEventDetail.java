package vn.edu.hcmuaf.fit.crocodile.dao.log;

import java.io.Serializable;

public class LogEventDetail implements Serializable {

    private int id;
    private int eventId;
    private String tableName;
    private int oldId;
    private int newId;
    private String action;

    public LogEventDetail() {}

    public LogEventDetail(int id, int eventId, String tableName, int oldId, int newId, String action) {}

    @Override
    public String toString() {
        return "LogEventDetail{" +
                "id=" + id +
                ", eventId=" + eventId +
                ", tableName='" + tableName + '\'' +
                ", oldId=" + oldId +
                ", newId=" + newId +
                ", action='" + action + '\'' +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getEventId() {
        return eventId;
    }

    public void setEventId(int eventId) {
        this.eventId = eventId;
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public int getOldId() {
        return oldId;
    }

    public void setOldId(int oldId) {
        this.oldId = oldId;
    }

    public int getNewId() {
        return newId;
    }

    public void setNewId(int newId) {
        this.newId = newId;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }
}
