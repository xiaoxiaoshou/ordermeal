<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/25
  Time: 22:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    /*pageContext.setAttribute("APP_PATH", request.getContextPath());*/
    request.setAttribute("APP_PATH",request.getContextPath());
    /*以斜线开始，不以斜线结束*/
%>
<html>
    <head>
    </head>
    <body>
    <!-- header -->
    <div class="header">
        <div class="w3ls-header"><!-- header-one -->
            <div class="container">
                <div class="w3ls-header-left">
                    <p>美食当前，总能有所思，或馋性千娇</p>
                </div>
                <div class="w3ls-header-right">
                    <ul>
                        <li class="head-dpdn">
                            <i class="fa fa-phone" aria-hidden="true"></i> Call us: +86 666 6666
                        </li>
                        <c:if test="${userSession.username!=null}">
                            <li class="head-dpdn">
                                欢迎您${userSession.username}
                            </li>
                        </c:if>
                        <c:if test="${userSession.username==null}">
                            <li class="head-dpdn">
                                <a href="${APP_PATH}/front/skipToFrontLogin"><i class="fa fa-sign-in" aria-hidden="true"></i> 登录</a>
                            </li>
                            <li class="head-dpdn">
                                <a href="${APP_PATH}/front/skipToFrontRegist"><i class="fa fa-user-plus" aria-hidden="true"></i> 注册</a>
                            </li>
                        </c:if>

                    </ul>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
        <!-- //header-one -->
        <!-- navigation -->
        <div class="navigation agiletop-nav">
            <div class="container">
                <nav class="navbar navbar-default">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header w3l_logo">

                        <h1><a href="${APP_PATH}/front">时光<span>Best Food Collection</span></a></h1>
                    </div>
                    <div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="${APP_PATH}/front" class="active">主页</a></li>
                            <!-- Mega Menu -->
                            <li>
                                <a href="${APP_PATH}/front/skipToFrontProductList" class="dropdown-toggle" >菜单 </a>
                            </li>
                           <%-- <li><a href="javascript:;">关于</a></li>--%>
                            <li><a href="${APP_PATH}/front/skipToOrder">我的订单</a>

                            </li>
                            <li><a href="${APP_PATH}/front/skipToContact">联系我们</a></li>
                            <li><a href="${APP_PATH}/front/skipToCart">购物车</a></li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
        <!-- //navigation -->
    </div>
    <!-- //header-end -->
    </body>
</html>