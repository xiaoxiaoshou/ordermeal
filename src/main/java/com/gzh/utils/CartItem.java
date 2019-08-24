package com.gzh.utils;

import com.gzh.pojo.Product;

/**
 * @author eRunn
 * @create 2019-04-02 12:35
 */
public class CartItem {
    private Product product;
    private int count;
    private double subTotal;



    //小计
    public double GetSubTotal(){
        this.subTotal = count*product.getPrice();
        return count*product.getPrice();
    }

    public CartItem(Product product, int count) {
        this.product = product;
        this.count = count;
    }

    public CartItem() {
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public double getSubTotal() {
        return subTotal;
    }

    public void setSubTotal(double subTotal) {
        this.subTotal = subTotal;
    }
}
