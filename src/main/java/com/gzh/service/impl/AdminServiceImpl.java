package com.gzh.service.impl;

import com.gzh.dao.AdminMapper;
import com.gzh.pojo.Admin;
import com.gzh.service.AdminService;
import com.gzh.utils.ResponseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * @author eRunn
 * @create 2019-04-06 12:10
 */
@Controller
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;

    @Override
    public ResponseResult login(Admin admin) {

      Admin a = adminMapper.selectAdmin(admin);

      if (a!=null){
          return ResponseResult.success(a);
      }else{
          return ResponseResult.fail();
      }
    }

    @Override
    public Admin selectAdminById(int id) {

       Admin admin  = adminMapper.selectByPrimaryKey(id);

        return admin;
    }
}
