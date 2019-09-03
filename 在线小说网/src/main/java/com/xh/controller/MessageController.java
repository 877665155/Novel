package com.xh.controller;

import com.github.pagehelper.PageInfo;
import com.xh.dto.ResultData;
import com.xh.pojo.Book;
import com.xh.pojo.Message;
import com.xh.service.BookService;
import com.xh.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MessageController {
    @Autowired
    private MessageService messageService;

    @Autowired
    private BookService bookService;

    @RequestMapping("/message/list")
    public String list(Model model,
                       @RequestParam(defaultValue = "1") Integer page,
                       @RequestParam(defaultValue = "5") Integer pageSize){

        PageInfo<Message> pageInfo=messageService.list(page,pageSize);


//将数据转发到页面
        model.addAttribute("list",pageInfo.getList());
        model.addAttribute("pageInfo",pageInfo);


        return "message/message-list";
    }
    @RequestMapping("/message/addMessage")
    public  String addMessage(){
        return  "message/message-add";
    }



//    搜索留言显示列表
    @RequestMapping("/message/search")
    public String searchList(Model model,@RequestParam(defaultValue = "1") Integer page,
                             @RequestParam(defaultValue = "5") Integer pageSize,
                             String keyword){
        PageInfo<Message> pageInfo=messageService.searchList(page,pageSize,keyword);
        model.addAttribute("list",pageInfo.getList());
        model.addAttribute("pageInfo",pageInfo);

        return "message/message-list";
    }
//    添加留言
    @RequestMapping(value = "/message/add",method = RequestMethod.POST)
    public String  add(Message message, HttpSession session,Model model){
        /*Reader reader  = (Reader)session.getAttribute("reader");
        message.setReaderId(reader.getReaderId());*/
        message.setReaderId(2);
        ResultData resultData = messageService.add(message);

        Book book = bookService.findById(message.getBookId());
        List<Message> messageList = messageService.findByBookId(message.getBookId());

        model.addAttribute("book",book);
        model.addAttribute("messageList",messageList);
        return "novel";
    }


//    留言编辑页面
    @RequestMapping("/message/editPage")
    public String editPage(Model model,Integer id){
//        从数据库查询到的数据
        Message dbMessage = messageService.findById(id);

        model.addAttribute("message",dbMessage);
        return "message/message-edit";
    }

//    更新留言信息的方法
    @RequestMapping("/message/edit")
    @ResponseBody
    public ResultData edit(Message message){

        return messageService.edit(message);

    }


//    批量删除
    @RequestMapping("/message/deleteAll")
    @ResponseBody
    public ResultData deleteAll(@RequestParam(name = "ids") String ids){
//        将ids转换成数组
        String[] idArr=ids.split(",");
        return messageService.mesDelete(idArr);
    }
}
