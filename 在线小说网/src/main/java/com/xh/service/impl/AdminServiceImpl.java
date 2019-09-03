package com.xh.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xh.dao.AdminMapper;
import com.xh.dto.ResultData;
import com.xh.pojo.Admin;
import com.xh.service.AdminService;
import com.xh.utils.ExcelUtil;
import com.xh.utils.MD5Util;
import com.xh.utils.StringUtil;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.FileUploadBase.FileSizeLimitExceededException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;


@Service
@Transactional(rollbackFor = Exception.class)
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;



    /**
     * 登陆的方法
     * code: 200      40001         4002
     * msg: 登陆成功   不存在改用户   密码错误
     * @param admin
     * @return
     */
    @Override
    public ResultData login(Admin admin) {
        if(admin == null){
            return new ResultData(4001,"登陆数据异常!");
        }
        if(admin.getAdminName() == null || admin.getAdminName().isEmpty()){
            return new ResultData(4002,"登陆用户名不能为空!");
        }
        if(admin.getAdminPwd() == null || admin.getAdminPwd().isEmpty()){
            return new ResultData(4003,"登陆密码不能为空!");
        }
        // 查询数据库
        Admin dbAdmin = adminMapper.findByName(admin.getAdminName());
        if(dbAdmin == null){
            return new ResultData(4004,"该用户不存在!");
        }
        // 验证密码
        if(!dbAdmin.getAdminPwd().equals(MD5Util.MD55(admin.getAdminPwd()))){
            return new ResultData(4005,"密码不正确!");
        }
        return new ResultData(200,"登陆成功!",dbAdmin);
    }


    /**
     * 添加员工
     * @param admin
     * @return
     */
    @Override
    public ResultData add(Admin admin) {
        if(admin == null){
            return new ResultData(5001,"添加数据异常!");
        }
        // 验证数据

        // 数据的填充
        admin.setAdminType(2);
        admin.setAdminStatus(1);
        admin.setAdminAddTime(new Timestamp(System.currentTimeMillis()));
        // 密码加密
        admin.setAdminPwd(MD5Util.MD55(admin.getAdminPwd()));

        // 保存到数据库
        try {
            if (adminMapper.save(admin)) {
                return new ResultData(200,"添加管理员成功!");
            }
        } catch (Exception e) {
            return new ResultData(5003,"管理员名字已经存在!");
        }
        return new ResultData(5002,"添加管理员失败!");
    }

    /**
     * 员工列表
     * @param page : 当前页
     * @param pageSize: 页容量
     * @return
     */
    @Override
    public PageInfo<Admin> list(Integer page, Integer pageSize) {
        // 添加分页参数
        PageHelper.startPage(page,pageSize);
        List<Admin> list = adminMapper.findList();
        return new PageInfo<>(list);
    }

    /**
     * 查询所有列表不分页
     * @return
     */
    @Override
    public List<Admin> list() {
        return adminMapper.findList();
    }

    /**
     * 更新状态
     * @param id : 员工的id
     * @param status : 员工状态
     * @return
     */
    @Override
    public ResultData updateStatus(Integer id, Integer status) {
        if(id == null || id <= 0){
            return new ResultData(6001,"更新数据id异常");
        }
        if(status != 1 && status != 2 && status != 3){
            return new ResultData(6002,"状态数据不正确!");
        }
        if (adminMapper.updateStatus(id,status)) {
            return new ResultData(200,"处理状态成功!");
        }

        return new ResultData(6003,"处理状态失败!");
    }


    @Override
    public Admin findById(Integer id) {
        return adminMapper.findById(id);
    }

    /**
     * 更新员工基本信息
     * @param admin
     * @return
     */
    @Override
    public ResultData edit(Admin admin) {

        if (admin == null) {
            return new ResultData(7001,"更新数据异常!");
        }

        if (adminMapper.update(admin)) {
            return new ResultData(200,"更新数据成功!");
        }
        return new ResultData(7002,"更新失败");
    }

    /**
     * 批量删除
     * @param ids : id数组
     * @return
     */
    @Override
    public ResultData batchDelete(String[] ids) {

        if(ids.length == 0){
            return new ResultData(8001,"批量删除数据有异常!");
        }
        if (adminMapper.batchUpdateStatus(ids)) {
            return new ResultData(200,"删除数据成功!");
        }

        return new ResultData(8002,"删除数据失败");

    }

    /**
     * 文件上传
     * @param file
     * @return
     */
    @Override
    public ResultData upload(MultipartFile file) {
        if(file.isEmpty()){
            return new ResultData(9001,"文件数据异常!");
        }

        // 1. 得到文件的名字
        String filename = file.getOriginalFilename();

        // 2. 文件保存的位置
        String basePath = "C:\\workspace_for_idea\\xh2-ssm\\upload";

        // 需要生成一个当前系统唯一的文件名
        // 先需要获取文件后缀
        String ext = StringUtil.getExt(filename);
        // 对后缀进行验证
        if(".xlsx.xls".indexOf(ext) == -1){
            return new ResultData(9004, "上传的文件后缀不满足规则");
        }

        String uploadName = StringUtil.getUniqueFileName();
        // 组装一个上传的文件路径
        // 用日期来做文件路径
        // 2019/07/08
        String uploadPath = StringUtil.datePath();
        // 创建文件夹
        File uploadDirFile = new File(basePath, uploadPath);
        if(!uploadDirFile.exists()){
            uploadDirFile.mkdirs();
        }
        // 3. 上传文件
        File uploadFile = new File(uploadDirFile, uploadName+ext);
        try {
            file.transferTo(uploadFile);
            // 数据的导入
            // 解析excel
            FileInputStream inputStream = new FileInputStream(uploadFile);
            List<List<String>> lists = ExcelUtil.parseExcel(inputStream);
            for (List<String> list : lists) {
                // 循环的去添加数据
                // 构建admin对象
                Admin admin = new Admin(list.get(0), list.get(1), "男".equals(list.get(2)) ? 1 : 2, Long.valueOf(list.get(3)));
                add(admin);
            }


            return new ResultData(200, "上传成功!");
        }catch (Exception e) {
            System.out.println(e.getMessage());
            if(e.getMessage().indexOf("The field file exceeds its maximum permitted size")!= -1){
                return new ResultData(9003,"文件大小超出规定!");
            }
        }
        return new ResultData(9002,"文件上传失败!");
    }



    public PageInfo<Admin> searchList(Integer page,Integer pageSize,String keyword){
        PageHelper.startPage(page,pageSize);
        List<Admin> list=adminMapper.findName("%"+keyword+"%");
        return  new PageInfo<>(list);
    }
}
