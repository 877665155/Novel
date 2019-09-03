package com.xh.controller;

import com.github.pagehelper.PageInfo;
import com.xh.dto.ResultData;
import com.xh.pojo.Author;
import com.xh.service.AuthorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AuthorController {
    @Autowired
    private AuthorService authorService;


    @RequestMapping("/zuozhe")
    public String duzhe(){
        return "loginauthor";
    }


    @RequestMapping("/zuoping")
    public String zuoping(){
        return "index11";
    }

    /**
     * 登陆操作
     * @return
     */
    @RequestMapping("/loginauthor")
    @ResponseBody
    public ResultData login2(Author author){
        ResultData resultData=authorService.login2(author);
        return resultData;
    }



    //作者列表
    @RequestMapping("/author/list")
    public String list(Model model,
                       @RequestParam(defaultValue = "1") Integer page,
                       @RequestParam(defaultValue = "5") Integer pageSize){


        PageInfo<Author> pageInfo = authorService.list(page,pageSize);



        model.addAttribute("list",pageInfo.getList());
        model.addAttribute("pageInfo",pageInfo);

        return "author/author-list";
    }

    //搜索作者显示列表
    @RequestMapping("/author/search")
    public String searchList(Model model,
                       @RequestParam(defaultValue = "1") Integer page,
                       @RequestParam(defaultValue = "5") Integer pageSize,
                             String keyword){

        PageInfo<Author> pageInfo = authorService.searchList(page, pageSize, keyword);
        model.addAttribute("list",pageInfo.getList());
        model.addAttribute("pageInfo",pageInfo);

        return "author/author-list";
    }

    //作者删除列表
    @RequestMapping("/author/deleteList")
    public String deleteList(Model model,
                       @RequestParam(defaultValue = "1") Integer page,
                       @RequestParam(defaultValue = "5") Integer pageSize){

        PageInfo<Author> pageInfo = authorService.DeleteList(page,pageSize);
        model.addAttribute("list",pageInfo.getList());
        model.addAttribute("pageInfo",pageInfo);
        return "author/author-del";
    }

    //添加作者
    @RequestMapping("/author/addPage")
    public String addPage(){
        return "author/author-add";
    }



//    添加作者的方法
    @RequestMapping("/author/add")
    @ResponseBody
    public ResultData add(Author author){
        return authorService.add(author);
    }

    /**
     * 编辑作者状态信息
     * @param authorId : 当前作者Id
     * @param authorStatus: 作者当前状态
     * @return
     */
    @RequestMapping("/author/editStatus")
    @ResponseBody
    public ResultData editStatus(Integer authorId, Integer authorStatus){
        return authorService.updateStatus(authorId, authorStatus);
    }

    /**
     * 编辑作者
     * @param
     * @param
     * @return
     */
    @RequestMapping("/author/editPage")
    public String editPage(Model model, Integer authorId){
        Author dbreadder = authorService.findById(authorId);
        model.addAttribute("author",dbreadder);
        return "author/author-edit";
    }

    /**
     * 更新作者基本信息的方法
     * @param author
     * @return
     */
    @RequestMapping("/author/edit")
    @ResponseBody
    public ResultData edit(Author author){
        return authorService.edit(author);
    }

    /**
     * 批量删除
     * @param ids
     * @return
     */
    @RequestMapping("/author/deleteAll")
    @ResponseBody
    public ResultData deleteAll(@RequestParam(name = "ids") String ids){
//        将ids转换成数组
        String[] idArr=ids.split(",");
        return authorService.batchDelete(idArr);
    };

    /**
     * 批量恢复
     * @param ids
     * @return
     */
    @RequestMapping("/author/huifuAll")
    @ResponseBody
    public ResultData huifuDelete(@RequestParam(name = "ids") String ids){
//        将ids转换成数组
        String[] idArr=ids.split(",");
        return authorService.huifuDelete(idArr);
    };

    @RequestMapping("/author/delete")
    @ResponseBody
    public ResultData deleteAuthor(Integer authorId, Integer authorStatus){
        return authorService.deleteauthor(authorId,authorStatus);
    }



}
