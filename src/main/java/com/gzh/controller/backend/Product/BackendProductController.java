package com.gzh.controller.backend.Product;

import com.gzh.pojo.Product;
import com.gzh.pojo.ProductType;
import com.gzh.service.ProductService;
import com.gzh.service.ProductTypeService;
import com.gzh.utils.ResponseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;


@Controller
public class BackendProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private ProductTypeService productTypeService;

    /**
     * 跳转到餐品列表
     * @param model
     * @return
     */
    @RequestMapping("/backend/skipToProduct")
    public String skipToProduct(Model model) {

        List<Product> products = productService.selectAllProduct();

        for (Product product : products){
            System.out.println(product.getName());
        }

        model.addAttribute("prducts",products);
        return "backend/product/productList";
    }

    /**
     * 跳转到添加餐品页面
     * @param model
     * @return
     */
    @RequestMapping("/backend/skipToAddProduct")
    public String skipToAddProduct(Model model){

        List<ProductType> productTypes = productTypeService.selectAllProductType();

        model.addAttribute("productTypes",productTypes);

        return "/backend/product/addProduct";
    }


    /**
     * 添加餐品
     * @param file
     * @param name
     * @param price
     * @param status
     * @param describes
     * @param type
     * @param request
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/backend/addProduct",headers = "content-type=multipart/*",method = RequestMethod.POST)
    @ResponseBody
    public ResponseResult addDoctor(@RequestParam("file") MultipartFile file, String name, double price, int status,
                                    String describes, String type, HttpServletRequest request) throws IOException {

        String realPath = request.getServletContext().getRealPath("");

        String realPath1 = realPath.substring(0,realPath.length()-12);
        realPath1 = realPath1+"/src/main/webapp";

        String uploadPath = realPath1 + "/upload/img/" + file.getOriginalFilename();
        String contextPath = request.getContextPath()+"/upload/img/"+file.getOriginalFilename();

        System.out.println(uploadPath);
        Product product = new Product();
        product.setPrice(price);
        product.setName(name);
        product.setDescribes(describes);
        product.setStatus(status);
        product.setType(type);
        product.setImg(contextPath);

        productService.addProduct(file,product,uploadPath);


        return ResponseResult.success();
    }


    /**
     * 修改餐品状态
     * @param id
     * @return
     */
    @RequestMapping("/backend/updateProductStatus")
    @ResponseBody
    public ResponseResult updateProductStatus(int id){

        ResponseResult responseResult = productService.updateProductStatus(id);

        return ResponseResult.success();
    }

    @RequestMapping("/backend/skipToModifyProduct")
    public String skipToModifyProduct(int id,Model model){

        Product product = productService.selectProductById(id);
        List<ProductType> productTypes = productTypeService.selectAllProductType();
        model.addAttribute("product",product);
        model.addAttribute("productTypes",productTypes);
        return "backend/product/modifyProduct";
    }


    /**
     * 修改餐品信息
     * @param name
     * @param price
     * @param status
     * @param describes
     * @param type
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/backend/modifyProduct",headers = "content-type=multipart/*",method = RequestMethod.POST)
    @ResponseBody
    public ResponseResult modifyProduct( String name, double price, int status,
                                    String describes, String type,int id) {

        Product product = new Product();
        product.setStatus(status);
        product.setPrice(price);
        product.setName(name);
        product.setDescribes(describes);
        product.setType(type);
        product.setId(id);

        ResponseResult responseResult = productService.updateProduct(product);

        return ResponseResult.success();
    }


    /**
     * 根据id删除餐品
     * @param id
     * @return
     */
    @RequestMapping("/backend/deleteProduct")
    @ResponseBody
    public ResponseResult deleteProduct(int id){

        ResponseResult responseResult = productService.deleteById(id);

        return responseResult;
    }

}
