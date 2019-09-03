package com.xh.controller;


import com.github.pagehelper.PageInfo;
import com.xh.dto.ResultData;
import com.xh.pojo.History;
import com.xh.service.HistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HistoryController {
    @Autowired
    private HistoryService historyService;

    //列表
    @RequestMapping("/history/list")
    public String list(Model model,
                       @RequestParam(defaultValue = "1") Integer page,
                       @RequestParam(defaultValue = "3") Integer pageSize) {
        PageInfo<History> pageInfo=historyService.list(page,pageSize);
        model.addAttribute("list",pageInfo.getList());
        model.addAttribute("pageInfo",pageInfo);

        return "history/history-list";
    }
    //添加
    @RequestMapping("/history/addPage")
    public String addPage(){
        return "history/history-add";
    }


    //    添加
    @RequestMapping("/history/add")
    @ResponseBody
    public ResultData add(History history){
        return historyService.add(history);
    }

    //    search
    @RequestMapping("/history/search")
    public String searchList(Model model,
                             @RequestParam(defaultValue = "1") Integer page,
                             @RequestParam(defaultValue = "3") Integer pageSize,
                             String keyword) {
        PageInfo<History> pageInfo=historyService.searchList(page,pageSize,keyword);

        model.addAttribute("list",pageInfo.getList());
        model.addAttribute("pageInfo",pageInfo);
        return  "history/history-list";
    }

//      批量删除
    @RequestMapping("/history/deleteAll")
    @ResponseBody
    public ResultData deleteAll(@RequestParam(name="ids") String ids){
        //将ids转为数组
        String[] idArr = ids.split(",");
        //将字符串数组转为int数组
        return historyService.batchDelete(idArr);

    }

}
