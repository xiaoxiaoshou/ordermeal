package com.gzh.pojo;

public class ProductType {
    private Integer id;

    private String type;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public ProductType(Integer id, String type) {
        this.id = id;
        this.type = type;
    }

    public ProductType() {
    }
}