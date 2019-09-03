package com.xh.dao;

import com.xh.pojo.BookOrder;
import javafx.scene.effect.Bloom;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookOrderMapper {
//   List<BookOrder> findAll();
   int save(BookOrder bookOrder);


   List<BookOrder> findList();
   Boolean updateStatus(@Param("id") Integer id, @Param("status") Integer Status);
//   批量更改状态（软删除）
   Boolean batchUpdateStatus(String[] ids);


   Boolean deleteById(@Param("orderid") Integer orderid, @Param("orderStatus") Integer orderStatus);

   /**
    * 通过用户id查找
    * @param userId
    * @return
    */
   List<BookOrder> findByUserId(String userId);


   /**
    * 通过readerId查找
    * @param readerId
    * @return
    */
   List<BookOrder> findByReaderId(@Param(value = "readerId") Integer readerId);

}
