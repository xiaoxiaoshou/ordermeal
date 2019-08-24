package com.gzh.service.impl;

import com.gzh.dao.UserMapper;
import com.gzh.pojo.User;
import com.gzh.service.UserService;
import com.gzh.utils.ResponseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author eRunn
 * @create 2019-04-06 14:37
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public List<User> selectAllUser() {

        List<User> users = userMapper.selectAllUser();

        return users;
    }

    @Override
    public User selectUserById(int id) {

        User user = userMapper.selectUserById(id);

        return user;
    }

    @Override
    public ResponseResult addUser(User user) {
        int insert = userMapper.insertSelective(user);
        if(insert>0){
          return ResponseResult.success();
        }else {
            return ResponseResult.fail();
        }

    }

    @Override
    public ResponseResult updateUser(User user) {

        int i = userMapper.updateByPrimaryKeySelective(user);
        if(i>0){
          return ResponseResult.success();
        }else{
            return ResponseResult.fail();
        }

    }

    @Override
    public ResponseResult deleteUserById(int id) {
        int i = userMapper.deleteByPrimaryKey(id);

        if(i>0){
            return ResponseResult.success();
        }else{
            return ResponseResult.fail();
        }
    }
}
