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
    <title>订单详情</title>
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/admin/layui/css/layui.css" />
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/admin/css/admin.css" />
</head>

<body>
<div class="page-content-wrap">
    <div class="layui-form" id="table-list">
        <table class="layui-table" lay-even lay-skin="nob">
            <thead>
            <tr>
                <th>餐品名称</th>
                <th>餐品价格</th>
                <th>餐品数量</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${orderListUtils}" var="orderListUtil">
                <c:forEach items="${orderListUtil.orderDatails}" var="details">
                    <tr>
                        <td>${details.name}</td>
                        <td>${details.price}￥</td>
                        <td>${details.count}</td>
                    </tr>
                </c:forEach>
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

        //修改状态
        $('#table-list').on('click', '.table-list-status', function(data) {

            var That = $(this);
            var id1 = That.parent().parent().children().html();
            var status = That.attr('data-status');
            var id = That.parent().attr('data-id');

            $.post(
                '${APP_PATH}/backend/updateProductStatus',
                {'id':id1},
                function (result) {
                    if(result.status==1){
                        if(status == 1) {
                            That.removeClass('layui-btn-normal').addClass('layui-btn-warm').html('隐藏').attr('data-status', 0);
                        } else if(status == 0) {
                            That.removeClass('layui-btn-warm').addClass('layui-btn-normal').html('显示').attr('data-status', 1);

                        }
                    }
                }
            )


        })


    });



</script>
</body>

</html>
