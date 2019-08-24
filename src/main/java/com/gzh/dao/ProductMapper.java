package com.gzh.dao;

import com.gzh.pojo.Product;
import com.gzh.pojo.ProductExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ProductMapper {
    long countByExample(ProductExample example);

    int deleteByExample(ProductExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Product record);

    int insertSelective(Product record);

    List<Product> selectByExample(ProductExample example);

    List<Product> selectAllProduct();

    Product selectByPrimaryKey(Integer id);

    List<Product> selectByType(String type);

    int selectProductStatusById(int id);

    int updateByExampleSelective(@Param("record") Product record, @Param("example") ProductExample example);

    int updateByExample(@Param("record") Product record, @Param("example") ProductExample example);

    int updateByPrimaryKeySelective(Product record);

    int updateByPrimaryKey(Product record);

    int updateStatusById(@Param("status") int status,@Param("id") int id);


}