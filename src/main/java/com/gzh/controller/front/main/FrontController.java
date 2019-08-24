package com.gzh.controller.front.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author eRunn
 * @create 2019-03-26 19:58
 */
@Controller
public class FrontController {

    /**
     * 跳转到首页
     * @return
     */
    @RequestMapping("/front")
    public String front(){

        return "/front/main/index";
    }

    @RequestMapping("/front/skipToContact")
    public String skipToContact(){
        return "front/main/contact";
    }
}
