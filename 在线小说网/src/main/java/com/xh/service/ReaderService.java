package com.xh.service;

import com.github.pagehelper.PageInfo;
import com.xh.dto.ResultData;
import com.xh.pojo.Reader;

public interface ReaderService {

    ResultData login1(Reader reader);
//    添加读者
    ResultData add(Reader reader);


    /**
     * 读者列表
     * @param page : 当前页
     * @param pageSize: 页容量
     * @return
     */
     PageInfo<Reader> list(Integer page, Integer pageSize);

    /**
     * 更新读者状态信息
     * @param readerId ：当前读者Id
     * @param readerStatus:当前读者状态信息
     * @return
     */
    ResultData updateStatus(Integer readerId, Integer readerStatus);

    /**
     * 通过id查找数据
     * @param readerId
     * @return
     */
    Reader findById(Integer readerId);

    /**
     * 更新读者基本信息
     * @param reader
     * @return
     */
    ResultData edit(Reader reader);

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
    PageInfo<Reader> searchList(Integer page, Integer pageSize, String keyword);


    /**
     * 删除读者信息
     * @param readerId
     * @param readerStatus
     * @return
     */
    ResultData deletereader(Integer readerId, Integer readerStatus);


    /**
     * 已删除读者列表
     * @param page : 当前页
     * @param pageSize: 页容量
     * @return
     */
    PageInfo<Reader> DeleteList(Integer page, Integer pageSize);
}

