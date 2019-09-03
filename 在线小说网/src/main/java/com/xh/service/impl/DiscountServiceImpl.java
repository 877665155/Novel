package com.xh.service.impl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xh.dao.DiscountMapper;
import com.xh.pojo.Discount;
import com.xh.dto.ResultData;
import com.xh.service.DiscountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.sql.Timestamp;
import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class)
public class DiscountServiceImpl implements DiscountService{
    @Autowired
    private DiscountMapper discountMapper;

    @Override
    public ResultData add(Discount discount) {
        if (discount == null) {
            return new ResultData(5001, "添加数据异常!");
        }
        discount.setActId(1);
        discount.setActStatus(2);
        discount.setStartDate(new Timestamp(System.currentTimeMillis()));
        discount.setEndDate(new Timestamp(System.currentTimeMillis()+8000000));
        try {
            if (discountMapper.save(discount)) {
                return new ResultData(200, "添加活动成功！");
            }
        }catch (Exception e) {
            return new ResultData(5003,"订单已经存在!");
        }
        return new ResultData(5002, "添加订单失败！");
    }

    @Override
    public PageInfo<Discount> list(Integer page, Integer pageSize) {
        PageHelper.startPage(page,pageSize);
        List<Discount> list = discountMapper.findList();
        return new PageInfo<>(list);
    }


    @Override
    public PageInfo<Discount> searchList(Integer page, Integer pageSize, String keyword) {
        PageHelper.startPage(page,pageSize);
        List<Discount> list = discountMapper.findByactName("%" + keyword + "%");
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
        if (discountMapper.updateStatus(id,status)) {
            return new ResultData(200,"处理状态成功!");
        }

        return new ResultData(6003,"处理状态失败!");
    }


    @Override
//    批量删除 ids:id的数组
    public ResultData batchDelete(String[] ids) {
        discountMapper.batchUpdateStatus(ids);
        if (ids.length==0){
            return  new ResultData(8001,"批量删除数据有异常！");

        }
        if (discountMapper.batchUpdateStatus(ids)) {
            return  new ResultData(200,"删除数据成功！");

        }
        return new ResultData(8002,"删除数据失败");

    }
    @Override
    public  ResultData delete(Integer actId,Integer actStatus) {
        if (actId == null || actId < 0) {
            return new ResultData(7001,"删除数据异常");
        }
        if (discountMapper.deleteById(actId,actStatus)){
            return  new ResultData(200,"删除数据成功");

        }
        return  new ResultData(7002,"删除数据失败");

    }

    @Override
    public Discount findById(Integer id) {
        return discountMapper.findById(id);
    }

    @Override
    public ResultData edit(Discount discount) {
        if (discount == null) {
            return new ResultData(7001,"更新数据异常!");
        }

        Boolean update = discountMapper.update(discount);
        if (update) {
            return new ResultData(200,"更新数据成功!");
        }
        return new ResultData(7002,"更新失败");

    }
}

