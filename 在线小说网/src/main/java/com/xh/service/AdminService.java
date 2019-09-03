package com.xh.service;

import com.github.pagehelper.PageInfo;
import com.xh.dto.ResultData;
import com.xh.pojo.Admin;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;


public interface AdminService {

    /**
     * 登陆的方法
     * @param admin
     * @return
     */
    ResultData login(Admin admin);


    /**
     * 添加员工
     * @param admin
     * @return
     */
    ResultData add(Admin admin);


    /**
     * 员工列表
     * @param page : 当前页
     * @param pageSize: 页容量
     * @return
     */
    PageInfo<Admin> list(Integer page, Integer pageSize);

    /**
     * 查询所有数据: 不分页
     * @return
     */
    List<Admin> list();


    /**
     *  更新员工的状态信息
     * @param id : 员工的id
     * @param status : 员工状态
     * @return
     */
    ResultData updateStatus(Integer id, Integer status);


    /**
     * 通过id去查找数据
     * @param id
     * @return
     */
    Admin findById(Integer id);


    /**
     * 更新员工基本信息
     * @param admin
     * @return
     */
    ResultData edit(Admin admin);


    /**
     * 批量删除
     * @param ids
     * @return
     */
    ResultData batchDelete(String[] ids);


    /**
     * 文件上传
     * @param file
     * @return
     */
    ResultData upload(MultipartFile file);

        PageInfo<Admin> searchList(Integer page, Integer pageSize, String keyword);
}
