package com.xh.pojo;
import java.sql.Timestamp;

public class RechargeOrder {
    private Integer rechargeId;
    private Integer userId;
    private Integer rechargeMoney;
    private Timestamp rechargeDate;
    private Integer rechargeStatus;
    private String rechargeWay;

    public RechargeOrder() {
    }

    public Integer getRechargeId() {
        return rechargeId;
    }

    public void setRechargeId(Integer rechargeId) {
        this.rechargeId = rechargeId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getRechargeMoney() {
        return rechargeMoney;
    }

    public void setRechargeMoney(Integer rechargeMoney) {
        this.rechargeMoney = rechargeMoney;
    }

    public Timestamp getRechargeDate() {
        return rechargeDate;
    }

    public void setRechargeDate(Timestamp rechargeDate) {
        this.rechargeDate = rechargeDate;
    }

    public Integer getRechargeStatus() {
        return rechargeStatus;
    }

    public void setRechargeStatus(Integer rechargeStatus) {
        this.rechargeStatus = rechargeStatus;
    }

    public String getRechargeWay() {
        return rechargeWay;
    }

    public void setRechargeWay(String rechargeWay) {
        this.rechargeWay = rechargeWay;
    }

    @Override
    public String toString() {
        return "RechargeOrder{" +
                "rechargeId=" + rechargeId +
                ", userId=" + userId +
                ", rechargeMoney=" + rechargeMoney +
                ", rechargeDate=" + rechargeDate +
                ", rechargeStatus=" + rechargeStatus +
                ", rechargeWay='" + rechargeWay + '\'' +
                '}';
    }
}