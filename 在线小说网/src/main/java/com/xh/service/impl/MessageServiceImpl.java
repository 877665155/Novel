package com.xh.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xh.dao.MessageMapper;
import com.xh.dto.ResultData;
import com.xh.pojo.Message;
import com.xh.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.List;


@Service
@Transactional(rollbackFor = Exception.class)
public class MessageServiceImpl implements MessageService {
    @Autowired
    private MessageMapper messageMapper;

    @Override
    public ResultData add(Message message) {
        if(message == null){
            return new ResultData(5001,"添加数据异常!");
        }

        message.setMessageDate(new Timestamp(System.currentTimeMillis()));


        // 保存到数据库

            if (messageMapper.save(message)) {
                return new ResultData(200,"添加留言成功!");
            }

        return new ResultData(5002,"添加留言失败!");
    }

//    员工列表
    @Override
    public PageInfo<Message> list(Integer page, Integer pageSize) {
        PageHelper.startPage(page,pageSize);
        List<Message> list=messageMapper.findAll();
        return new PageInfo<>(list);
    }

    @Override
    public Message findById(Integer messageId) {
        return messageMapper.findById(messageId);
    }
//更新留言信息
    @Override
    public ResultData edit(Message message) {
        if (message==null){
            return new ResultData(7001,"更新数据异常！");
        }
        if (messageMapper.update(message)){
            return new ResultData(200,"更新数据成功");
        }

        return new ResultData(7002,"更新失败");
    }


//    批量删除
    @Override
    public ResultData mesDelete(String[] ids) {
        if (ids.length==0){
            return  new ResultData(8001,"批量删除数据有异常！");
        }

        if (messageMapper.delete(ids)) {
            return new ResultData(200,"删除数据成功！");
        }
        return new ResultData(8002,"删除数据失败！");
    }



//    通过书名查找
    public PageInfo<Message> searchList(Integer page, Integer pageSize, String keyword){
        PageHelper.startPage(page,pageSize);
        List<Message> list=messageMapper.findName("%"+keyword+"%");
        return  new PageInfo<>(list);
    }

    @Override
    public List<Message> findByBookId(Integer bookId) {
        List<Message> messageList = messageMapper.findByBookId(bookId);
        return  messageList;
    }
}

