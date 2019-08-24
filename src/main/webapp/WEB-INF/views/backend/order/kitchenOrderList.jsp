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
                <th>餐桌号</th>
                <th>创建时间</th>
                <th>订单详情</th>
                <th>是否上餐</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${orderListUtils}" var="orderListUtil">
                <tr>
                    <td class="hidden-xs">${orderListUtil.order.id}</td>
                    <td>${orderListUtil.order.boardId}</td>
                    <td>${orderListUtil.order.createTime}</td>
                    <td>
                        <a href="javascript:;" onclick="ToOrderDetails(${orderListUtil.order.id})">查看订单详情</a>
                    </td>
                    <td>
                        <c:if test="${orderListUtil.order.isDo==1}">
                            已上
                        </c:if>
                        <c:if test="${orderListUtil.order.isDo==0}">
                            未上
                        </c:if>
                    </td>
                    <td>
                        <div class="layui-inline">
                            <a title="上餐完成" class="layui-btn layui-btn-mini layui-btn-normal"  onclick="completeIs_Do(${orderListUtil.order.id})" href="javascript:;">
                                <i class="layui-icon">&#xe630;</i>
                            </a>
                        </div>
                    </td>
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

    function ToOrderDetails(id) {
        layer.open({
            type: 2,
            title: '订单详情',
            shadeClose: true,
            shade: 0.8,
            area: ['400px', '500px'],
            content: '${APP_PATH}/backend/skipOrderDetails?id='+id //iframe的url
        });
    }

    //用户已支付完成,修改订单状态
    function completeIs_Do(id) {
        alert(id);
        layer.confirm('确认该订单已上餐？',function(index){
            $.post(
                '${APP_PATH}/backend/completeIs_Do',
                {'id':id},
                function (result) {
                    if(result.status==1){
                        layer.msg('完成!',{icon:1,time:1000});
                        window.location.href="${APP_PATH}/backend/skipToKitchenOrder"
                    }
                }
            )


        });
    }


</script>
</body>

</html>
