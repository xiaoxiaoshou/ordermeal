package com.gzh.service.impl;

import com.gzh.dao.OrderMapper;
import com.gzh.pojo.*;
import com.gzh.service.BorderService;
import com.gzh.service.OrderService;
import com.gzh.utils.Cart;
import com.gzh.utils.CartItem;
import com.gzh.utils.ResponseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * @author eRunn
 * @create 2019-04-05 11:32
 */
@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper orderMapper;

    @Autowired
    private BorderService borderService;

    @Override
    public ResponseResult addOrder(Cart cart, User user) {
        Order order = new Order();
        try {
            String cartDetails = "";
            Collection<CartItem> cartItems = cart.getCartItems();
            boolean isAppend = false;
            for (CartItem cartItem : cartItems){
                String midDetails = "";
                midDetails+=cartItem.getProduct().getName()+"-"+cartItem.getProduct().getPrice()+"-"+cartItem.getCount();
                if(isAppend){
                    cartDetails+="/"+midDetails;
                }else{
                    cartDetails+=midDetails;
                    isAppend=true;
                }
            }
            List<Border> borders = borderService.selectBorderListByStatus();
            int borderId= 0;
            for(Border border : borders){
                borderId = border.getId();
                break;
            }

            //修改餐桌状态
            borderService.updateBorderStatus(borderId,0);

            order.setDatails(cartDetails);
            order.setBoardId(borderId);
            order.setUserId(1);
            order.setTotal(cart.getTotal());
            order.setUserId(user.getId());

            int sss = orderMapper.insertSelective(order);

            System.out.println(sss);


        }catch (Exception e){
            e.printStackTrace();
            System.out.println("添加订单失败");
        }
        return ResponseResult.success(order);
    }

    @Override
    public List<OrderListUtil> selectAllOrder() {

        List<Order> orders = orderMapper.selectAllOrder();
        List<OrderListUtil> orderListUtils = new ArrayList<>();
        for (Order order : orders){
            OrderListUtil orderListUtil = new OrderListUtil();

            String midDatails = order.getDatails();
            String[] split = midDatails.split("/");
            //订单信息信息
           List<OrderDetails> listOrderDetail = new ArrayList<>();
            for(String sp : split){
                String[] split1 = sp.split("-");
                OrderDetails orderDatai = new OrderDetails();
               orderDatai.setName(split1[0]);
               orderDatai.setPrice(split1[1]);
               orderDatai.setCount(split1[2]);
               listOrderDetail.add(orderDatai);
            }

            orderListUtil.setOrder(order);
            orderListUtil.setOrderDatails(listOrderDetail);
            orderListUtils.add(orderListUtil);
        }

        return orderListUtils;
    }

    @Override
    public List<OrderListUtil> selectOrderById(int orderid) {

      Order order = orderMapper.selectOrderById(orderid);
        List<OrderListUtil> orderListUtils = new ArrayList<>();
        OrderListUtil orderListUtil = new OrderListUtil();

        String midDatails = order.getDatails();
        String[] split = midDatails.split("/");
        //订单信息信息
        List<OrderDetails> listOrderDetail = new ArrayList<>();

        for(String sp : split){
            String[] splits = sp.split("-");
            OrderDetails orderDatai = new OrderDetails();
            orderDatai.setName(splits[0]);
            orderDatai.setPrice(splits[1]);
            orderDatai.setCount(splits[2]);
            listOrderDetail.add(orderDatai);
        }

        orderListUtil.setOrder(order);
        orderListUtil.setOrderDatails(listOrderDetail);
        orderListUtils.add(orderListUtil);

        return orderListUtils;
    }

    @Override
    public ResponseResult updateOrderStatusById(int id) {
        int status = orderMapper.updateOrderStatusById(id);

        if(status>0){
            return ResponseResult.success();
        }else {
            return ResponseResult.fail();
        }
    }

    @Override
    public int updateOrderComment(Integer id) {

      int  status =  orderMapper.updateIsCommentById(id);

        return 0;
    }

    @Override
    public List<OrderListUtil> selectAllOrderByIs_Do() {

        List<Order> orders = orderMapper.selectAllOrderByIs_Do();
        List<OrderListUtil> orderListUtils = new ArrayList<>();
        for (Order order : orders){
            OrderListUtil orderListUtil = new OrderListUtil();

            String midDatails = order.getDatails();
            String[] split = midDatails.split("/");
            //订单信息信息
            List<OrderDetails> listOrderDetail = new ArrayList<>();
            for(String sp : split){
                String[] split1 = sp.split("-");
                OrderDetails orderDatai = new OrderDetails();
                orderDatai.setName(split1[0]);
                orderDatai.setPrice(split1[1]);
                orderDatai.setCount(split1[2]);
                listOrderDetail.add(orderDatai);
            }

            orderListUtil.setOrder(order);
            orderListUtil.setOrderDatails(listOrderDetail);
            orderListUtils.add(orderListUtil);
        }


        return orderListUtils;
    }

    @Override
    public ResponseResult updateOrderIs_DoById(int id) {

       int status = orderMapper.updateOrderIs_DoById(id);
        if(status>0){
            return ResponseResult.success();
        }else {
            return ResponseResult.fail();
        }
    }
}
