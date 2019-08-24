package com.gzh.test;

import com.gzh.pojo.Product;
import org.junit.Test;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

/**
 * @author eRunn
 * @create 2019-04-02 13:39
 */
public class MapTest {

    @Test
    public void test(){
       String realPath = "G:/zzzzzzzzz/线下点餐/html/ordermeal/target/gzh/";
        String substring = realPath.substring(0,realPath.length()-12);
        System.out.println(substring);

        String s = realPath.substring(0,realPath.lastIndexOf("/"));
        String ss = s.substring(0,s.lastIndexOf("/"));
        String sss = ss.substring(0,ss.lastIndexOf("/"));

        System.out.println(sss);

    }

}
