package com.gzh.pojo;

public class User {
    private Integer id;

    private String username;

    private String password;

    private String vipType;

    private Double integralNum;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getVipType() {
        return vipType;
    }

    public void setVipType(String vipType) {
        this.vipType = vipType == null ? null : vipType.trim();
    }

    public Double getIntegralNum() {
        return integralNum;
    }

    public void setIntegralNum(Double integralNum) {
        this.integralNum = integralNum;
    }
}