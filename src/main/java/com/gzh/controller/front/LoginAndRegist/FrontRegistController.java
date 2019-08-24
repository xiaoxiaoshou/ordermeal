package com.gzh.controller.front.LoginAndRegist;

import com.gzh.pojo.User;
import com.gzh.service.LogAndRegService;
import com.gzh.utils.ResponseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author eRunn
 * @create 2019-03-26 20:44
 */
@Controller
public class FrontRegistController {


    @Autowired
    private LogAndRegService logAndRegService;

    /**
     * 跳转到注册页面
     * @return
     */
    @RequestMapping("/front/skipToFrontRegist")
    public String skipToRegist(){
        return "/front/login_regist/regist";
    }

    /**
     * 用户注册
     * @param user
     * @return
     */
    @RequestMapping("/front/regist")
    @ResponseBody
    public ResponseResult regist(User user){

        System.out.println(user.getUsername()+"---"+user.getPassword());

        ResponseResult responseResult = logAndRegService.insertUser(user);

        return ResponseResult.success();
    }
}
