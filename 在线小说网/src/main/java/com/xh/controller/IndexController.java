package com.xh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author:Teacher黄
 * @date:Created at 2019/07/04
 */
@Controller
public class IndexController {


    /**
     * 后台主页
     * @return
     */
    @RequestMapping("/index")
    public String home(){
        return "index";
    }

    /**
     * 欢迎页
     * @return
     */
    @RequestMapping("/welcome")
    public String welcome(){
        return "welcome";
    }

}
