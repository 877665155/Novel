package com.xh.pojo;

import java.sql.Timestamp;

public class Admin {

    private Integer id;

    private String adminName;

    private String adminPwd;

    private Integer adminGender;

    private Long adminPhone;

    private Timestamp adminAddTime;

    private Integer adminStatus;

    private Integer adminType;

    public Admin() {
    }

    public Admin(String adminName, String adminPwd, Integer adminGender, Long adminPhone) {
        this.adminName = adminName;
        this.adminPwd = adminPwd;
        this.adminGender = adminGender;
        this.adminPhone = adminPhone;
    }

    public Integer getAdminGender() {
        return adminGender;
    }

    public void setAdminGender(Integer adminGender) {
        this.adminGender = adminGender;
    }

    public Long getAdminPhone() {
        return adminPhone;
    }

    public void setAdminPhone(Long adminPhone) {
        this.adminPhone = adminPhone;
    }

    public Timestamp getAdminAddTime() {
        return adminAddTime;
    }

    public void setAdminAddTime(Timestamp adminAddTime) {
        this.adminAddTime = adminAddTime;
    }

    public Integer getAdminStatus() {
        return adminStatus;
    }

    public void setAdminStatus(Integer adminStatus) {
        this.adminStatus = adminStatus;
    }

    public Integer getAdminType() {
        return adminType;
    }

    public void setAdminType(Integer adminType) {
        this.adminType = adminType;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    public String getAdminPwd() {
        return adminPwd;
    }

    public void setAdminPwd(String adminPwd) {
        this.adminPwd = adminPwd;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "id=" + id +
                ", adminName='" + adminName + '\'' +
                ", adminPwd='" + adminPwd + '\'' +
                ", adminGender=" + adminGender +
                ", adminPhone=" + adminPhone +
                ", adminAddTime=" + adminAddTime +
                ", adminStatus=" + adminStatus +
                ", adminType=" + adminType +
                '}';
    }
}
