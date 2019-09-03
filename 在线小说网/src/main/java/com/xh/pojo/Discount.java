package com.xh.pojo;

import java.sql.Timestamp;

public class Discount {
    private Integer actId;
    private String actName;
    private Timestamp startDate;
    private Timestamp endDate;
    private Integer actStatus;

    public Discount() {

    }

    public Integer getActId() {
        return actId;
    }

    public void setActId(Integer actId) {
        this.actId = actId;
    }

    public String getActName() {
        return actName;
    }

    public void setActName(String actName) {
        this.actName = actName;
    }

    public Timestamp getStartDate() {
        return startDate;
    }

    public void setStartDate(Timestamp startDate) {
        this.startDate = startDate;
    }

    public Timestamp getEndDate() {
        return endDate;
    }

    public void setEndDate(Timestamp endDate) {
        this.endDate = endDate;
    }

    public Integer getActStatus() {
        return actStatus;
    }

    public void setActStatus(Integer actStatus) {
        this.actStatus = actStatus;
    }

    @Override
    public String toString() {
        return "Discount{" +
                "actId=" + actId +
                ", actName='" + actName + '\'' +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                ", actStatus=" + actStatus +
                '}';
    }
}