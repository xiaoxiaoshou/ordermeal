package com.gzh.service;

import com.gzh.pojo.Border;

import java.util.List;

/**
 * @author eRunn
 * @create 2019-04-05 14:53
 */
public interface BorderService {

    /**
     * 查询所有没有人使用的餐桌
     * @return
     */
    List<Border> selectBorderListByStatus();

    /**
     * 更新餐桌状态信息
     * @param id
     */
    int updateBorderStatus(int id,int status);

    /**
     * 查看所有餐桌
     * @return
     */
    List<Border> selectAllBorder();

    /**
     * 删除餐桌
     * @param id
     */
    int deleteBorderById(int id);
}
