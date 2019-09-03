package com.xh.dao;

import com.xh.pojo.Admin;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface AdminMapper {


    /**
     * 通过用户名来查询数据
     * @param adminName
     * @return
     */
    Admin findByName(String adminName);


    /**
     * 保存数据
     * @param admin
     * @return
     */
    Boolean save(Admin admin);


    /**
     * 查询所有数据
     * @return
     */
    List<Admin> findList();


    /**
     * 更新员工的状态
     * @param id : 当前员工的id
     * @param status : 状态值
     * @return
     */
    Boolean updateStatus(@Param("id") Integer id, @Param("status") Integer status);


    /**
     * 通过id查询数据
     * @param id
     * @return
     */
    Admin findById(@Param("id") Integer id);


    /**
     * 更新员工信息
     * @param admin
     * @return
     */
    Boolean update(Admin admin);


    /**
     * 批量更改状态(软删除)
     * @param ids : id的数组
     * @return
     */
    Boolean batchUpdateStatus(String[] ids);

    List<Admin> findName(String bookName);


}
