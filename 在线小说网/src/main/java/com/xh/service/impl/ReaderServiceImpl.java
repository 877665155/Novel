package com.xh.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xh.dao.ReaderMapper;
import com.xh.dto.ResultData;
import com.xh.pojo.Reader;
import com.xh.service.ReaderService;
import com.xh.utils.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class)
public class ReaderServiceImpl implements ReaderService {
    @Autowired
    private ReaderMapper readerMapper;

    @Override
    public ResultData login1(Reader reader){
        if(reader == null){
            return new ResultData(4001,"登陆数据异常!");
        }
        if(reader.getReaderName()== null || reader.getReaderName().isEmpty()){
            return new ResultData(4002,"登陆用户名不能为空!");
        }
        if(reader.getPassword() == null || reader.getPassword().isEmpty()){
            return new ResultData(4003,"登陆密码不能为空!");
        }
        // 查询数据库
        Reader dbAdmin = readerMapper.findByrName(reader.getReaderName());
        if(dbAdmin == null){
            return new ResultData(4004,"该用户不存在!");
        }
        // 验证密码
        if(!dbAdmin.getPassword().equals(MD5Util.MD55(reader.getPassword()))){
            return new ResultData(4005,"密码不正确!");
        }
        return new ResultData(200,"登陆成功!",dbAdmin);
    }



//    添加读者
    @Override
    public ResultData add(Reader reader) {
        if(reader==null){
            return new ResultData(5001,"添加数据异常");
        }

//        数据填充
        reader.setReaderAddTime(new Timestamp(System.currentTimeMillis()));
        reader.setReaderStatus(1);


//        保存到数据库
        try{
            if(readerMapper.save(reader)){
                return new ResultData(200,"添加数据成功！");
            }
        }catch (Exception e){
            return new ResultData(5003,"读者姓名或电话已经存在！");
        }

        return new ResultData(5002,"添加读者失败！");
    }

    /**
     * 读者列表
     * @param page : 当前页
     * @param pageSize: 页容量
     * @return
     */
    @Override
    public PageInfo<Reader> list(Integer page, Integer pageSize) {
        PageHelper.startPage(page,pageSize);
        List<Reader> list = readerMapper.findList();
        return new PageInfo<>(list);
    }
    /**
     * 更新读者状态信息
     * @param readerId : 当前读者Id
     * @param readerStatus: 读者当前状态
     * @return
     */
    @Override
    public ResultData updateStatus(Integer readerId, Integer readerStatus) {
        if(readerId==null || readerId<=0){
            return new ResultData(6001,"更新数据Id异常");
        }
        if(readerStatus!=1&&readerStatus!=2&&readerStatus!=3){
            return new ResultData(6002,"状态数据不正确");
        }
        if (readerMapper.updateStatus(readerId,readerStatus)) {
            return new ResultData(200,"状态处理成功");
        }

        return new ResultData(6003,"处理状态信息失败");
    }

    @Override
    public Reader findById(Integer readerId) {
        return readerMapper.findById(readerId);
    }

    /**
     * 更新读者基本信息
     * @param reader
     * @return
     */
    @Override
    public ResultData edit(Reader reader) {
        if(reader==null){
            return new ResultData(7001,"更新数据异常！");
        }
        if (readerMapper.update(reader)) {
            return new ResultData(200,"更新数据成功！");
        }
        return new ResultData(7002,"更新数据失败！");
    }


    /**
     * 批量删除
     * @param ids：readerId的数组
     * @return
     */
    @Override
    public ResultData batchDelete(String[] ids) {
        if(ids.length==0){
            return new ResultData(8001,"批量删除数据有异常！");
        }
        if (readerMapper.batchUpdateStatus(ids)){
            return new ResultData(200,"删除数据成功！");
        }
        return new ResultData(8002,"删除数据失败！");

    }

    /**
     * 批量恢复
     * @param ids：readerId的数组
     * @return
     */
    @Override
    public ResultData huifuDelete(String[] ids) {
        if(ids.length==0){
            return new ResultData(8001,"批量恢复数据有异常！");
        }
        if (readerMapper.deleteUpdateStatus(ids)){
            return new ResultData(200,"恢复数据成功！");
        }
        return new ResultData(8002,"恢复数据失败！");
    }

    @Override
    public PageInfo<Reader> searchList(Integer page, Integer pageSize, String keyword) {
        PageHelper.startPage(page,pageSize);
        List<Reader> list = readerMapper.findByName("%"+keyword+"%");
        return new PageInfo<>(list);

    }

    @Override
    public ResultData deletereader(Integer readerId, Integer readerStatus) {
        if(readerId==null|| readerId<0){
            return new ResultData(7001,"删除数据异常！");
        }
        if (readerMapper.deleteById(readerId,readerStatus)) {
            return new ResultData(200,"删除数据成功！");
        }

        return new ResultData(7002,"删除数据失败！");
    }


    /**
     * 读者列表
     * @param page : 当前页
     * @param pageSize: 页容量
     * @return
     */
    @Override
    public PageInfo<Reader> DeleteList(Integer page, Integer pageSize) {
        PageHelper.startPage(page,pageSize);
        List<Reader> list = readerMapper.findDeleteList();
        return new PageInfo<>(list);
    }
}
