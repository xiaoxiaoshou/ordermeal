package com.gzh.service;

import com.gzh.pojo.Admin;
import com.gzh.utils.ResponseResult;

/**
 * @author eRunn
 * @create 2019-04-06 12:09
 */
public interface AdminService {
    /**
     * 后台登录
     * @param admin
     * @return
     */
    ResponseResult login(Admin admin);

    /**
     * 通过id查找admin
     * @param id
     * @return
     */
    Admin selectAdminById(int id);
}
