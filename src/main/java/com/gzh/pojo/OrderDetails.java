package com.gzh.pojo;

import java.util.*;

/**
 * 这是一个辅助显示订单的类
 * @author eRunn
 * @create 2019-04-05 20:35
 */
public class OrderDetails {

    private String name;
    private String price;
    private String count;

    public OrderDetails(String name, String price, String count) {
        this.name = name;
        this.price = price;
        this.count = count;
    }

    public OrderDetails() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getCount() {
        return count;
    }

    public void setCount(String count) {
        this.count = count;
    }
}
