package vn.edu.hcmuaf.fit.crocodile.dao.log;

import com.mysql.cj.log.Log;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;

public class LogEvent implements Serializable {
    private int eventId;
    private String level;
    private LocalDateTime timestamp;
    private String category;
    private String userId;
    private String username;
    private String ip;
    private String message;

    public LogEvent(){}

    @Override
    public String toString() {
        return "LogEvent{" +
                "eventId=" + eventId +
                ", level='" + level + '\'' +
                ", timestamp=" + timestamp +
                ", category='" + category + '\'' +
                ", userId='" + userId + '\'' +
                ", username='" + username + '\'' +
                ", ip='" + ip + '\'' +
                ", message='" + message + '\'' +
                '}';
    }

    public int getEventId() {
        return eventId;
    }

    public void setEventId(int eventId) {
        this.eventId = eventId;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public LocalDateTime getTimestamp() {
        return timestamp;
    }

    public Date getTimestampDate(){
        return Date.from(timestamp.atZone(ZoneId.systemDefault()).toInstant());
    }


    public void setTimestamp(LocalDateTime timestamp) {
        this.timestamp = timestamp;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
