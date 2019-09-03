package com.xh.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xh.dao.HistoryMapper;
import com.xh.dto.ResultData;
import com.xh.pojo.History;
import com.xh.service.HistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.List;


@Service
@Transactional(rollbackFor = Exception.class)
public class HistoryServiceImpl implements HistoryService {
    @Autowired
    private HistoryMapper historyMapper;

    @Override
    public ResultData add(History history) {
        if (history == null){
            return new ResultData(5001,"添加异常");
        }
        history.setHistoryTime(new Timestamp(System.currentTimeMillis()));
        try {
            if (historyMapper.save(history)) {
                return new ResultData(200, "添加成功");
            }
        } catch (Exception e) {
            return new ResultData(5003, "添加浏览记录已经存在");
        }
        return new ResultData(5002, "添加失败");

    }

    //列表
    @Override
    public PageInfo<History> list(Integer page, Integer pageSize) {
        PageHelper.startPage(page,pageSize);
        List<History> list =historyMapper.findList();
        return new PageInfo<>(list);
    }

    @Override
    public PageInfo<History> searchList(Integer page, Integer pageSize, String keyword) {
        PageHelper.startPage(page,pageSize);
        List<History> list=historyMapper.findByName("%"+keyword+"%");
        return new PageInfo<>(list);
    }

    @Override
    public ResultData batchDelete(String[] ids) {
        if (ids.length == 0){
            return  new ResultData(8001,"批量删除数据异常");
        }
        if (historyMapper.batchUpdateStatus(ids)) {
            return  new ResultData(200,"批量删除数据成功");
        }
        return  new ResultData(8002,"批量删除数据失败");
    }
}
