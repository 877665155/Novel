package com.xh.service.impl;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xh.dao.ChapterMapper;
import com.xh.dto.ResultData;
import com.xh.pojo.Chapter;
import com.xh.service.ChapterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.sql.Timestamp;
import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class)
public class ChapterServiceImpl implements ChapterService {
    @Autowired
    private ChapterMapper chapterMapper;


    //    添加
    @Override
    public ResultData add(Chapter chapter) {
        if (chapter == null) {
            return new ResultData(5001, "添加异常");
        }
        chapter.setUpdateTime(new Timestamp(System.currentTimeMillis()));
        try {
            if (chapterMapper.save(chapter)) {
                return new ResultData(200, "添加成功");
            }
        } catch (Exception e) {
            return new ResultData(5003, "添加章节已经存在");
        }
        return new ResultData(5002, "添加失败");
    }

    //列表
    @Override
    public PageInfo<Chapter> list(Integer page, Integer pageSize) {
        PageHelper.startPage(page,pageSize);
        List<Chapter> list = chapterMapper.findList();
        return new PageInfo<>(list);
    }

    @Override
    public Chapter findById(Integer chapterId) {
        return chapterMapper.findById(chapterId);
    }

//    更新
    @Override
    public ResultData edit(Chapter chapter) {
        if (chapter == null){
            return new ResultData(7001,"更新数据异常");
        }

        System.out.println("asfaffffa"+chapter.toString());
        if (chapterMapper.update(chapter)) {
            return new ResultData(200,"更新数据成功");
        }
        return new ResultData(7002,"更新失败");
    }

    @Override
    public PageInfo<Chapter> searchList(Integer page, Integer pageSize, String keyword) {
        PageHelper.startPage(page,pageSize);
        List<Chapter> list=chapterMapper.findByContent("%"+keyword+"%");
        return new PageInfo<>(list);
    }
    @Override
    public ResultData batchDelete(String[] ids) {
        if (ids.length == 0){
            return  new ResultData(8001,"批量删除数据异常");
        }
        if (chapterMapper.batchUpdateStatus(ids)) {
            return  new ResultData(200,"批量删除数据成功");
        }
        return  new ResultData(8002,"批量删除数据失败");
    }

    /**
     * 通过bookId查询
     * @param bookId
     * @return
     */
    @Override
    public List<Chapter> findByBookId(Integer bookId) {
        List<Chapter> chapterList = chapterMapper.findByBookId(bookId);
        return chapterList;
    }

    @Override
    public ResultData upload(MultipartFile file) {

        if(file.isEmpty()){
            return  new ResultData(9001,"文件数据异常");
        }

        //得到文件的名字
        String filename=file.getOriginalFilename();

        //文件保存的位置
        String basePath="C:\\Users\\ASUS\\Desktop\\好了\\好了\\huizong-8\\upload";

        //上传文件
        File uploadFile=new File(basePath,filename);

        try {

            InputStream in = file.getInputStream();
            BufferedReader br = new BufferedReader(new InputStreamReader(in,"gbk"));
            StringBuilder stringBuilder = new StringBuilder();
            String content = null;
            while((content = br.readLine()) != null) {
                stringBuilder.append(content);
            }
            System.out.println(stringBuilder);
            file.transferTo(uploadFile);
            return new ResultData(200,"上传成功", stringBuilder.toString());
        } catch (IOException e) {
            e.printStackTrace();
        }

        return new ResultData(9002,"文件上传失败");
    }
}

