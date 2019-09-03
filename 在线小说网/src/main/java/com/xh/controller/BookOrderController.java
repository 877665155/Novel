package com.xh.controller;

import com.github.pagehelper.PageInfo;
import com.xh.dto.ResultData;
import com.xh.pojo.Book;
import com.xh.pojo.BookOrder;
import com.xh.pojo.Reader;
import com.xh.service.BookOrderService;
import com.xh.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.List;

@Controller
public class BookOrderController {
    @Autowired
    private BookOrderService bookOrderService;
    @Autowired
    private BookService bookService;


    @RequestMapping("/bookorder/bookorderlist")
    public String bookorderlist(Model model,
                                @RequestParam(defaultValue = "1") Integer page,
                                @RequestParam(defaultValue = "3") Integer pageSize) {
        PageInfo<BookOrder> pageInfo = bookOrderService.list(page, pageSize);

//将数据转发到页面
        model.addAttribute("list", pageInfo.getList());
        model.addAttribute("pageInfo", pageInfo);
        return "bookorder/bookorder-list";
    }

    @RequestMapping("/bookorder/orderSearch")
    public String searchList(Model model,
                                @RequestParam(defaultValue = "1") Integer page,
                                @RequestParam(defaultValue = "3") Integer pageSize,
                             String keyword) {
        PageInfo<BookOrder> pageInfo = bookOrderService.searchList(page,pageSize,keyword);

//将数据转发到页面
        model.addAttribute("list", pageInfo.getList());
        model.addAttribute("pageInfo", pageInfo);
        return "bookorder/bookorder-list";
    }

    @RequestMapping("/bookorder/bookorderadd")
    public String bookorderadd() {
        return "bookorder/bookorder-add";

    }



    @RequestMapping(value = "/bookorder/add",method = RequestMethod.POST)
    @ResponseBody
    public ResultData add(BookOrder bookOrder, HttpSession session) {
        Reader reader = (Reader)session.getAttribute("reader");
        if(reader==null){
            return  new ResultData(2001,"用户未登陆",null);
        }
        int readerId = reader.getReaderId();
        bookOrder.setUserId(1);
        bookOrder.setDiscountId(1);
        bookOrder.setOrderDate(new Timestamp(System.currentTimeMillis()));
        bookOrder.setOrderStatus(1);
        bookOrder.setPayStatus(1);
        ResultData resultData = bookOrderService.add(bookOrder);

        return resultData;
    }

    @RequestMapping("/bookorder/editStatus")
    @ResponseBody
    public ResultData editStatus(Integer id, Integer status) {
        return bookOrderService.updateStatus(id,status);

    }
    @RequestMapping("/bookorder/deleteAll")
    @ResponseBody
    public ResultData deleteAll(@RequestParam(name = "ids") String ids){
        // 将ids转换成数组
        String[] idArr = ids.split(",");

        return bookOrderService.batchDelete(idArr);
    }

    @RequestMapping("/bookorder/delete")
    @ResponseBody
    public  ResultData delete(Integer orderid,Integer orderStatus){
        return  bookOrderService.delete(orderid,orderStatus);
    }


    @RequestMapping("/bookOrder/toOrder")
    public  String delete(Integer bookId,Model model){
        Book book = bookService.findById(bookId);
        model.addAttribute("book",book);
        return  "front/order";
    }


    @RequestMapping("/bookOrder/toOrderCenter")
    public  String toOrderCenter(HttpSession session,Model model){
         /*Reader reader = (Reader)session.getAttribute("reader");
        if(reader==null){
            return  new ResultData(2001,"用户未登陆",null);
        }
        int readerId = reader.getReaderId();*/
         int readerId = 1;

        List<BookOrder> bookOrderList = bookOrderService.getAll(readerId);
        model.addAttribute("bookOrderList",bookOrderList);
        return  "front/orderCenter";
    }


}
