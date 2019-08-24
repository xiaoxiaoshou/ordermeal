<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/26
  Time: 15:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../include/head.jsp"%>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <title>网站后台管理模版</title>
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/admin/layui/css/layui.css" />
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/admin/css/admin.css" />
</head>

<body>
<div class="page-content-wrap">
    <div class="layui-form" id="table-list">
        <table class="layui-table" lay-even lay-skin="nob">
            <thead>
            <tr>
                <th class="hidden-xs">ID</th>
                <th>用户id</th>
                <th>订单id</th>
                <th>评价内容</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${comments}" var="comment">
                <tr>
                    <td class="hidden-xs">${comment.id}</td>
                    <td>${comment.userId}</td>
                    <td>${comment.orderId}</td>
                    <td>${comment.describe}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<script src="${APP_PATH}/static/admin/layui/layui.js" type="text/javascript" charset="utf-8"></script>
<script src="${APP_PATH}/static/admin/js/common.js" type="text/javascript" charset="utf-8"></script>
<script src="${APP_PATH}/static/admin/js/jquery.js" type="text/javascript" charset="utf-8"></script>

<script>
    layui.use(['form', 'jquery', 'layer', 'dialog'], function() {
        var $ = layui.jquery;


    });



</script>
</body>

</html>
