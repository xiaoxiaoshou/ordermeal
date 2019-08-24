package com.gzh.pojo;

import java.util.List;

/**
 * @author eRunn
 * @create 2019-04-05 21:25
 */
public class OrderListUtil {
    private Order order;
    private List<OrderDetails> orderDatails;

    public OrderListUtil(Order order, List<OrderDetails> orderDatails) {
        this.order = order;
        this.orderDatails = orderDatails;
    }

    public OrderListUtil() {
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public List<OrderDetails> getOrderDatails() {
        return orderDatails;
    }

    public void setOrderDatails(List<OrderDetails> orderDatails) {
        this.orderDatails = orderDatails;
    }
}
