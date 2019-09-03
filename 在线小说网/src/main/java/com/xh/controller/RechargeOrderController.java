package com.xh.controller;

import com.github.pagehelper.PageInfo;
import com.xh.dto.ResultData;
import com.xh.pojo.RechargeOrder;
import com.xh.service.RechargeOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.Arrays;
import java.util.List;

@Controller
public class  RechargeOrderController{
    @Autowired
    private RechargeOrderService rechargeOrderService;

    @RequestMapping("/rechargeorder/rechargeorderlist")
    public String rechargeorderlist(Model model,
                                @RequestParam(defaultValue = "1") Integer page,
                                @RequestParam(defaultValue = "3") Integer pageSize) {
        PageInfo<RechargeOrder> pageInfo = rechargeOrderService.list(page, pageSize);
        //将数据转发到页面
        model.addAttribute("list", pageInfo.getList());
        model.addAttribute("pageInfo", pageInfo);
        return "rechargeorder/rechargeorder-list";
    }

    @RequestMapping("/rechargeorder/search")
    public String rechargeSearchList(Model model,
                                    @RequestParam(defaultValue = "1") Integer page,
                                    @RequestParam(defaultValue = "3") Integer pageSize,
                                     String keyword) {
        PageInfo<RechargeOrder> pageInfo = rechargeOrderService.searchList(page, pageSize,keyword);
        //将数据转发到页面
        model.addAttribute("list", pageInfo.getList());
        model.addAttribute("pageInfo", pageInfo);
        return "rechargeorder/rechargeorder-list";
    }


    @RequestMapping("/rechargeorder/rechargeorderadd")
    public String rechargeorderadd() {
        return "rechargeorder/rechargeorder-add";
    }



    @RequestMapping("/rechargeorder/add")
    @ResponseBody
    public ResultData add(RechargeOrder rechargeOrder) {

        return rechargeOrderService.add(rechargeOrder);
    }

    @RequestMapping("/rechargeorder/editStatus")
    @ResponseBody
    public ResultData editStatus(Integer id, Integer status) {
        return rechargeOrderService.updateStatus(id,status);

    }
    @RequestMapping("/rechargeorder/deleteAll")
    @ResponseBody
    public ResultData deleteAll(@RequestParam(name = "ids") String ids){
        // 将ids转换成数组
        String[] idArr = ids.split(",");

        return rechargeOrderService.batchDelete(idArr);
    }

    @RequestMapping("/rechargeorder/delete")
    @ResponseBody
    public  ResultData delete(Integer rechargeId,Integer rechargeStatus){
        return  rechargeOrderService.delete(rechargeId,rechargeStatus);
    }

}