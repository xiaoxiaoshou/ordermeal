package com.gzh.pojo;

import java.util.Date;

public class Order {
    private Integer id;

    private Integer boardId;

    private Integer userId;

    private Date createTime;

    private String datails;

    private Double total;

    private Integer isDo;

    private Integer isComment;

    private Integer status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getBoardId() {
        return boardId;
    }

    public void setBoardId(Integer boardId) {
        this.boardId = boardId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getDatails() {
        return datails;
    }

    public void setDatails(String datails) {
        this.datails = datails;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    public Integer getIsDo() {
        return isDo;
    }

    public void setIsDo(Integer isDo) {
        this.isDo = isDo;
    }

    public Integer getIsComment() {
        return isComment;
    }

    public void setIsComment(Integer isComment) {
        this.isComment = isComment;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

}