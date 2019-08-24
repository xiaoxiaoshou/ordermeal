package com.gzh.controller.backend.order;

import com.gzh.pojo.OrderListUtil;
import com.gzh.service.OrderService;
import com.gzh.utils.ResponseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author eRunn
 * @create 2019-04-05 23:23
 */
@Controller
public class BackendOrderController {

    @Autowired
    private OrderService orderService;


    /**
     * 跳转到订单列表
     * @param model
     * @return
     */
    @RequestMapping("/backend/skipOrderList")
    public String skipToOrderList(Model model){

        List<OrderListUtil> orderListUtils = orderService.selectAllOrder();
        model.addAttribute("orderListUtils",orderListUtils);
        return "/backend/order/orderList";
    }

    /**
     * 跳转到单个订单详情页
     * @param model
     * @return
     */
    @RequestMapping("/backend/skipOrderDetails")
    public String skipToOrderDetails(@RequestParam("id")int id, Model model){


        System.out.println("skipOrderDetails");

        List<OrderListUtil> orderListUtils = orderService.selectOrderById(id);
        model.addAttribute("orderListUtils",orderListUtils);

        return "/backend/order/orderDetails";
    }

    /**
     * 用户支付后修改订单状态
     * @param id
     * @return
     */
    @RequestMapping("/backend/completeOrder")
    @ResponseBody
    public ResponseResult completeOrder(int id){

       ResponseResult responseResult = orderService.updateOrderStatusById(id);

        return responseResult;
    }

    /*--------------后厨-----------------------*/

    /**
     * 跳转到订单列表
     * @param model
     * @return
     */
    @RequestMapping("/backend/skipToKitchenOrder")
    public String skipToKitchenOrder(Model model){

        List<OrderListUtil> orderListUtils = orderService.selectAllOrderByIs_Do();
        model.addAttribute("orderListUtils",orderListUtils);
        return "backend/order/kitchenOrderList";
    }

    @RequestMapping("/backend/completeIs_Do")
    @ResponseBody
    public ResponseResult completeIs_Do(int id){

        ResponseResult responseResult = orderService.updateOrderIs_DoById(id);

        return responseResult;
    }
}
