package com.xh.service;
import com.github.pagehelper.PageInfo;
import com.xh.dto.ResultData;
import com.xh.pojo.RechargeOrder;
public interface RechargeOrderService {
    ResultData add(RechargeOrder rechargeOrder);


    PageInfo<RechargeOrder> list(Integer page, Integer pageSize);
    ResultData updateStatus(Integer id, int status);
    //   批量删除
    ResultData batchDelete(String[] ids);

    ResultData delete(Integer rechargeId, Integer rechargeStatus);

//      通过用户Id查找
    PageInfo<RechargeOrder> searchList(Integer page, Integer pageSize, String keyword);
}
