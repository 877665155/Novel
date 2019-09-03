package com.xh.pojo;

import java.sql.Timestamp;

public class History {
    private Integer historyId;
    private String readerName;
    private String bookName;
    private Integer bookType;
    private Timestamp historyTime;

    public Integer getHistoryId() {
        return historyId;
    }

    public void setHistoryId(Integer historyId) {
        this.historyId = historyId;
    }

    public String getReaderName() {
        return readerName;
    }

    public void setReaderName(String readerName) {
        this.readerName = readerName;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public Integer getBookType() {
        return bookType;
    }

    public void setBookType(Integer bookType) {
        this.bookType = bookType;
    }

    public Timestamp getHistoryTime() {
        return historyTime;
    }

    public void setHistoryTime(Timestamp historyTime) {
        this.historyTime = historyTime;
    }

    public History() {
    }

    @Override
    public String toString() {
        return "History{" +
                "historyId=" + historyId +
                ", readerName='" + readerName + '\'' +
                ", bookName='" + bookName + '\'' +
                ", bookType=" + bookType +
                ", historyTime=" + historyTime +
                '}';
    }
}
