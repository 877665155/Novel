package com.xh.dao;

import com.xh.pojo.Author;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AuthorMapper {
    Author findByaName(String authorName);
//    List<Author> findAll();

    //保存添加的作者信息
    Boolean save(Author author);

//    查询所有数据
    List<Author> findList();

//    更新作者状态信息
//    id:当前作者的id
//    authorStatus：当前状态值
    Boolean updateStatus(@Param("authorId") Integer authorId, @Param("authorStatus") Integer authorStatus);

    /**
     * 通过Id查询数据
     * @param authorId
     * @return
     */
    Author findById(@Param("authorId") Integer authorId);

    /**
     * 更新作者信息
     * @param author
     * @return
     */
    Boolean update(Author author);

    /**
     * 批量更改状态（软删除）
     * @param ids :authorId的数据
     * @return
     */
    Boolean batchUpdateStatus(String[] ids);

    /**
     * 批量恢复状态
     * @param ids :authorId的数据
     * @return
     */
    Boolean deleteUpdateStatus(String[] ids);
    /**
     * 通过用户名查找
     *   %aa%
     * @param authorName
     * @return
     */
    List<Author> findByName(String authorName);

    /**
     * 删除作者信息
     * @param authorId:当前作者的id
     * @param authorStatus:当前作者状态
     * @return
     */
    Boolean deleteById(@Param("authorId") Integer authorId, @Param("authorStatus") Integer authorStatus);


    // 显示删除的数据
    List<Author> findDeleteList();
}
