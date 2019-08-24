package com.gzh.service;

import com.gzh.pojo.User;
import com.gzh.utils.ResponseResult;

/**
 * @author eRunn
 * @create 2019-04-05 19:52
 */
public interface LogAndRegService {

    /**
     * 用户登录
     * @param user
     * @return
     */
    public ResponseResult selectUser(User user);

    /**
     * 用户注册
     */
    public ResponseResult insertUser(User user);

    /**
     * 通过id查找用户
     * @param id
     */
    User selectUserById(int id);

}
