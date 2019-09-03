package com.xh.dao;

import com.xh.pojo.Chapter;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ChapterMapper {

    // 保存数据
    Boolean save(Chapter chapter);

    //查询数据
    List<Chapter> findList();
    //通过id查询数据
    Chapter findById(@Param("chapterId") Integer chapterId);
//更新
    Boolean update(Chapter chapter);
    //    search
    List<Chapter> findByContent(String chapterContent);

    //    delete
    Boolean batchUpdateStatus(String[] ids);

    /**
     * 通过书的id查询
     * @param bookId
     * @return
     */
    List<Chapter> findByBookId(Integer bookId);

}
