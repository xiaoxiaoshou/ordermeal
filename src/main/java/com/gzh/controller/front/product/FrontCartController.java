package com.gzh.controller.front.product;

import com.gzh.pojo.Product;
import com.gzh.service.ProductService;
import com.gzh.utils.Cart;
import com.gzh.utils.CartItem;
import com.gzh.utils.ResponseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;


@Controller
public class FrontCartController {

    @Autowired
    private ProductService productService;

    @RequestMapping("/front/skipToCart")
    public String skipToCart( HttpServletRequest request) {

        HttpSession session = request.getSession();
        Cart carts = (Cart)session.getAttribute("carts");



        System.out.println("----跳转到购物车----");
        return "/front/product/Cart";
    }

    /**
     * 添加到购物车
     * @param request
     * @return
     */
    @RequestMapping("/front/addToCart")
    public String skipToCarts(Integer id, HttpServletRequest request,ModelAndView modelAndView){

       Product product = productService.selectProductById(id);

        HttpSession session = request.getSession();
        Cart carts = (Cart) session.getAttribute("carts");
        if(carts==null){
            carts = new Cart();
        }
        CartItem cartItem = new CartItem();
        cartItem.setProduct(product);
        cartItem.setCount(1);
        cartItem.GetSubTotal();

        carts.addItem(cartItem);
        carts.getTotal();

        System.out.println("-----"+carts.getTotal()+"-----");
        session.setAttribute("carts",carts);
        return "/front/product/Cart";
    }

    /**
     * 修改商品数量
     * @param id
     * @param num
     * @param request
     * @return
     */
    @RequestMapping("/front/modifyItemNum")
    @ResponseBody
    public ResponseResult modifyItemNum(int id,int num,HttpServletRequest request){

        Product product = productService.selectProductById(id);
        CartItem cartItem = new CartItem();
        cartItem.setProduct(product);
        cartItem.setCount(num);
        cartItem.getSubTotal();

        HttpSession session = request.getSession();
        Cart carts = (Cart)session.getAttribute("carts");
        if(carts==null){
            carts = new Cart();
        }

        carts.modifyItemCount(cartItem);
        session.setAttribute("carts",carts);

        Map carMap = new HashMap();
        carMap.put("total",carts.getTotal());
        carMap.put("subTotal",cartItem.GetSubTotal());


       return ResponseResult.success(carMap);
    }



    @RequestMapping("/front/deleteItem")
    public String deleteItem(int id,HttpServletRequest request){

        HttpSession session = request.getSession();
        Cart carts = (Cart)session.getAttribute("carts");
        carts.deleteItem(id);

        return "redirect:/front/skipToCart";
    }



}
