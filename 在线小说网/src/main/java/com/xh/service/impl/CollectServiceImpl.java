package com.xh.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xh.dao.CollectMapper;
import com.xh.pojo.Collect;
import com.xh.service.CollectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class)
public class CollectServiceImpl implements CollectService {
    @Autowired
    private CollectMapper collectMapper;



    /**
     * 读者列表
     * @param page : 当前页
     * @param pageSize: 页容量
     * @return
     */

    @Override
    public PageInfo<Collect> list(Integer page, Integer pageSize) {
        PageHelper.startPage(page,pageSize);
        List<Collect> list = collectMapper.findList();
        return new PageInfo<>(list);
    }

    @Override
    public PageInfo<Collect> searchList(Integer page, Integer pageSize, String keyword) {
        PageHelper.startPage(page,pageSize);
        List<Collect> list = collectMapper.findByName("%"+keyword+"%");
        return new PageInfo<>(list);

    }



}
