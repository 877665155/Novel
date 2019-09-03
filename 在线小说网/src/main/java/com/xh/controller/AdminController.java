package com.xh.controller;

import com.github.pagehelper.PageInfo;
import com.xh.dto.ResultData;
import com.xh.pojo.Admin;
import com.xh.service.AdminService;
import com.xh.utils.ExcelUtil;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

/**
 * @author:Teacher黄
 * @date:Created at 2019/07/04
 */
@Controller
public class AdminController {

    @Autowired
    private AdminService adminService;

    /**
     * 员工列表
     * @return
     */
    @RequestMapping("/admin/list")
    public String list(Model model,
                       @RequestParam(defaultValue = "1") Integer page,
                       @RequestParam(defaultValue = "5") Integer pageSize){


        PageInfo<Admin> pageInfo = adminService.list(page,pageSize);

        // 将数据转发到页面
        model.addAttribute("list",pageInfo.getList());
        model.addAttribute("pageInfo",pageInfo);

        return "admin/admin-list";
    }

    /**
     * 员工添加页面
     * @return
     */
    @RequestMapping("/admin/addPage")
    public String addPage(){
        return "admin/admin-add";
    }


    /**
     * 添加员工的方法
     * @param admin
     * @return
     */
    @RequestMapping("/admin/add")
    @ResponseBody
    public ResultData add(Admin admin){
        return adminService.add(admin);
    }


    /**
     * 编辑员工状态
     * @param id
     * @param status
     * @return
     */
    @RequestMapping("/admin/editStatus")
    @ResponseBody
    public ResultData editStatus(Integer id, Integer status){
        return adminService.updateStatus(id, status);
    }




    @RequestMapping("/admin/search")
    public String searchList(Model model,
                             @RequestParam(defaultValue = "1") Integer page,
                             @RequestParam(defaultValue = "5") Integer pageSize,
                             String keyword){

        PageInfo<Admin> pageInfo = adminService.searchList(page, pageSize, keyword);
        model.addAttribute("list",pageInfo.getList());
        model.addAttribute("pageInfo",pageInfo);

        return "admin/admin-list";
    }



    /**
     * 员工编辑页面
     * @return
     */
    @RequestMapping("/admin/editPage")
    public String editPage(Model model,Integer id){
        // 从数据库查询到的数据
        Admin dbAdmin = adminService.findById(id);

        model.addAttribute("admin",dbAdmin);
        return "admin/admin-edit";
    }

    /**
     * 更新员工基本信息的方法
     * @param admin
     * @return
     */
    @RequestMapping("/admin/edit")
    @ResponseBody
    public ResultData edit(Admin admin){
        return adminService.edit(admin);
    }

    /**
     * 批量删除
     * @return
     */
    @RequestMapping("/admin/deleteAll")
    @ResponseBody
    public ResultData deleteAll(@RequestParam(name = "ids") String ids){
        // 将ids转换成数组
        String[] idArr = ids.split(",");

        return adminService.batchDelete(idArr);
    }


    @RequestMapping("/admin/upload")
    @ResponseBody
    public ResultData upload(MultipartFile file){

        return adminService.upload(file);
    }


    /**
     * excel数据的导出
     */
    @RequestMapping("/admin/export")
    public void export(HttpServletResponse response) throws IOException {

        // 查询到所有的数据
        List<Admin> list = adminService.list();

        Workbook workbook = ExcelUtil.exportExcel(list);
        // 告诉浏览器 需要下载文件
        response.setHeader("Content-Disposition","attachment;fileName="+System.currentTimeMillis()+".xlsx");

        //获取输出流
        ServletOutputStream outputStream = response.getOutputStream();
        // 输出表格数据
        workbook.write(outputStream);
        // 关闭资源
        outputStream.close();
        workbook.close();



    }

}
