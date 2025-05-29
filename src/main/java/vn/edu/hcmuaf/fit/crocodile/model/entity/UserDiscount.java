package vn.edu.hcmuaf.fit.crocodile.model.entity;

import vn.edu.hcmuaf.fit.crocodile.util.DateUtil;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;

public class UserDiscount implements Serializable {

    private int id;
    private int idUser;
    private int idDiscount;
    private LocalDateTime savedDate;
    private boolean isUsed;

    @Override
    public String toString() {
        return "UserDiscount{" +
                "id=" + id +
                ", idUser=" + idUser +
                ", idDiscount=" + idDiscount +
                ", savedDate=" + savedDate +
                ", isUsed=" + isUsed +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public int getIdDiscount() {
        return idDiscount;
    }

    public void setIdDiscount(int idDiscount) {
        this.idDiscount = idDiscount;
    }

    public LocalDateTime getSavedDate() {
        return savedDate;
    }

    public Date getSavedDateFmt() {
        return DateUtil.convertLocalDateTimeToDate(savedDate);
    }

    public void setSavedDate(LocalDateTime savedDate) {
        this.savedDate = savedDate;
    }

    public boolean isUsed() {
        return isUsed;
    }

    public void setUsed(boolean used) {
        isUsed = used;
    }
}
