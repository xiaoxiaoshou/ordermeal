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
                <button class="layui-btn layui-btn-small layui-btn-normal addUserBtn hidden-xs" data-url="${APP_PATH}/backend/skipToAddUser"><i class="layui-icon">&#xe654;</i></button>
            </div>
        </div>
    </form>
    <div class="layui-form" id="table-list">
        <table class="layui-table" lay-even lay-skin="nob">
            <thead>
            <tr>
                <th class="hidden-xs">ID</th>
                <th>用户名</th>
                <th>密码</th>
                <th>会员类型</th>
                <th>会员积分</th>
                <th>操作</th>
            </tr>
            </thead>
            <c:forEach items="${users}" var="user">
                <tr>
                    <th class="hidden-xs">${user.id}</th>
                    <th>${user.username}</th>
                    <th>${user.password}</th>
                    <th>
                        <c:if test="${user.vipType==0}">
                            普通会员
                        </c:if>
                        <c:if test="${user.vipType==1}">
                            黄金会员
                        </c:if>
                    </th>
                    <th>${user.integralNum}</th>
                    <td>
                        <div class="layui-inline">
                            <a class="layui-btn layui-btn-mini layui-btn-normal addUserBtn"  data-id="98" data-url="${APP_PATH}/backend/skipToAddUser"><i class="layui-icon">&#xe654;</i></a>
                            <a title="修改用户信息" class="layui-btn layui-btn-mini layui-btn-normal"  onclick="modifyUser(${user.id})" href="javascript:;">
                                <i class="layui-icon">&#xe642;</i>
                            </a>
                            <a title="删除用户" class="layui-btn layui-btn-mini layui-btn-danger"  onclick="deleteUser(${user.id})" href="javascript:;">
                                <i class="layui-icon">&#xe640;</i>
                            </a>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            <tbody>
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

    //修改用户信息
    function modifyUser(id) {
        layer.open({
            type: 2,
            title: '修改用户信息',
            shadeClose: true,
            shade: 0.8,
            area: ['500px', '350px'],
            content: '${APP_PATH}/backend/skipToModifyUser?id='+id //iframe的url
        });
    }

    //删除用户
    function deleteUser(id) {
        layer.confirm('确认删除该用户？',function(index){
            $.post(
                '${APP_PATH}/backend/deleteUser',
                {'id':id},
                function (result) {
                    if(result.status==1){
                        layer.msg('删除成功!',{icon:1,time:1000});
                        window.location.href="${APP_PATH}/backend/skipToUserList";
                    }
                }
            )


        });
    }


</script>
</body>

</html>
