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
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <div class="layui-inline tool-btn">
                <button class="layui-btn layui-btn-small layui-btn-normal addProductBtn hidden-xs" data-url="${APP_PATH}/backend/skipToAddProduct"><i class="layui-icon">&#xe654;</i></button>
            </div>
        </div>
    </form>
    <div class="layui-form" id="table-list">
        <table class="layui-table" lay-even lay-skin="nob">
            <thead>
            <tr>
                <th class="hidden-xs">ID</th>
                <th>餐品名称</th>
                <th>餐品价格</th>
                <th>餐品类型</th>
                <th>餐品图片</th>
                <th>餐品描述</th>
                <th>餐品状态</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${prducts}" var="product">
                <tr>
                    <td class="hidden-xs">${product.id}</td>
                    <td>${product.name}</td>
                    <td>${product.price}</td>
                    <td>${product.type}</td>
                    <td><img src="${REAL_PATH}${product.img}" style="width: 50px;height:50px;"></td>
                    <td>${product.describes}</td>
                    <td>
                        <c:if test="${product.status==1}">
                            <button class="layui-btn layui-btn-mini layui-btn-normal  table-list-status" data-status='${product.status}'>显示</button>
                        </c:if>
                        <c:if test="${product.status==0}">
                            <button class="layui-btn layui-btn-mini layui-btn-warm table-list-status" data-status='${product.status}'>隐藏</button>
                        </c:if>
                    </td>
                    <td>
                        <div class="layui-inline">
                            <a class="layui-btn layui-btn-mini layui-btn-normal  addProductBtn" data-id="1" data-url="${APP_PATH}/backend/skipToAddProduct"><i class="layui-icon">&#xe654;</i></a>
                            <a title="修改餐品" class="layui-btn layui-btn-mini layui-btn-normal"  onclick="modifyProduct(${product.id})" href="javascript:;">
                                <i class="layui-icon">&#xe642;</i>
                            </a>
                            <a title="删除餐品" class="layui-btn layui-btn-mini layui-btn-danger" onclick="deleteProductType(${product.id})" ><i class="layui-icon">&#xe640;</i></a>
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

    function modifyProduct(id) {
        layer.open({
            type: 2,
            title: '修改餐品信息',
            shadeClose: true,
            shade: 0.8,
            area: ['700px', '620px'],
            content: '${APP_PATH}/backend/skipToModifyProduct?id='+id //iframe的url
        });
    }

    //删除餐品
    function deleteProductType(id) {
       layer.confirm('确认删除该餐品类型？',function(index){
            $.post(
                '${APP_PATH}/backend/deleteProduct',
                {'id':id},
                function (result) {
                    if(result.status==1){
                        layer.msg('删除成功!',{icon:1,time:1000});
                        window.location.href="${APP_PATH}/backend/skipToProduct";
                    }
                }
            )
        });
    }

</script>
</body>

</html>
