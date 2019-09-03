package com.xh.service;

import com.github.pagehelper.PageInfo;
import com.xh.dto.ResultData;
import com.xh.pojo.Author;

public interface AuthorService {
    ResultData login2(Author author);

//    添加作者
    ResultData add(Author author);


    /**
     * 作者列表
     * @param page : 当前页
     * @param pageSize: 页容量
     * @return
     */
     PageInfo<Author> list(Integer page, Integer pageSize);

    /**
     * 更新作者状态信息
     * @param authorId ：当前作者Id
     * @param authorStatus:当前作者状态信息
     * @return
     */
    ResultData updateStatus(Integer authorId, Integer authorStatus);

    /**
     * 通过id查找数据
     * @param authorId
     * @return
     */
    Author findById(Integer authorId);

    /**
     * 更新作者基本信息
     * @param author
     * @return
     */
    ResultData edit(Author author);

    /**
     * 批量删除
     * @param ids
     * @return
     */
    ResultData batchDelete(String[] ids);

    /**
     * 批量恢复
     * @param ids
     * @return
     */
    ResultData huifuDelete(String[] ids);

    /**
     * 通过用户名查找
     * @param
     * @return
     */
    PageInfo<Author> searchList(Integer page, Integer pageSize, String keyword);


    /**
     * 删除作者信息
     * @param authorId
     * @param authorStatus
     * @return
     */
    ResultData deleteauthor(Integer authorId, Integer authorStatus);


    /**
     * 已删除作者列表
     * @param page : 当前页
     * @param pageSize: 页容量
     * @return
     */
    PageInfo<Author> DeleteList(Integer page, Integer pageSize);
}

