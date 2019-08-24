package com.gzh.service.impl;

import com.gzh.dao.ProductMapper;
import com.gzh.pojo.Product;
import com.gzh.service.ProductService;
import com.gzh.utils.ResponseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.util.List;


@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductMapper productMapper;

    @Override
    public ResponseResult addProduct(MultipartFile file, Product product,String uploadPath) {
        try {
            System.out.println("上传文件");
            File path = new File(uploadPath );
            if(!path.exists()){
                path.mkdirs();
            }
            file.transferTo(path);
        } catch (IOException e) {
            e.printStackTrace();
        }


        int status = productMapper.insertSelective(product);
        System.out.println(status+"----------------");

        if (status>0){
            return ResponseResult.success();
        }else {
            return ResponseResult.fail();
        }

    }

    @Override
    public List<Product> selectAllProduct() {

        List<Product> products = productMapper.selectAllProduct();

        return products;
    }

    @Override
    public ResponseResult updateProductStatus(int id) {

        int status =  productMapper.selectProductStatusById(id);

        if(status==1){
            status=0;
            productMapper.updateStatusById(status,id);
        }else{
            status=1;
            productMapper.updateStatusById(status,id);
        }

        return ResponseResult.success();
    }

    @Override
    public Product selectProductById(Integer id) {
        Product product = productMapper.selectByPrimaryKey(id);

        return product;
    }

    @Override
    public ResponseResult updateProduct(Product product) {

        int i = productMapper.updateByPrimaryKeySelective(product);

        if (i>0){
          return   ResponseResult.success();
        }else {
            return ResponseResult.fail();
        }
    }

    @Override
    public ResponseResult deleteById(int id) {

        int i = productMapper.deleteByPrimaryKey(id);
        if (i>0){
            return   ResponseResult.success();
        }else {
            return ResponseResult.fail();
        }
    }

    @Override
    public List<Product> selectByType(String type) {

        List<Product> products  = productMapper.selectByType(type);

        return products;
    }
}
