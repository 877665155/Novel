package com.xh.dao;

import com.xh.pojo.Reader;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ReaderMapper {
//    List<Reader> findAll();
Reader findByrName(String readerName);
    //保存添加的读者信息
    Boolean save(Reader reader);

//    查询所有数据
    List<Reader> findList();

//    更新读者状态信息
//    id:当前读者的id
//    readerStatus：当前状态值
    Boolean updateStatus(@Param("readerId") Integer readerId, @Param("readerStatus") Integer readerStatus);

    /**
     * 通过Id查询数据
     * @param readerId
     * @return
     */
    Reader findById(@Param("readerId") Integer readerId);

    /**
     * 更新读者信息
     * @param reader
     * @return
     */
    Boolean update(Reader reader);

    /**
     * 批量更改状态（软删除）
     * @param ids :readerId的数据
     * @return
     */
    Boolean batchUpdateStatus(String[] ids);

    /**
     * 批量恢复状态
     * @param ids :readerId的数据
     * @return
     */
    Boolean deleteUpdateStatus(String[] ids);
    /**
     * 通过用户名查找
     *   %aa%
     * @param readerName
     * @return
     */
    List<Reader> findByName(String readerName);

    /**
     * 删除读者信息
     * @param readerId:当前读者的id
     * @param readerStatus:当前读者状态
     * @return
     */
    Boolean deleteById(@Param("readerId") Integer readerId, @Param("readerStatus") Integer readerStatus);


    // 显示删除的数据
    List<Reader> findDeleteList();
}
