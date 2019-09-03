package com.xh.dao;

import com.xh.pojo.RechargeOrder;
import org.apache.ibatis.annotations.Param;
import java.util.List;

public interface RechargeOrderMapper {

    Boolean save(RechargeOrder rechargeOrder);

    List<RechargeOrder> findList();

    Boolean updateStatus(@Param("id") Integer id, @Param("status") Integer Status);
    //   批量更改状态（软删除）
    Boolean batchUpdateStatus(String[] ids);

    Boolean deleteById(@Param("rechargeId") Integer rechargeId, @Param("rechargeStatus") Integer rechargeStatus);

    /**
     * 通过用户id查找
     * @param userId
     * @return
     */
    List<RechargeOrder> findByUserId(String userId);

}