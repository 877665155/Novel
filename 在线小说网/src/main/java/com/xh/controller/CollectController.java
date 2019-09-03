package com.xh.controller;

import com.github.pagehelper.PageInfo;
import com.xh.pojo.Collect;
import com.xh.service.CollectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CollectController {
    @Autowired
    private CollectService collectService;
    @RequestMapping("reader/collect")
    public String list(Model model,
                       @RequestParam(defaultValue = "1") Integer page,
                       @RequestParam(defaultValue = "5") Integer pageSize){
        PageInfo<Collect> pageInfo=collectService.list(page,pageSize);
        model.addAttribute("list",pageInfo.getList());
        model.addAttribute("pageInfo",pageInfo);
        return "reader/collect-list";
    }



    //搜索读者显示列表
    @RequestMapping("/reader/collectsearch")
    public String searchList(Model model,
                             @RequestParam(defaultValue = "1") Integer page,
                             @RequestParam(defaultValue = "5") Integer pageSize,
                             String keyword){

        PageInfo<Collect> pageInfo = collectService.searchList(page, pageSize, keyword);
        model.addAttribute("list",pageInfo.getList());
        model.addAttribute("pageInfo",pageInfo);

        return "reader/collect-list";
    }

    @RequestMapping("reader/collect1")
    public String collectList(Model model,
                       @RequestParam(defaultValue = "1") Integer page,
                       @RequestParam(defaultValue = "5") Integer pageSize){
        PageInfo<Collect> pageInfo=collectService.list(page,pageSize);
        model.addAttribute("list",pageInfo.getList());
        model.addAttribute("pageInfo",pageInfo);
        return "reader/collect-list1";
    }

}
