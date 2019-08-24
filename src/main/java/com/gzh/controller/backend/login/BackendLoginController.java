package com.gzh.controller.backend.login;

import com.gzh.pojo.Admin;
import com.gzh.service.AdminService;
import com.gzh.utils.ResponseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author eRunn
 * @create 2019-03-25 23:01
 */
@Controller
public class BackendLoginController {

    @Autowired
    private AdminService adminService;

    /**
     * 跳转到登录页面
     * @return
     */
    @RequestMapping("backend/skipToLogin")
    public String skipToLogin(){

        return "/backend/login/login";
    }

   /* @RequestMapping("/backend/index")
    public String skipToIndex(){
        return "/backend/main/index";
    }*/

    /**
     * 登录验证
     * @param admin
     * @return
     */
    @RequestMapping("/backend/login")
    @ResponseBody
    public ResponseResult login(Admin admin){

        System.out.println(admin.getUsername());

        ResponseResult responseResult = adminService.login(admin);

        return responseResult;
    }

    /**
     * 登录成功跳转到后台首页
     * @param id
     * @param request
     * @return
     */
    @RequestMapping("/backend/loginSuccessSkipToIndex")
    public String loginSuccessSkipToIndex(int id, HttpServletRequest request){

        Admin admin = adminService.selectAdminById(id);
        HttpSession session = request.getSession();
        session.setAttribute("businessSession",admin);

        if (admin.getType()==0){
            return "/backend/main/index";
        }else{
            return "backend/main/kitchen";
        }
    }

    /**
     * 退出
     */
    @RequestMapping("/backend/loginOut")
    public String loginOut(HttpServletRequest request){
        HttpSession session = request.getSession();
        request.getSession().removeAttribute("businessSession");
        return "/backend/login/login";
    }

    @RequestMapping("/backend/skipToWelcome1")
    public String skipToWelcome1(){
        return "backend/main/welcome1";
    }

    @RequestMapping("/backend/skipToWelcome2")
    public String skipToWelcome2(){
        return "backend/main/welcome2";
    }
}
