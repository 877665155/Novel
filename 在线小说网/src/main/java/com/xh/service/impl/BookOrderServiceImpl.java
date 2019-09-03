package com.xh.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xh.dao.BookOrderMapper;
import com.xh.pojo.BookOrder;
import com.xh.dto.ResultData;
import com.xh.service.BookOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class)
public class BookOrderServiceImpl implements BookOrderService {
    @Autowired
    private BookOrderMapper bookOrderMapper;

    @Override
    public ResultData add(BookOrder bookOrder) {
        if (bookOrder == null) {
            return new ResultData(5001, "添加数据异常!");
        }
        //bookOrder.setBookId(1);

        //bookOrder.setPayStatus(2);
       // bookOrder.setOrderDate(new Timestamp(System.currentTimeMillis()));

        int result = bookOrderMapper.save(bookOrder);
        if (result == 1) {
            return new ResultData(200, "添加订单成功！");
        }

        return new ResultData(5002, "添加订单失败！");
    }

    @Override
    public PageInfo<BookOrder> list(Integer page, Integer pageSize) {
        PageHelper.startPage(page, pageSize);
        List<BookOrder> list = bookOrderMapper.findList();
        return new PageInfo<>(list);
    }

    @Override
    public ResultData updateStatus(Integer id, int status) {
        if (id == null || id <= 0) {
            return new ResultData(6001, "更新数据id异常");
        }
        if (status != 1 && status != 2 && status != 3) {
            return new ResultData(6002, "状态数据不正确!");
        }
        if (bookOrderMapper.updateStatus(id, status)) {
            return new ResultData(200, "处理状态成功!");
        }

        return new ResultData(6003, "处理状态失败!");
    }


    @Override
//    批量删除 ids:id的数组
    public ResultData batchDelete(String[] ids) {
        bookOrderMapper.batchUpdateStatus(ids);
        if (ids.length == 0) {
            return new ResultData(8001, "批量删除数据有异常！");

        }
        if (bookOrderMapper.batchUpdateStatus(ids)) {
            return new ResultData(200, "删除数据成功！");

        }
        return new ResultData(8002, "删除数据失败");

    }

    @Override
    public ResultData delete(Integer orderid, Integer orderStatus) {
        if (orderid == null || orderid < 0) {
            return new ResultData(7001, "删除数据异常");
        }
        if (bookOrderMapper.deleteById(orderid, orderStatus)) {
            return new ResultData(200, "删除数据成功");

        }
        return new ResultData(7002, "删除数据失败");

    }

    @Override
    public PageInfo<BookOrder> searchList(Integer page, Integer pageSize, String keyword) {
        PageHelper.startPage(page, pageSize);
        List<BookOrder> list = bookOrderMapper.findByUserId("%" + keyword + "%");
        return new PageInfo<>(list);
    }

    @Override
    public List<BookOrder> getAll(Integer readerId) {
        List<BookOrder> bookOrderList = bookOrderMapper.findByReaderId(readerId);
        return bookOrderList;
    }
}

