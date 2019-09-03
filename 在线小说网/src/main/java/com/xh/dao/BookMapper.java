package com.xh.dao;

import com.xh.pojo.Book;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookMapper {
   // List<Book> findAll();
//    通过书名来查询书籍
   // Book findByName(String bookName);

// 保存数据
    Boolean save(Book book);
//查询数据
    List<Book> findList();
//更新小说状态
    Boolean updateStatus(@Param("bookId") Integer bookId, @Param("condition") Integer condition);
//过id查询数据
    Book findById(@Param("bookId") Integer bookId);
//更新
    Boolean update(Book book);
//批量更改状态
    Boolean batchUpdateStatus(String[] ids);

//    search
    List<Book> findByName(String bookName);
    List<Book> findByAuthor(String author);

    /**
     *
     * @param bookType
     * @return
     */
    List<Book> findByType(@Param(value = "bookType") Integer bookType);

}
