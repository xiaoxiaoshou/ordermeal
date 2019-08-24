package com.gzh.utils;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

/**
 * @author eRunn
 * @create 2019-04-02 12:32
 */
public class Cart {

    private Map<Integer,CartItem> map = new HashMap<>();

    private double sum;

    /**
     * 获取总和
     * @return
     */
    public double getTotal(){
        double sum=0;
        for(Integer key :map.keySet()){
            CartItem cartItem = map.get(key);
            sum += cartItem.GetSubTotal();
        }
        this.sum = sum;
        return sum;
    }

    /**
     * 获取购物单
     * @return
     */
    public Collection<CartItem> getCartItems(){
        return map.values();
    }

    /**
     * 修改单个商品数量
     * @param cartItem
     */
    public void modifyItemCount(CartItem cartItem){
        System.out.println(cartItem.getCount());
        if (map.containsKey(cartItem.getProduct().getId())){
            CartItem cartItemMid = map.get(cartItem.getProduct().getId());
            map.put(cartItemMid.getProduct().getId(),cartItem);
        }else{
            map.put(cartItem.getProduct().getId(),cartItem);
        }
        this.getTotal();
    }

    /**
     * 添加商品
     * @param cartItem
     */
    public void addItem(CartItem cartItem){
        if (map.containsKey(cartItem.getProduct().getId())){
            CartItem cartItemMid = map.get(cartItem.getProduct().getId());
            cartItemMid.setCount(cartItem.getCount()+1);
            map.put(cartItemMid.getProduct().getId(),cartItem);
        }else{
            map.put(cartItem.getProduct().getId(),cartItem);
        }
        this.getTotal();
    }

    /**
     * 从购物车中删除某个商品
     */
    public void deleteItem(Integer id){
        CartItem cartItem = map.get(id);
        map.remove(id);
    }


    public Map<Integer, CartItem> getMap() {
        return map;
    }

    public void setMap(Map<Integer, CartItem> map) {
        this.map = map;
    }

    public double getSum() {
        return sum;
    }

    public void setSum(double sum) {
        this.sum = sum;
    }
}
