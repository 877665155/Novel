package com.xh.service;

import com.github.pagehelper.PageInfo;
import com.xh.pojo.Collect;

public interface CollectService {

//
////    添加读者
//    ResultData add(Reader reader);


    /**
     * 收藏列表
     * @param page : 当前页
     * @param pageSize: 页容量
     * @return
     */
     PageInfo<Collect> list(Integer page, Integer pageSize);

    /**
     * 通过用户名查找
     * @param
     * @return
     */
    PageInfo<Collect> searchList(Integer page, Integer pageSize, String keyword);

}

