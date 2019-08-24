package com.gzh.service.impl;

import com.gzh.dao.BorderMapper;
import com.gzh.pojo.Border;
import com.gzh.service.BorderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author eRunn
 * @create 2019-04-05 14:55
 */
@Service
public class BorderServiceImpl implements BorderService {

    @Autowired
    private BorderMapper borderMapper;

    @Override
    public List<Border> selectBorderListByStatus() {

        List<Border> borders = borderMapper.selectBorderByStatus();

        return borders;
    }

    @Override
    public int updateBorderStatus(int id,int status) {
       return borderMapper.updateStatusById(id,status);
    }

    @Override
    public List<Border> selectAllBorder() {

        List<Border> borders = borderMapper.selectAllBorder();

        return borders;
    }

    @Override
    public int deleteBorderById(int id) {
        return borderMapper.deleteBoderById(id);
    }
}
