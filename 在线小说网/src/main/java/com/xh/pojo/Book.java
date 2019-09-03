package com.xh.pojo;

import java.sql.Timestamp;
import java.util.List;

public class Book {
    private Integer bookId;
    private String bookName;
    private Integer bookType;
    private String author;
    private Integer authorId;
    private Float bookPrice;
    private Timestamp releaseTime;
    private String updateSection;
    private String chapterNumber;
    private Integer condition;
    private Integer score;


    private Author author1;
    private List<Chapter> chapterList;
    private BookDetail bookDetail;

    public BookDetail getBookDetail() {
        return bookDetail;
    }

    public void setBookDetail(BookDetail bookDetail) {
        this.bookDetail = bookDetail;
    }

    public Author getAuthor1() {
        return author1;
    }

    public void setAuthor1(Author author1) {
        this.author1 = author1;
    }

    public List<Chapter> getChapterList() {
        return chapterList;
    }

    public void setChapterList(List<Chapter> chapterList) {
        this.chapterList = chapterList;
    }

    public Book() {
    }

    public Integer getBookId() {
        return bookId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
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

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Integer getAuthorId() {
        return authorId;
    }

    public void setAuthorId(Integer authorId) {
        this.authorId = authorId;
    }

    public Float getBookPrice() {
        return bookPrice;
    }

    public void setBookPrice(Float bookPrice) {
        this.bookPrice = bookPrice;
    }

    public Timestamp getReleaseTime() {
        return releaseTime;
    }

    public void setReleaseTime(Timestamp releaseTime) {
        this.releaseTime = releaseTime;
    }

    public String getUpdateSection() {
        return updateSection;
    }

    public void setUpdateSection(String updateSection) {
        this.updateSection = updateSection;
    }

    public String getChapterNumber() {
        return chapterNumber;
    }

    public void setChapterNumber(String chapterNumber) {
        this.chapterNumber = chapterNumber;
    }

    public Integer getCondition() {
        return condition;
    }

    public void setCondition(Integer condition) {
        this.condition = condition;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    @Override
    public String toString() {
        return "Book{" +
                "bookId=" + bookId +
                ", bookName='" + bookName + '\'' +
                ", bookType=" + bookType +
                ", author='" + author + '\'' +
                ", authorId=" + authorId +
                ", bookPrice=" + bookPrice +
                ", releaseTime=" + releaseTime +
                ", updateSection='" + updateSection + '\'' +
                ", chapterNumber='" + chapterNumber + '\'' +
                ", condition=" + condition +
                ", score=" + score +
                '}';
    }
}
