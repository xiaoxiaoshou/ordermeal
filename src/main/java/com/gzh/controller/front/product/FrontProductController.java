package com.gzh.controller.front.product;

import com.gzh.pojo.Product;
import com.gzh.pojo.ProductType;
import com.gzh.service.ProductService;
import com.gzh.service.ProductTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import java.util.List;

/**
 * @author eRunn
 * @create 2019-03-26 20:48
 */
@Controller
public class FrontProductController {


    @Autowired
    private ProductService productService;

    @Autowired
    private ProductTypeService productTypeService;

    /**
     * 跳转到餐品列表
     * @return
     */
    @RequestMapping("/front/skipToFrontProductList")
    public String skipToProductList(Model model){

        List<Product> products = productService.selectAllProduct();
        List<ProductType> productTypes = productTypeService.selectAllProductType();
        model.addAttribute("products",products);
        model.addAttribute("productTypes",productTypes);

        return "/front/product/productList";
    }


    /**
     * 通过餐品类型查找餐品
     * @param type
     * @param model
     * @return
     */
    @RequestMapping("/front/selectByType")
    public String selectByType(String type,Model model){

        System.out.println("----------selectByType------------");
        System.out.println(type);

        List<Product> products = productService.selectByType(type);
        List<ProductType> productTypes = productTypeService.selectAllProductType();
        model.addAttribute("productTypes",productTypes);
        model.addAttribute("products",products);
        return "/front/product/productList";
    }


    /*@RequestMapping("/front/skipToProductDetail")
    public String skipToProductDetail(){

        return "/front/product/productDetail";
    }*/

}
