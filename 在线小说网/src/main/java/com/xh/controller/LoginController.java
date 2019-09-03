package com.xh.controller;

import com.xh.dto.ResultData;
import com.xh.pojo.Admin;
import com.xh.pojo.Book;
import com.xh.pojo.Chapter;
import com.xh.pojo.Message;
import com.xh.service.AdminService;
import com.xh.service.BookService;
import com.xh.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * @author:Teacher黄
 * @date:Created at 2019/07/04
 */
@Controller
public class LoginController {

    @Autowired
    private AdminService adminService;

    @Autowired
    private BookService bookService;

    @Autowired
    private MessageService messageService;

    /**
     * 登陆页面
     * @return
     */
    @RequestMapping("/loginPage")
    public String loginPage(){
        return "login";
    }


    @RequestMapping(value = "/novelPage",method = RequestMethod.GET)
    public String novelPage(Integer bookId, Model model){
        Book book = bookService.findById(bookId);
        List<Message> messageList = messageService.findByBookId(bookId);

        model.addAttribute("book",book);
        model.addAttribute("messageList",messageList);
        return "novel";
    }

    @RequestMapping(value = "/shiduPage",method = RequestMethod.GET)
    public String shiduPage(Integer bookId,Integer page,Model model){
        Book book = bookService.findById(bookId);
        Chapter chapter = book.getChapterList().get(page-1);
        int totalPage= book.getChapterList().size();
        List<Chapter> chapterList = new ArrayList<>();
        chapterList.add(chapter);
        book.setChapterList(chapterList);
        model.addAttribute("book",book);
        model.addAttribute("page",page);
        model.addAttribute("totalPage",totalPage);
        return "shidu";
    }


    /**
     * 登陆操作
     * @return
     */
    @RequestMapping("/login")
    @ResponseBody// 该方法返回的是json字符串
    public ResultData login(Admin admin,HttpServletRequest request){
        // 登陆操作
        ResultData resultData = adminService.login(admin);
        // 判断登陆成功,将用户数据保存到 session中
        // 如何获取session对象?
        if(resultData.getCode() == 200){
            HttpSession session = request.getSession();
            session.setAttribute("admin",resultData.getData());
        }

        return resultData;
    }
    @RequestMapping("/rloginPage")
    public String rloginPage(){
        return "front/register";
    }


    /**
     * 退出登陆的方法
     * @return
     */
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request){
        // 只需要去将保存到session的数据干掉即可
        request.getSession().setAttribute("admin",null);

        // 重定向和转发的区别?
        // 重定向: 1. 客户端行为 2. 两次请求 3. 不能携带前一次请求的数据
        // 转发: 1. 服务器端行为 2. 一次请求 3. 能够携带前一次请求的数据
        return "redirect:/loginPage";
    }
}
