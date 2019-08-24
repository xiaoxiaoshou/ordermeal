package com.gzh.controller.backend.user;

import com.gzh.pojo.User;
import com.gzh.service.UserService;
import com.gzh.utils.ResponseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author eRunn
 * @create 2019-04-06 14:35
 */
@Controller
public class BackendUserController {

    @Autowired
    private UserService userService;

    /**
     * 查询所有用户
     * @param model
     * @return
     */
    @RequestMapping("/backend/skipToUserList")
    public String skipUserList(Model model){

       List<User> users = userService.selectAllUser();
        model.addAttribute("users",users);
        return "/backend/user/userList";
    }


    /**
     * 跳转到添加用户页面
     * @return
     */
    @RequestMapping("/backend/skipToAddUser")
    public String skipToAddUser(){

        return "/backend/user/addUser";
    }

    /**
     * 跳转到修改用户页面
     * @param id
     * @return
     */
    @RequestMapping("/backend/skipToModifyUser")
    public String skipToModifyUser(int id,Model model){

        System.out.println(id+"-------------skipToModifyUser-----------");

        User user = userService.selectUserById(id);

        System.out.println("-----------------"+user.getUsername());


        model.addAttribute("user",user);
        return "backend/user/modifyUser";
    }


    /**
     * 根据id删除用户
     * @param id
     * @return
     */
    @RequestMapping("/backend/deleteUser")
    @ResponseBody
    public ResponseResult deleteUser(int id){

        ResponseResult responseResult = userService.deleteUserById(id);

        return responseResult;
    }

    /**
     * 添加用户
     * @param user
     * @return
     */
    @RequestMapping("backend/addUser")
    @ResponseBody
    public ResponseResult addUser(User user){

        System.out.println("-----------adduser---------------");
        System.out.println(user.getVipType()+"---"+user.getUsername());

        ResponseResult responseResult = userService.addUser(user);

        return responseResult;
    }

    /**
     * 修改用户信息
     * @param user
     * @return
     */
    @RequestMapping("backend/modifyUser")
    @ResponseBody
    public ResponseResult modifyUser(User user){

        ResponseResult responseResult = userService.updateUser(user);

        return responseResult;
    }


}
