package com.xh.service;

import com.github.pagehelper.PageInfo;
import com.xh.dto.ResultData;
import com.xh.pojo.Chapter;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface ChapterService {

    ////添加
    ResultData add(Chapter chapter);

    //小说列表
    PageInfo<Chapter> list(Integer page, Integer pageSize);

   //通过id查询数据
    Chapter findById(Integer chapterId);
    //更新
    ResultData edit(Chapter chapter);

    //    search
    PageInfo<Chapter> searchList(Integer page, Integer pageSize, String keyword);

    //    批量更改状态
    ResultData batchDelete(String[] ids);

    /**
     * 通过书的id查询
     * @param bookId
     * @return
     */
    List<Chapter> findByBookId(Integer bookId);

    //上传文件
    ResultData upload(MultipartFile file);

}
