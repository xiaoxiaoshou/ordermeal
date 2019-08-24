package com.gzh.service;

import com.gzh.pojo.Product;
import com.gzh.utils.ResponseResult;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * @author eRunn
 * @create 2019-04-03 16:44
 */
public interface ProductService {

    /**
     * 添加餐品
     * @param file
     * @param product
     * @return
     */
    public ResponseResult addProduct(MultipartFile file, Product product, String realPath);

    /**
     * 查询所有餐品
     * @return
     */
    List<Product> selectAllProduct();

    /**
     * 修改餐品状态，0为隐藏(前台)，1为显示
     * @param id
     * @return
     */
    ResponseResult updateProductStatus(int id);


    /**
     * 通过id查询餐品
     * @param id
     * @return
     */
    Product selectProductById(Integer id);

    /**
     * 修改餐品信息
     * @param product
     * @return
     */
    ResponseResult updateProduct(Product product);

    /**
     * 根据id删除餐品
     * @param id
     * @return
     */
    ResponseResult deleteById(int id);


    /**
     * 根据类型查找餐品
     * @param type
     * @return
     */
    List<Product> selectByType(String type);
}
