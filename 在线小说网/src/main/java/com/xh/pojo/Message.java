package com.xh.pojo;


import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;


public class Message {
    private Integer messageId;
    private String messageContent;
    private Date messageDate;
    private  Integer readerId;
    private  Integer bookId;

    private Reader reader;

    public Message(Integer messageId, String messageContent, Date messageDate, Integer readerId, Integer bookId) {
        this.messageId = messageId;
        this.messageContent = messageContent;
        this.messageDate = messageDate;
        this.readerId = readerId;
        this.bookId = bookId;
    }

    public Message(){
    }

    public Integer getMessageId() {
        return messageId;
    }

    public void setMessageId(Integer messageId) {
        this.messageId = messageId;
    }

    public String getMessageContent() {
        return messageContent;
    }

    public void setMessageContent(String messageContent) {
        this.messageContent = messageContent;
    }

    public Date getMessageDate() {
        return messageDate;
    }

    public void setMessageDate(Date messageDate) {
        this.messageDate = messageDate;
    }

    public Integer getReaderId() {
        return readerId;
    }

    public void setReaderId(Integer readerId) {
        this.readerId = readerId;
    }

    public Integer getBookId() {
        return bookId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }
}
