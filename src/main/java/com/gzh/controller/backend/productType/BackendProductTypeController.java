package com.gzh.controller.backend.productType;

import com.gzh.pojo.ProductType;
import com.gzh.service.ProductTypeService;
import com.gzh.utils.ResponseResult;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author eRunn
 * @create 2019-04-02 16:50
 */
@Controller
public class BackendProductTypeController {

    @Autowired
    private ProductTypeService productTypeService;

    /**
     * 跳转到餐品类型列表
     * @param model
     * @return
     */
    @RequestMapping("/backend/skipToProductType")
    public String skipToProductTypeList(Model model){

        System.out.println("*****");
        List<ProductType> productTypes = productTypeService.selectAllProductType();
        for (ProductType productType : productTypes){
            System.out.println(productType.getType());
        }


        model.addAttribute("productTypes",productTypes);
        return "/backend/productType/productTypeList";
    }

    @RequestMapping("/backend/skipToAddProductType")
    public String skipToAddProductType(){

        System.out.println("******");
        return "/backend/productType/addProductType";
    }

    /**
     * 添加餐品类型
     * @param type
     * @return
     */
    @RequestMapping("/backend/addProductType")
    @ResponseBody
    public ResponseResult addProductType(String type){

        System.out.println(type+"----");
        ResponseResult responseResult = productTypeService.addProductType(type);
        System.out.println(responseResult.getStatus());
        return responseResult;
    }

    /**
     * 跳转到修改餐品类型页面
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/backend/skipToModifyProductType")
    public String skipToModifyProductType(String id,Model model){

      ProductType productType = productTypeService.selectProductTypeById(Integer.parseInt(id));

      model.addAttribute("productType",productType);
        return "backend/productType/modifyProductType";
    }

    /**
     * 修改餐品类型
     * @param productType
     * @return
     */
    @RequestMapping("/backend/modifyProductType")
    @ResponseBody
    public ResponseResult modifyProductType(ProductType productType){

        System.out.println("----------modifyProductType-------------");

       ResponseResult responseResult = productTypeService.updateProductType(productType);

       return responseResult;
    }

    @RequestMapping("/backend/deleteProductType")
    @ResponseBody
    public ResponseResult deleteProductType(int id){

        ResponseResult responseResult = productTypeService.deleteById(id);

        return responseResult;
    }
}
