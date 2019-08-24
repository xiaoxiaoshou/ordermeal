package com.gzh.controller.front.order;

import com.gzh.pojo.OrderDetails;
import com.gzh.pojo.OrderListUtil;
import com.gzh.pojo.User;
import com.gzh.service.OrderService;
import com.gzh.utils.Cart;
import com.gzh.utils.ResponseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author eRunn
 * @create 2019-03-28 21:57
 */
@Controller
public class FrontOrderController {


    @Autowired
    private OrderService orderService;

    /**
     * 跳转到订单页面
     * @param model
     * @return
     */
    @RequestMapping("/front/skipToOrder")
    public String skipToOrder(Model model){

        System.out.println("------skipToOrder-------");

        List<OrderListUtil> orderListUtils = orderService.selectAllOrder();
        model.addAttribute("orderListUtils",orderListUtils);

         for (OrderListUtil orderListUtil : orderListUtils){
             System.out.println(orderListUtil.getOrder().getDatails());
         }

        return "/front/order/orderList";
    }

    /**
     * 确认并提交订单
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/front/confirmCart")
    public String confirmCart(HttpServletRequest request, Model model){

        HttpSession session = request.getSession();
        Cart carts = (Cart)session.getAttribute("carts");
        User user = (User)session.getAttribute("userSession");

        ResponseResult responseResult = orderService.addOrder(carts,user);

        return "redirect:/front/skipToOrder";
    }

}
