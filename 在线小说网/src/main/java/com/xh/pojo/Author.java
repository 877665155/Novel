package com.xh.pojo;

import java.sql.Timestamp;

public class Author {
    private Integer authorId;
    private String authorName;
    private Integer authorSex;
    private long authorPhone;
    private String authorLogo;
    private String authorHobby;
    private String authorFeature;
    private Timestamp authorAddTime;
    private Integer authorStatus;
    private String authorPwd;

    public Author() {
    }

    public Integer getAuthorId() {
        return authorId;
    }

    public void setAuthorId(Integer authorId) {
        this.authorId = authorId;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    public Integer getAuthorSex() {
        return authorSex;
    }

    public void setAuthorSex(Integer authorSex) {
        this.authorSex = authorSex;
    }

    public long getAuthorPhone() {
        return authorPhone;
    }

    public void setAuthorPhone(long authorPhone) {
        this.authorPhone = authorPhone;
    }

    public String getAuthorLogo() {
        return authorLogo;
    }

    public void setAuthorLogo(String authorLogo) {
        this.authorLogo = authorLogo;
    }

    public String getAuthorHobby() {
        return authorHobby;
    }

    public void setAuthorHobby(String authorHobby) {
        this.authorHobby = authorHobby;
    }

    public String getAuthorFeature() {
        return authorFeature;
    }

    public void setAuthorFeature(String authorFeature) {
        this.authorFeature = authorFeature;
    }

    public Timestamp getAuthorAddTime() {
        return authorAddTime;
    }

    public void setAuthorAddTime(Timestamp authorAddTime) {
        this.authorAddTime = authorAddTime;
    }

    public Integer getAuthorStatus() {
        return authorStatus;
    }

    public void setAuthorStatus(Integer authorStatus) {
        this.authorStatus = authorStatus;
    }

    public String getAuthorPwd() {
        return authorPwd;
    }

    public void setAuthorPwd(String authorPwd) {
        this.authorPwd = authorPwd;
    }

    @Override
    public String toString() {
        return "Author{" +
                "authorId=" + authorId +
                ", authorName='" + authorName + '\'' +
                ", authorSex=" + authorSex +
                ", authorPhone=" + authorPhone +
                ", authorLogo='" + authorLogo + '\'' +
                ", authorHobby='" + authorHobby + '\'' +
                ", authorFeature='" + authorFeature + '\'' +
                ", authorAddTime=" + authorAddTime +
                ", authorStatus=" + authorStatus +
                ", authorPwd='" + authorPwd + '\'' +
                '}';
    }
}
