package vn.edu.hcmuaf.fit.crocodile.model.entity;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;

public class OrderTracking implements Serializable {
    private int id;
    private int idOrder;
    private String status;
    private String location;
    private String note;
    private LocalDateTime updateAt;
    private String statusDescript;

    public OrderTracking() {
    }

    @Override
    public String toString() {
        return "OrderTracking{" +
                "id=" + id +
                ", idOrder=" + idOrder +
                ", status='" + status + '\'' +
                ", location='" + location + '\'' +
                ", note='" + note + '\'' +
                ", updateAt=" + updateAt +
                ", statusDescript='" + statusDescript + '\'' +
                '}';
    }

    public String getStatusDescript() {
        return statusDescript;
    }

    public void setStatusDescript(String statusDescript) {
        this.statusDescript = statusDescript;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdOrder() {
        return idOrder;
    }

    public void setIdOrder(int idOrder) {
        this.idOrder = idOrder;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public LocalDateTime getUpdateAt() {
        return updateAt;
    }

    public Date getUpdateAtDate(){
        return Date.from(updateAt.atZone(ZoneId.systemDefault()).toInstant());
    }

    public void setUpdateAt(LocalDateTime updateAt) {
        this.updateAt = updateAt;
    }
}
