package com.xh.service;

import com.github.pagehelper.PageInfo;
import com.xh.dto.ResultData;
import com.xh.pojo.Message;

import java.util.List;

public interface MessageService {

//    添加留言
ResultData add(Message message);


//员工列表
PageInfo<Message> list(Integer page, Integer pageSize);

//通过Id查询数据
    Message findById(Integer messageId);

//更新留言信息
    ResultData edit(Message message);

    ResultData mesDelete(String[] ids);

//    通过书名查找
    PageInfo<Message> searchList(Integer page, Integer pageSize, String keyword);

    /**
     * 通过书籍id获取留言
     * @param bookId
     * @return
     */
    List<Message> findByBookId(Integer bookId);
}


