<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/26
  Time: 14:50
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
    <title>点餐管理系统</title>
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/admin/layui/css/layui.css"/>
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/admin/css/admin.css"/>
</head>
<body>
<div class="main-layout" id='main-layout'>
    <!--侧边栏-->
    <div class="main-layout-side">
        <div class="m-logo">
        </div>
        <ul class="layui-nav layui-nav-tree" lay-filter="leftNav">
            <li class="layui-nav-item<%-- layui-nav-itemed--%>">
                <a href="javascript:;"><i class="iconfont">&#xe607;</i>订单管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:;" data-url="${APP_PATH}/backend/skipToKitchenOrder" data-id='1' data-text="查看订单"><span class="l-line"></span>查看订单</a></dd>
                </dl>
            </li>
        </ul>
    </div>
    <!--右侧内容-->
    <div class="main-layout-container">
        <!--头部-->
        <div class="main-layout-header">
            <div class="menu-btn" id="hideBtn">
                <a href="javascript:;">
                    <span class="iconfont">&#xe60e;</span>
                </a>
            </div>
            <ul class="layui-nav" lay-filter="rightNav">
                <c:if test="${businessSession.username!=null}">
                    <li class="layui-nav-item">
                        <a href="javascript:;">欢迎您:${businessSession.username}</a>
                    </li>
                    <li class="layui-nav-item"><a href="${APP_PATH}/backend/loginOut">退出</a></li>
                </c:if>
            </ul>
        </div>
        <!--主体内容-->
        <div class="main-layout-body">
            <!--tab 切换-->
            <div class="layui-tab layui-tab-brief main-layout-tab" lay-filter="tab" lay-allowClose="true">
                <ul class="layui-tab-title">
                    <li class="layui-this welcome">后台主页</li>
                </ul>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show" style="background: #f5f5f5;">
                        <!--1-->
                        <iframe src="${APP_PATH}/backend/skipToWelcome2" width="100%" height="100%" name="iframe" scrolling="auto" class="iframe" framborder="0"></iframe>
                        <!--1end-->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--遮罩-->
    <div class="main-mask">

    </div>
</div>
<script type="text/javascript">
    /*var scope={
        link:'./welcome.html'
    }*/
</script>
<script src="${APP_PATH}/static/admin/layui/layui.js" type="text/javascript" charset="utf-8"></script>
<script src="${APP_PATH}/static/admin/js/common.js" type="text/javascript" charset="utf-8"></script>
<script src="${APP_PATH}/static/admin/js/main.js" type="text/javascript" charset="utf-8"></script>

</body>
</html>

