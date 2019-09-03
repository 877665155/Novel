package com.xh.service;
import com.github.pagehelper.PageInfo;
import com.xh.dto.ResultData;
import com.xh.pojo.BookOrder;

import java.util.List;

public interface BookOrderService {
    ResultData add(BookOrder bookOrder);

//    page:当前页
//    pagesize:页容量
   PageInfo<BookOrder> list(Integer page, Integer pageSize);
   ResultData updateStatus(Integer id, int status);
//   批量删除
   ResultData batchDelete(String[] ids);

   ResultData delete(Integer orderid, Integer orderStatus);

   PageInfo<BookOrder> searchList(Integer page, Integer pageSize, String keyword);

   /**
    * 查询用户订单
    * @return
    */
   List<BookOrder> getAll(Integer readerId);

}
