package com.xh.pojo;

import java.sql.Timestamp;

public class Chapter {
    private Integer chapterId;
    private Integer bookId;
    private String chapterName;
    private String chapterContent;
    private Integer chapterWordNumber;
    private Timestamp updateTime;

    public Integer getChapterId() {
        return chapterId;
    }

    public void setChapterId(Integer chapterId) {
        this.chapterId = chapterId;
    }

    public Integer getBookId() {
        return bookId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }

    public String getChapterName() {
        return chapterName;
    }

    public void setChapterName(String chapterName) {
        this.chapterName = chapterName;
    }

    public String getChapterContent() {
        return chapterContent;
    }

    public void setChapterContent(String chapterContent) {
        this.chapterContent = chapterContent;
    }

    public Integer getChapterWordNumber() {
        return chapterWordNumber;
    }

    public void setChapterWordNumber(Integer chapterWordNumber) {
        this.chapterWordNumber = chapterWordNumber;
    }

    public Timestamp getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Timestamp updateTime) {
        this.updateTime = updateTime;
    }

    public Chapter() {
    }

    @Override
    public String toString() {
        return "Chapter{" +
                "chapterId=" + chapterId +
                ", bookId=" + bookId +
                ", chapterName='" + chapterName + '\'' +
                ", chapterContent='" + chapterContent + '\'' +
                ", chapterWordNumber=" + chapterWordNumber +
                ", updateTime=" + updateTime +
                '}';
    }
}
