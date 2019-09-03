package com.xh.pojo;

import java.sql.Timestamp;

public class Reader {
    private Integer readerId;
    private String  readerName;
    private String readerAge;
    private Integer readerSex;
    private String readerEmail;
    private Long readerPhone;
    private Timestamp readerAddTime;
    private Integer readerStatus;
    private Double balance;
    private String password;

    public Reader() {
    }

    public Integer getReaderId() {
        return readerId;
    }

    public void setReaderId(Integer readerId) {
        this.readerId = readerId;
    }

    public String getReaderName() {
        return readerName;
    }

    public void setReaderName(String readerName) {
        this.readerName = readerName;
    }

    public String getReaderAge() {
        return readerAge;
    }

    public void setReaderAge(String readerAge) {
        this.readerAge = readerAge;
    }

    public Integer getReaderSex() {
        return readerSex;
    }

    public void setReaderSex(Integer readerSex) {
        this.readerSex = readerSex;
    }

    public String getReaderEmail() {
        return readerEmail;
    }

    public void setReaderEmail(String readerEmail) {
        this.readerEmail = readerEmail;
    }

    public Long getReaderPhone() {
        return readerPhone;
    }

    public void setReaderPhone(Long readerPhone) {
        this.readerPhone = readerPhone;
    }

    public Timestamp getReaderAddTime() {
        return readerAddTime;
    }

    public void setReaderAddTime(Timestamp readerAddTime) {
        this.readerAddTime = readerAddTime;
    }

    public Integer getReaderStatus() {
        return readerStatus;
    }

    public void setReaderStatus(Integer readerStatus) {
        this.readerStatus = readerStatus;
    }

    public Double getBalance() {
        return balance;
    }

    public void setBalance(Double balance) {
        this.balance = balance;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "Reader{" +
                "readerId=" + readerId +
                ", readerName='" + readerName + '\'' +
                ", readerAge='" + readerAge + '\'' +
                ", readerSex=" + readerSex +
                ", readerEmail='" + readerEmail + '\'' +
                ", readerPhone=" + readerPhone +
                ", readerAddTime=" + readerAddTime +
                ", readerStatus=" + readerStatus +
                ", balance=" + balance +
                ", password='" + password + '\'' +
                '}';
    }
}
