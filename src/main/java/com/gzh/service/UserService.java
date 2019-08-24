package com.gzh.service;

import com.gzh.pojo.User;
import com.gzh.utils.ResponseResult;

import java.util.List;

/**
 * 后台user
 * @author eRunn
 * @create 2019-04-06 14:35
 */
public interface UserService {
    /**
     * 查询所有用户
     * @return
     */
    List<User> selectAllUser();

    /**
     * 根据id查找用户
     * @param id
     * @return
     */
    User selectUserById(int id);

    /**
     * 添加用户
     * @param user
     * @return
     */
    ResponseResult addUser(User user);

    /**
     * 更新用户信息
     * @param user
     * @return
     */
    ResponseResult updateUser(User user);

    /**
     * 根据id删除用户
     * @param id
     * @return
     */
    ResponseResult deleteUserById(int id);


}
