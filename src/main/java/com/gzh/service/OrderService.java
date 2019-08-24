package com.gzh.service;

import com.gzh.pojo.OrderListUtil;
import com.gzh.pojo.User;
import com.gzh.utils.Cart;
import com.gzh.utils.ResponseResult;

import java.util.List;

/**
 * @author eRunn
 * @create 2019-04-05 11:31
 */
public interface OrderService {

    /**
     * 提交订单
     * @param cart
     * @return
     */
    public ResponseResult addOrder(Cart cart, User user);

    /**
     * 查询所有订单
     * @return
     */
    List<OrderListUtil> selectAllOrder();

    /**
     * 根据id查询订单
     * @param orderid
     * @return
     */
    List<OrderListUtil> selectOrderById(int orderid);

    /**
     * 订单完成修改订单状态
     * @param id
     * @return
     */
    ResponseResult updateOrderStatusById(int id);

    /**
     * 用户评价后将该订单改为已评价
     * @param orderId
     * @return
     */
    int updateOrderComment(Integer orderId);

    /**
     * 查看未上餐的订单
     * @return
     */
    List<OrderListUtil> selectAllOrderByIs_Do();

    /**
     * 后厨完成，修改订单状态
      * @param id
     * @return
     */
    ResponseResult updateOrderIs_DoById(int id);
}
