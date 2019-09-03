package com.xh.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xh.dao.BookMapper;
import com.xh.dto.ResultData;
import com.xh.pojo.Book;
import com.xh.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class)
public class BookServiceImpl implements BookService {
    @Autowired
    private BookMapper bookMapper;


    //    添加
    @Override
    public ResultData add(Book book) {
        if (book == null){
            return new ResultData(5001,"添加异常");
        }
        book.setCondition(1);
        book.setReleaseTime(new Timestamp(System.currentTimeMillis()));

       try{
            if (bookMapper.save(book)){
                return new ResultData(200,"添加小说成功");
            }
        }catch(Exception e){
            return new ResultData(5003,"添加小说已经存在");
        }

        return new ResultData(5002,"添加小说失败");
    }


//列表
    @Override
    public PageInfo<Book> list(Integer page, Integer pageSize) {
        PageHelper.startPage(page,pageSize);
        List<Book> list = bookMapper.findList();
        return new PageInfo<>(list);
    }

//    更新状态
    @Override
    public ResultData updateStatus(Integer bookId, Integer condition) {
        if (bookId==null||bookId<=0){
            return new ResultData(6001,"更新数据ID异常");
        }
        if (condition!=1&&condition!=2&&condition!=3){
            return new ResultData(6002,"状态数据不正确");
        }
        if (bookMapper.updateStatus(bookId, condition)) {
            return new ResultData(200,"处理状态数据成功");
        }
        return new ResultData(6003,"处理状态数据失败");
    }

    @Override
    public Book findById(Integer bookId) {
        return bookMapper.findById(bookId);
    }

//    更新基本信息
    @Override
    public ResultData edit(Book book) {
        if (book==null){
            return new ResultData(7001,"更新数据异常");
        }
        if (bookMapper.update(book)) {
            return new ResultData(200,"更新数据成功");
        }
        return new ResultData(7002,"更新失败");
    }

//批量更改状态
    @Override
    public ResultData batchDelete(String[] ids) {
        if (ids.length == 0){
            return  new ResultData(8001,"批量删除数据异常");
        }
        if (bookMapper.batchUpdateStatus(ids)) {
            return  new ResultData(200,"批量删除数据成功");
        }
        return  new ResultData(8002,"批量删除数据失败");
    }
//search
    @Override
    public PageInfo<Book> searchList(Integer page, Integer pageSize, String keyword) {
        PageHelper.startPage(page,pageSize);
        List<Book> list=bookMapper.findByName("%"+keyword+"%");
        return new PageInfo<>(list);
    }

    @Override
    public PageInfo<Book> searchList1(Integer page, Integer pageSize, String keyword1) {
        PageHelper.startPage(page,pageSize);
        List<Book> list=bookMapper.findByAuthor("%"+keyword1+"%");
        return new PageInfo<>(list);
    }

    /**
     * 通过类型查询
     * @param bookType
     * @return
     */
    @Override
    public List<Book> findByType(Integer bookType) {
        List<Book> list = bookMapper.findByType(bookType);
        return list;
    }

    /**
     * 通过类型查询
     * @param
     * @return
     */
    @Override
    public List<Book> findRandList() {
        List<Book> list = bookMapper.findList();
        List<Book> bookList = new ArrayList<Book>();
        for(int i=0;i<6;i++){
            int rand = (int)((Math.random())*bookList.size());
            bookList.add(list.get(rand));
        }
        return bookList;
    }

    /**
     * 通过名称模糊查询
     * @return
     */
    @Override
    public List<Book> findByLikeName(String likeName) {
        List<Book> bookList = bookMapper.findByName(likeName);
        return bookList;
    }
}
