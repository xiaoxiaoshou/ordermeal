package com.gzh.service;

import com.gzh.pojo.ProductType;
import com.gzh.utils.ResponseResult;

import java.util.List;

/**
 * @author eRunn
 * @create 2019-04-03 20:27
 */
public interface ProductTypeService {

    /**
     * 添加餐品类型
     * @param type
     * @return
     */
    public ResponseResult addProductType(String type);

    /**
     * 查询所有餐品类型
     * @return
     */
    List<ProductType> selectAllProductType();

    /**
     * 通过id查询餐品类型
     * @param id
     * @return
     */
    ProductType selectProductTypeById(int id);

    /**
     * 更新餐品类型信息
     * @param productType
     * @return
     */
    ResponseResult updateProductType(ProductType productType);

    /**
     * 根据id删除餐品类型
     * @param id
     * @return
     */
    ResponseResult deleteById(int id);
}
