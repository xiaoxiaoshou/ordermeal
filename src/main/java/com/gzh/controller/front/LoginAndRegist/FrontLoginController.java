package com.gzh.controller.front.LoginAndRegist;

import com.gzh.pojo.User;
import com.gzh.service.LogAndRegService;
import com.gzh.utils.ResponseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;



@Controller
public class FrontLoginController {


    @Autowired
    private LogAndRegService logAndRegService;


    /**
     * 跳转到登录页面
     * @param user
     * @param session
     * @return
     */
    @RequestMapping("/front/skipToFrontLogin")
    public String skipToLogin(User user, HttpSession session){


        return "/front/login_regist/login";
    }

    @RequestMapping("/front/login")
    @ResponseBody
    public ResponseResult login(User user, HttpSession session){

        System.out.println(user.getUsername());

        ResponseResult login = logAndRegService.selectUser(user);

        return login;
    }

    @RequestMapping("/front/loginSuccess")
    public String loginSuccess(int id, HttpServletRequest request){
        HttpSession session = request.getSession();

        User user = logAndRegService.selectUserById(id);
        session.setAttribute("userSession",user);
        return "/front/main/index";
    }
}
