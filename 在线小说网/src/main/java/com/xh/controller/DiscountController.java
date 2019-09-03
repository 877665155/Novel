package com.xh.controller;
import com.github.pagehelper.PageInfo;
import com.xh.dto.ResultData;
import com.xh.pojo.Discount;
import com.xh.service.DiscountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Arrays;
import java.util.List;
@Controller
public class DiscountController {
    @Autowired
    private DiscountService discountService;


    @RequestMapping("/discount/discountlist")
    public String discountlist(Model model,
                                @RequestParam(defaultValue = "1") Integer page,
                                @RequestParam(defaultValue = "3") Integer pageSize) {
        PageInfo<Discount> pageInfo = discountService.list(page, pageSize);

//将数据转发到页面
        model.addAttribute("list", pageInfo.getList());
        model.addAttribute("pageInfo", pageInfo);
        return "discount/discount-list";
    }


    @RequestMapping("/discount/search")
    public String searchList(Model model,
                               @RequestParam(defaultValue = "1") Integer page,
                               @RequestParam(defaultValue = "3") Integer pageSize,
                             String keyword) {
        PageInfo<Discount> pageInfo = discountService.searchList(page, pageSize,keyword);

//将数据转发到页面
        model.addAttribute("list", pageInfo.getList());
        model.addAttribute("pageInfo", pageInfo);
        return "discount/discount-list";
    }

    @RequestMapping("/discount/discountadd")
    public String discountadd() {
        return "discount/discount-add";

    }

    @RequestMapping("/discount/add")
    @ResponseBody
    public ResultData add(Discount discount) {
        ResultData resultData = discountService.add(discount);
        return resultData;
    }

    @RequestMapping("/discount/editStatus")
    @ResponseBody
    public ResultData editStatus(Integer id, Integer status) {
        return discountService.updateStatus(id,status);

    }
    @RequestMapping("/discount/deleteAll")
    @ResponseBody
    public ResultData deleteAll(@RequestParam(name = "ids") String ids){
        // 将ids转换成数组
        String[] idArr = ids.split(",");

        return discountService.batchDelete(idArr);
    }

    @RequestMapping("/discount/delete")
    @ResponseBody
    public  ResultData delete(Integer actId,Integer actStatus){
        return  discountService.delete(actId,actStatus);
    }

    /**
     * 员工编辑页面
     * @return
     */
    @RequestMapping("/discount/editPage")
    public String editPage(Model model,Integer id){
//         从数据库查询到的数据
        Discount dbDiscount = discountService.findById(id);
        model.addAttribute("dbDiscount",dbDiscount);
        return "discount/discount-edit";
    }

    @RequestMapping("/discount/edit")
    @ResponseBody
    public ResultData edit(Discount discount){
        ResultData resultData = discountService.edit(discount);
        return resultData;

    }





}
