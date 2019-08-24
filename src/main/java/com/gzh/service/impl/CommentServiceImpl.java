package com.gzh.service.impl;

import com.gzh.dao.CommentMapper;
import com.gzh.pojo.Comment;
import com.gzh.service.CommentService;
import com.gzh.service.OrderService;
import com.gzh.utils.ResponseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author eRunn
 * @create 2019-04-06 10:02
 */
@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentMapper commentMapper;

    @Autowired
    private OrderService orderService;

    @Override
    public ResponseResult insertComment(Comment comment) {

        int status = commentMapper.insertSelective(comment);

        //修改订单评价状态改为已评价
        orderService.updateOrderComment(comment.getOrderId());
        if(status>0){
            return ResponseResult.success();
        }else{
            return ResponseResult.fail();
        }
    }

    @Override
    public List<Comment> selectAllComment() {
        List<Comment> comments = commentMapper.selectByExample(null);
        return comments;
    }
}
