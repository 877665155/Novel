package com.xh.controller;

import com.github.pagehelper.PageInfo;
import com.xh.dto.ResultData;
import com.xh.pojo.Reader;
import com.xh.pojo.*;
import com.xh.service.ReaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class ReaderController {
    @Autowired
    private ReaderService readerService;


    @RequestMapping("/duzhe")
    public String duzhe(){
        return "loginreader";
    }

    @RequestMapping("/book/getByType?bookType=1")
    public String xiangqing(){
        return "front/personal";
    }



    /**
     * 登陆操作
     * @return
     */
    @RequestMapping("/loginreader")
    @ResponseBody

        public ResultData login1(Reader reader,HttpServletRequest request){
            // 登陆操作
            ResultData resultData = readerService.login1(reader);
            // 判断登陆成功,将用户数据保存到 session中
            // 如何获取session对象?
            if(resultData.getCode() == 200){
                HttpSession session = request.getSession();
                session.setAttribute("reader",resultData.getData());
            }

            return resultData;
        }




//    @RequestMapping("/login")
//    @ResponseBody// 该方法返回的是json字符串
//    public ResultData login(Admin admin,HttpServletRequest request){
//        // 登陆操作
//        ResultData resultData = adminService.login(admin);
//        // 判断登陆成功,将用户数据保存到 session中
//        // 如何获取session对象?
//        if(resultData.getCode() == 200){
//            HttpSession session = request.getSession();
//            session.setAttribute("admin",resultData.getData());
//        }
//
//        return resultData;
//    }
//
    //读者列表
    @RequestMapping("/reader/list")
    public String list(Model model,
                       @RequestParam(defaultValue = "1") Integer page,
                       @RequestParam(defaultValue = "5") Integer pageSize){


        PageInfo<Reader> pageInfo = readerService.list(page,pageSize);



        model.addAttribute("list",pageInfo.getList());
        model.addAttribute("pageInfo",pageInfo);

        return "reader/reader-list";
    }

    //搜索读者显示列表
    @RequestMapping("/reader/search")
    public String searchList(Model model,
                       @RequestParam(defaultValue = "1") Integer page,
                       @RequestParam(defaultValue = "5") Integer pageSize,
                             String keyword){

        PageInfo<Reader> pageInfo = readerService.searchList(page, pageSize, keyword);
        model.addAttribute("list",pageInfo.getList());
        model.addAttribute("pageInfo",pageInfo);

        return "reader/reader-list";
    }

    //读者删除列表
    @RequestMapping("/reader/deleteList")
    public String deleteList(Model model,
                       @RequestParam(defaultValue = "1") Integer page,
                       @RequestParam(defaultValue = "5") Integer pageSize){

        PageInfo<Reader> pageInfo = readerService.DeleteList(page,pageSize);
        model.addAttribute("list",pageInfo.getList());
        model.addAttribute("pageInfo",pageInfo);
        return "reader/reader-del";
    }

    //添加读者
    @RequestMapping("/reader/addPage")
    public String addPage(){
        return "front/register";
    }


//    添加读者的方法
    @RequestMapping("/reader/add")
    @ResponseBody
    public ResultData add(Reader reader){
        return readerService.add(reader);
    }

    /**
     * 编辑读者状态信息
     * @param readerId : 当前读者Id
     * @param readerStatus: 读者当前状态
     * @return
     */
    @RequestMapping("/reader/editStatus")
    @ResponseBody
    public ResultData editStatus(Integer readerId, Integer readerStatus){
        return readerService.updateStatus(readerId, readerStatus);
    }

    /**
     * 编辑读者
     * @param
     * @param
     * @return
     */
    @RequestMapping("/reader/editPage")
    public String editPage(Model model, Integer readerId){
        Reader dbreadder = readerService.findById(readerId);
        model.addAttribute("reader",dbreadder);
        return "reader/reader-edit";
    }

    /**
     * 更新读者基本信息的方法
     * @param reader
     * @return
     */
    @RequestMapping("/reader/edit")
    @ResponseBody
    public ResultData edit(Reader reader){
        return readerService.edit(reader);
    }

    /**
     * 批量删除
     * @param ids
     * @return
     */
    @RequestMapping("/reader/deleteAll")
    @ResponseBody
    public ResultData deleteAll(@RequestParam(name = "ids") String ids){
//        将ids转换成数组
        String[] idArr=ids.split(",");
        return readerService.batchDelete(idArr);
    };

    /**
     * 批量恢复
     * @param ids
     * @return
     */
    @RequestMapping("/reader/huifuAll")
    @ResponseBody
    public ResultData huifuDelete(@RequestParam(name = "ids") String ids){
//        将ids转换成数组
        String[] idArr=ids.split(",");
        return readerService.huifuDelete(idArr);
    };

    @RequestMapping("/reader/delete")
    @ResponseBody
    public ResultData deleteReader(Integer readerId, Integer readerStatus){
        return readerService.deletereader(readerId,readerStatus);
    }



    @RequestMapping("/reader/toCenter")
    public String toCenter(HttpSession session, Model model){
//         Reader reader = (Reader)session.getAttribute("reader");
//        if(reader==null){
//            return  "login";
//        }
        Reader reader = readerService.findById(1 );
        model.addAttribute("reader",reader);
        return "front/center";
    }



}
