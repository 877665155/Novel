package com.xh.pojo;

import java.sql.Timestamp;

public class Collect {
    private Integer collectId;
    private String bookName;
    private Timestamp collectDate;
    private String readerName;

    public Collect() {
    }

    public Integer getCollectId() {
        return collectId;
    }

    public void setCollectId(Integer collectId) {
        this.collectId = collectId;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public Timestamp getCollectDate() {
        return collectDate;
    }

    public void setCollectDate(Timestamp collectDate) {
        this.collectDate = collectDate;
    }

    public String getReaderName() {
        return readerName;
    }

    public void setReaderName(String readerName) {
        this.readerName = readerName;
    }

    @Override
    public String toString() {
        return "Collect{" +
                "collectId=" + collectId +
                ", bookName='" + bookName + '\'' +
                ", collectDate=" + collectDate +
                ", readerName='" + readerName + '\'' +
                '}';
    }
}
