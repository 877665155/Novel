package com.xh.dao;

import com.xh.pojo.Message;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MessageMapper {
//  查询所有数据
    List<Message> findAll();

//    //模糊查询
//    Message findByName(String userName);

//    添加留言信息
    Boolean save(Message message);

//    通过ID查询数据
    Message findById(@Param("id") Integer id);


    //    更新留言信息
    Boolean update(Message message);


//    批量删除（软删除）
    Boolean delete(String[] ids);

    List<Message> findName(String bookName);

//    通过书籍id查询所有的留言
    List<Message> findByBookId(Integer bookId);
}
