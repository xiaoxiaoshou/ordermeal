package com.gzh.controller.front.comment;

import com.gzh.pojo.Comment;
import com.gzh.pojo.User;
import com.gzh.service.CommentService;
import com.gzh.utils.ResponseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * @author eRunn
 * @create 2019-04-06 2:55
 */
@Controller
public class CommentController {

    @Autowired
    private CommentService commentService;


    @RequestMapping("/front/addComment")
    @ResponseBody
    public ResponseResult addComment(String content, String id, HttpSession session){
        Comment comment = new Comment();
        User user = (User)session.getAttribute("userSession");
        if(user!=null){
            comment.setUserId(user.getId());
        }
        comment.setOrderId(Integer.parseInt(id));
        comment.setDescribe(content);


        System.out.println(comment.getDescribe());
        System.out.println(comment.getOrderId());
        System.out.println(comment.getUserId());

       ResponseResult responseResult = commentService.insertComment(comment);

        return responseResult;
    }

}
