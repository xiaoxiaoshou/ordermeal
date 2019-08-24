package com.gzh.service.impl;

import com.gzh.dao.ProductTypeMapper;
import com.gzh.pojo.ProductType;
import com.gzh.pojo.ProductTypeExample;
import com.gzh.service.ProductTypeService;
import com.gzh.utils.ResponseResult;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author eRunn
 * @create 2019-04-03 20:27
 */
@Service
public class ProductTypeServiceImpl implements ProductTypeService {

    @Autowired
    private ProductTypeMapper productTypeMapper;

    @Override
    public ResponseResult addProductType(String type) {
        ProductType productType = new ProductType();
        productType.setType(type);
        int status = productTypeMapper.insertSelective(productType);

        if (status>0){
            return ResponseResult.success();
        }else {
            return ResponseResult.fail();
        }

    }

    @Override
    public List<ProductType> selectAllProductType() {

        List<ProductType> productTypes = productTypeMapper.selectAllProductType();

        if(productTypes==null){
            System.out.println("null");
        }

        return productTypes;
    }

    @Override
    public ProductType selectProductTypeById(int id) {
        ProductType productType = productTypeMapper.selectByPrimaryKey(id);
        return productType;
    }

    @Override
    public ResponseResult updateProductType(ProductType productType) {

        int status = productTypeMapper.updateByPrimaryKey(productType);

        if(status>0){
            return ResponseResult.success();
        }else {
            return ResponseResult.fail();
        }

    }

    @Override
    public ResponseResult deleteById(int id) {
        int i = productTypeMapper.deleteByPrimaryKey(id);

        if(i>0){
            return ResponseResult.success();
        }else {
            return ResponseResult.fail();
        }

    }

}
