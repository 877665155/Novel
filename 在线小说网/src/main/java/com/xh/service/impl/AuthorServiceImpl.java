package com.xh.service.impl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xh.dao.AuthorMapper;
import com.xh.dto.ResultData;
import com.xh.pojo.Author;
import com.xh.service.AuthorService;
import com.xh.utils.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class)
public class AuthorServiceImpl implements AuthorService {
    @Autowired
    private AuthorMapper authorMapper;


    @Override
    public ResultData login2(Author author){
        if(author == null){
            return new ResultData(4001,"登陆数据异常!");
        }
        if(author.getAuthorName()== null || author.getAuthorName().isEmpty()){
            return new ResultData(4002,"登陆用户名不能为空!");
        }
        if(author.getAuthorPwd() == null || author.getAuthorPwd().isEmpty()){
            return new ResultData(4003,"登陆密码不能为空!");
        }
        // 查询数据库
        Author dbAdmin = authorMapper.findByaName(author.getAuthorName());
        if(dbAdmin == null){
            return new ResultData(4004,"该用户不存在!");
        }
        // 验证密码
        if(!dbAdmin.getAuthorPwd().equals(MD5Util.MD55(author.getAuthorPwd()))){
            return new ResultData(4005,"密码不正确!");
        }
        return new ResultData(200,"登陆成功!",dbAdmin);
    }


    //    添加作者
    @Override
    public ResultData add(Author author) {
        if(author==null){
            return new ResultData(5001,"添加数据异常");
        }

//        数据填充
        author.setAuthorAddTime(new Timestamp(System.currentTimeMillis()));
        author.setAuthorStatus(1);


//        保存到数据库
        try{
            if(authorMapper.save(author)){
                return new ResultData(200,"添加数据成功！");
            }
        }catch (Exception e){
            return new ResultData(5003,"作者姓名或电话已经存在！");
        }

        return new ResultData(5002,"添加作者失败！");
    }

    /**
     * 作者列表
     * @param page : 当前页
     * @param pageSize: 页容量
     * @return
     */
    @Override
    public PageInfo<Author> list(Integer page, Integer pageSize) {
        PageHelper.startPage(page,pageSize);
        List<Author> list = authorMapper.findList();
        return new PageInfo<>(list);
    }
    /**
     * 更新作者状态信息
     * @param authorId : 当前作者Id
     * @param authorStatus: 作者当前状态
     * @return
     */
    @Override
    public ResultData updateStatus(Integer authorId, Integer authorStatus) {
        if(authorId==null || authorId<=0){
            return new ResultData(6001,"更新数据Id异常");
        }
        if(authorStatus!=1&&authorStatus!=2&&authorStatus!=3){
            return new ResultData(6002,"状态数据不正确");
        }
        if (authorMapper.updateStatus(authorId,authorStatus)) {
            return new ResultData(200,"状态处理成功");
        }

        return new ResultData(6003,"处理状态信息失败");
    }

    @Override
    public Author findById(Integer authorId) {
        return authorMapper.findById(authorId);
    }

    /**
     * 更新作者基本信息
     * @param author
     * @return
     */
    @Override
    public ResultData edit(Author author) {
        if(author==null){
            return new ResultData(7001,"更新数据异常！");
        }
        if (authorMapper.update(author)) {
            return new ResultData(200,"更新数据成功！");
        }
        return new ResultData(7002,"更新数据失败！");
    }


    /**
     * 批量删除
     * @param ids：authorId的数组
     * @return
     */
    @Override
    public ResultData batchDelete(String[] ids) {
        if(ids.length==0){
            return new ResultData(8001,"批量删除数据有异常！");
        }
        if (authorMapper.batchUpdateStatus(ids)){
            return new ResultData(200,"删除数据成功！");
        }
        return new ResultData(8002,"删除数据失败！");

    }

    /**
     * 批量恢复
     * @param ids：authorId的数组
     * @return
     */
    @Override
    public ResultData huifuDelete(String[] ids) {
        if(ids.length==0){
            return new ResultData(8001,"批量恢复数据有异常！");
        }
        if (authorMapper.deleteUpdateStatus(ids)){
            return new ResultData(200,"恢复数据成功！");
        }
        return new ResultData(8002,"恢复数据失败！");
    }

    @Override
    public PageInfo<Author> searchList(Integer page, Integer pageSize, String keyword) {
        PageHelper.startPage(page,pageSize);
        List<Author> list = authorMapper.findByName("%"+keyword+"%");
        return new PageInfo<>(list);

    }

    @Override
    public ResultData deleteauthor(Integer authorId, Integer authorStatus) {
        if(authorId==null|| authorId<0){
            return new ResultData(7001,"删除数据异常！");
        }
        if (authorMapper.deleteById(authorId,authorStatus)) {
            return new ResultData(200,"删除数据成功！");
        }

        return new ResultData(7002,"删除数据失败！");
    }


    /**
     * 作者列表
     * @param page : 当前页
     * @param pageSize: 页容量
     * @return
     */
    @Override
    public PageInfo<Author> DeleteList(Integer page, Integer pageSize) {
        PageHelper.startPage(page,pageSize);
        List<Author> list = authorMapper.findDeleteList();
        return new PageInfo<>(list);
    }
}
