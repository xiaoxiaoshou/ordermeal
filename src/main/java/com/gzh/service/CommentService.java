package com.gzh.service;

import com.gzh.pojo.Comment;
import com.gzh.utils.ResponseResult;

import java.util.List;

/**
 * @author eRunn
 * @create 2019-04-06 10:02
 */
public interface CommentService {
    /**
     * 添加评价
     * @param comment
     * @return
     */
    ResponseResult insertComment(Comment comment);

    /**
     * 查询所有评价
     * @return
     */
    List<Comment> selectAllComment();
}
