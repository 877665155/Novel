package com.xh.pojo;

public class BookDetail {

    private Integer picid;
    private String picAddress;
    private Integer bookId;
    private String bookBref;

    public BookDetail() {
    }

    public BookDetail(Integer picid, String picAddress, Integer bookId, String bookBref) {
        this.picid = picid;
        this.picAddress = picAddress;
        this.bookId = bookId;
        this.bookBref = bookBref;
    }

    public Integer getPicid() {
        return picid;
    }

    public void setPicid(Integer picid) {
        this.picid = picid;
    }

    public String getPicAddress() {
        return picAddress;
    }

    public void setPicAddress(String picAddress) {
        this.picAddress = picAddress;
    }

    public Integer getBookId() {
        return bookId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }

    public String getBookBref() {
        return bookBref;
    }

    public void setBookBref(String bookBref) {
        this.bookBref = bookBref;
    }
}
