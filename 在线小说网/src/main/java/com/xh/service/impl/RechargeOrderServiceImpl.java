package com.xh.service.impl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xh.dao.RechargeOrderMapper;
import com.xh.pojo.RechargeOrder;
import com.xh.dto.ResultData;
import com.xh.service.RechargeOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.sql.Timestamp;
import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class)
public class RechargeOrderServiceImpl implements RechargeOrderService {
    @Autowired
    private RechargeOrderMapper rechargeOrderMapper;
    @Override
    public ResultData add(RechargeOrder rechargeorder) {
        if (rechargeorder == null) {
            return new ResultData(5001, "添加数据异常!");
        }

        rechargeorder.setRechargeStatus(2);
        rechargeorder.setRechargeDate(new Timestamp(System.currentTimeMillis()));
//        try {
            if (rechargeOrderMapper.save(rechargeorder)) {
                return new ResultData(200, "添加订单成功！");
            }
//        }catch (Exception e) {
            return new ResultData(5003,"订单已经存在!");
//        }
//        return new ResultData(5002, "添加订单失败！");
    }
    @Override
    public PageInfo<RechargeOrder> list(Integer page, Integer pageSize) {
        PageHelper.startPage(page,pageSize);
        List<RechargeOrder> list = rechargeOrderMapper.findList();
        return new PageInfo<>(list);
    }

    @Override
    public PageInfo<RechargeOrder> searchList(Integer page, Integer pageSize, String keyword) {
        PageHelper.startPage(page,pageSize);
        List<RechargeOrder> list = rechargeOrderMapper.findByUserId("%" + keyword + "%");
        return new PageInfo<>(list);
    }

    @Override
    public ResultData updateStatus(Integer id, int status) {
        if(id == null || id <= 0){
            return new ResultData(6001,"更新数据id异常");
        }
        if(status != 1 && status != 2 && status != 3){
            return new ResultData(6002,"状态数据不正确!");
        }
        if (rechargeOrderMapper.updateStatus(id,status)) {
            return new ResultData(200,"处理状态成功!");
        }

        return new ResultData(6003,"处理状态失败!");
    }

    @Override
//    批量删除 ids:id的数组
    public ResultData batchDelete(String[] ids) {
        rechargeOrderMapper.batchUpdateStatus(ids);
        if (ids.length==0){
            return  new ResultData(8001,"批量删除数据有异常！");

        }
        if (rechargeOrderMapper.batchUpdateStatus(ids)) {
            return  new ResultData(200,"删除数据成功！");

        }
        return new ResultData(8002,"删除数据失败");

    }

    @Override
    public  ResultData delete(Integer rechargeId,Integer rechargeStatus) {
        if (rechargeId == null || rechargeId < 0) {
            return new ResultData(7001,"删除数据异常");
        }
        if (rechargeOrderMapper.deleteById(rechargeId,rechargeStatus)){
            return  new ResultData(200,"删除数据成功");

        }
        return  new ResultData(7002,"删除数据失败");

    }



}
