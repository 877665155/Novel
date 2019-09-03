package com.xh.pojo;

import java.sql.Timestamp;

public class BookOrder {
    private Integer orderid;
    private Double orderPrice;
    private Timestamp orderDate;
    private  Integer  userId;
    private  Integer bookId;
    private  Integer discountId;
    private  Integer orderStatus;
    private  Integer payStatus;
    private  String payWay;


    private Book book;

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public BookOrder(){
    }

    public Integer getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(Integer orderStatus) {
        this.orderStatus = orderStatus;
    }

    public Integer getPayStatus() {
        return payStatus;
    }

    public void setPayStatus(Integer payStatus) {
        this.payStatus = payStatus;
    }

    public String getPayWay() {
        return payWay;
    }

    public void setPayWay(String payWay) {
        this.payWay = payWay;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getBookId() {
        return bookId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }

    public Integer getDiscountId() {
        return discountId;
    }

    public void setDiscountId(Integer discountId) {
        this.discountId = discountId;
    }

    public Integer getOrderid() {
        return orderid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }

    public Double getOrderPrice() {
        return orderPrice;
    }

    public void setOrderPrice(Double orderPrice) {
        this.orderPrice = orderPrice;
    }

    public Timestamp getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Timestamp orderDate) {
        this.orderDate = orderDate;
    }

    @Override
    public String toString() {
        return "BookOrder{" +
                "orderid=" + orderid +
                ", orderPrice=" + orderPrice +
                ", orderDate=" + orderDate +
                ", userId=" + userId +
                ", bookId=" + bookId +
                ", discountId=" + discountId +
                ", orderStatus=" + orderStatus +
                ", payStatus=" + payStatus +
                ", payWay=" + payWay +
                '}';
    }
}
