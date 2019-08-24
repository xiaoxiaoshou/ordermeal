package com.gzh.dao;

import com.gzh.pojo.Order;
import com.gzh.pojo.OrderExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface OrderMapper {
    long countByExample(OrderExample example);

    int deleteByExample(OrderExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Order record);

    int insertSelective(Order record);

    List<Order> selectByExample(OrderExample example);

    List<Order> selectAllOrder();

    List<Order> selectAllOrderByIs_Do();

    Order selectByPrimaryKey(Integer id);

    Order selectOrderById(int id);

    int updateByExampleSelective(@Param("record") Order record, @Param("example") OrderExample example);

    int updateByExample(@Param("record") Order record, @Param("example") OrderExample example);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);

    int updateOrderStatusById(int id);

    int updateIsCommentById(Integer id);


    int updateOrderIs_DoById(int id);
}