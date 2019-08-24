package com.gzh.controller.backend.comment;

import com.gzh.pojo.Comment;
import com.gzh.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @author eRunn
 * @create 2019-04-06 14:55
 */
@Controller
public class BackendCommentController {

    @Autowired
    private CommentService commentService;

    @RequestMapping("/backend/skipToCommentList")
    public String skipToCommentList(Model model){

        List<Comment> comments = commentService.selectAllComment();
        model.addAttribute("comments",comments);
        return "backend/comment/commentList";
    }

}
