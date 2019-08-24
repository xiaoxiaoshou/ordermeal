package com.gzh.dao;

import com.gzh.pojo.Border;
import com.gzh.pojo.BorderExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface BorderMapper {
    long countByExample(BorderExample example);

    int deleteByExample(BorderExample example);

    int insert(Border record);

    int insertSelective(Border record);

    List<Border> selectByExample(BorderExample example);

    List<Border> selectBorderByStatus();

    int selectStatusById(int id);

    int updateByExampleSelective(@Param("record") Border record, @Param("example") BorderExample example);

    int updateByExample(@Param("record") Border record, @Param("example") BorderExample example);

    int updateStatusById(@Param("id") int id,@Param("status") int status);

    List<Border> selectAllBorder();

    int deleteBoderById(int id);
}