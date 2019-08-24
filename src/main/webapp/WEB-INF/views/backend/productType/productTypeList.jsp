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
    <title>餐品类型</title>
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/admin/layui/css/layui.css" />
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/admin/css/admin.css" />
</head>

<body>
<div class="page-content-wrap">
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <div class="layui-inline tool-btn">
                <button class="layui-btn layui-btn-small layui-btn-normal addProductTypeBtn hidden-xs" data-url="${APP_PATH}/backend/skipToAddProductType"><i class="layui-icon">&#xe654;</i></button>
            </div>
        </div>
    </form>
    <div class="layui-form" id="table-list">
        <table class="layui-table" lay-even lay-skin="nob">
            <thead>
            <tr>
                <th class="hidden-xs">ID</th>
                <th>餐品类型</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${productTypes}" var="productType">
                <tr>
                    <td class="hidden-xs">${productType.id}</td>
                    <td>${productType.type}</td>
                    <td>
                        <div class="layui-inline">
                            <a class="layui-btn layui-btn-mini layui-btn-normal addProductTypeBtn"  data-id="98" data-url="${APP_PATH}/backend/skipToAddProductType"><i class="layui-icon">&#xe654;</i></a>
                            <a title="修改餐品类型" class="layui-btn layui-btn-mini layui-btn-normal"  onclick="modifyProductType(${productType.id})" href="javascript:;">
                                <i class="layui-icon">&#xe642;</i>
                            </a>
                            <a title="删除餐品类型" class="layui-btn layui-btn-mini layui-btn-danger"  onclick="deleteProductType(${productType.id})" href="javascript:;">
                                <i class="layui-icon">&#xe640;</i>
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

        //修改状态
        $('#table-list').on('click', '.table-list-status', function() {
            var That = $(this);
            var status = That.attr('data-status');
            var id = That.parent().attr('data-id');
            if(status == 1) {
                That.removeClass('layui-btn-normal').addClass('layui-btn-warm').html('隐藏').attr('data-status', 2);
            } else if(status == 2) {
                That.removeClass('layui-btn-warm').addClass('layui-btn-normal').html('显示').attr('data-status', 1);
            }
        })
    });

    //修改餐品类型信息
    function modifyProductType(id) {
        layer.open({
            type: 2,
            title: '修改餐品类型信息',
            shadeClose: true,
            shade: 0.8,
            area: ['400px', '200px'],
            content: '${APP_PATH}/backend/skipToModifyProductType?id='+id //iframe的url
        });
    }

    //删除餐品类型
    function deleteProductType(id) {
        layer.confirm('确认删除该餐品类型？',function(index){
            $.post(
                '${APP_PATH}/backend/deleteProductType',
                {'id':id},
                function (result) {
                    if(result.status==1){
                        layer.msg('删除成功!',{icon:1,time:1000});
                        window.location.href="${APP_PATH}/backend/skipToProductType";
                    }
                }
            )
        });
    }

</script>
</body>

</html>
