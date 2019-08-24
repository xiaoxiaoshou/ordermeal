package com.gzh.service.impl;

import com.gzh.dao.UserMapper;
import com.gzh.pojo.User;
import com.gzh.service.LogAndRegService;
import com.gzh.utils.ResponseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author eRunn
 * @create 2019-04-05 19:52
 */
@Service
public class LogAndRegServiceImpl implements LogAndRegService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public ResponseResult selectUser(User user) {

       User  u =  userMapper.selectByUser(user);
        if(u!=null){
            return ResponseResult.success(u);
        }else{
            return ResponseResult.fail();
        }

    }

    @Override
    public ResponseResult insertUser(User user) {
        int status = userMapper.insert(user);

        if(status>0){
            return ResponseResult.success();
        }else{
            return ResponseResult.fail();
        }


    }

    @Override
    public User selectUserById(int id) {
        User u = userMapper.selectUserById(id);
        return u;
    }


}
