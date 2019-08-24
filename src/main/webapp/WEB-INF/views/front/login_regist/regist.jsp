<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/26
  Time: 20:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../include/include.jsp"%>
<html lang="en">
<head>
    <title>注册</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- Custom Theme files -->
    <link href="${APP_PATH}/static/front/css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
    <link href="${APP_PATH}/static/front/css/style.css" type="text/css" rel="stylesheet" media="all">
    <link href="${APP_PATH}/static/front/css/font-awesome.css" rel="stylesheet"> <!-- font-awesome icons -->
    <!-- //Custom Theme files -->
    <!-- js -->
    <script src="${APP_PATH}/static/front/js/jquery-2.2.3.min.js"></script>
    <!-- //js -->

</head>
<body>
<!-- banner -->
<div class="banner about-w3bnr">
    <!-- header -->
    <%@include file="../include/head.jsp"%>
    <!-- //header-end -->
    <!-- banner-text -->
    <div class="banner-text">
        <div class="container">
            <h2>唯有美食与爱不可辜负<br> <span>best chefs for you.</span></h2>
        </div>
    </div>
</div>
<!-- //banner -->
<!-- breadcrumb -->
<div class="container">
    <ol class="breadcrumb w3l-crumbs">
        <li><a href="#"><i class="fa fa-home"></i> 主页</a></li>
        <li class="active">注册</li>
    </ol>
</div>
<!-- //breadcrumb -->
<!-- sign up-page -->
<div class="login-page about">
    <img class="login-w3img" src="${APP_PATH}/static/front/images/img3.jpg" alt="">
    <div class="container">
        <h3 class="w3ls-title w3ls-title1">注册您的帐号</h3>
        <div class="login-agileinfo">
            <form  method="post" id="user">
                <input class="agile-ltext" type="text" name="username" placeholder="用户名" required="">
                <input class="agile-ltext" type="password" id="password" name="password" placeholder="密码" required="">
                <div class="agile-ltext" id="Confirm_message" style="color: orangered"></div>
                <input class="agile-ltext" type="password" id="confirm_Password" name="confirm_Password" placeholder="确认密码" required="">
                <input type="button" style="font-size: 1em;
                                            color: #fff;
                                            background: #08cae2;
                                            outline: none;
                                            border: none;
                                            cursor: pointer;
                                            padding: 1em;
                                            -webkit-appearance: none;
                                            width: 100%;
                                            margin: 2em 0;
                                            -webkit-transition: .5s all;
                                            -moz-transition: .5s all;
                                            -o-transition: .5s all;
                                            -ms-transition: .5s all;
                                            transition: .5s all;"
                       onclick="registUser()" value="注册">
            </form>
            <p>已有帐号?  <a href="${APP_PATH}/front/skipToFrontLogin"> 现在登录!</a></p>
        </div>
    </div>
</div>
<!-- //sign up-page -->


<!-- footer -->
<%@include file="../include/foot.jsp"%>
<!-- //footer -->
<!-- start-smooth-scrolling -->
<script src="${APP_PATH}/static/front/js/SmoothScroll.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/front/js/move-top.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/front/js/easing.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function($) {
        $(".scroll").click(function(event){
            event.preventDefault();

            $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
        });
    });
</script>
<!-- //end-smooth-scrolling -->
<!-- smooth-scrolling-of-move-up -->
<script type="text/javascript">
    $(document).ready(function() {
        /*
        var defaults = {
            containerID: 'toTop', // fading element id
            containerHoverID: 'toTopHover', // fading element hover id
            scrollSpeed: 1200,
            easingType: 'linear'
        };
        */

        $().UItoTop({ easingType: 'easeOutQuart' });

    });
</script>
<!-- //smooth-scrolling-of-move-up -->
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="${APP_PATH}/static/front/js/bootstrap.js"></script>
<script type="text/javascript">

    $(function () {
        $("#confirm_Password").bind("input propertychange", function() {
            var password = $("#password").val();
            var confirm_password = $("#confirm_Password").val();
            if(password!=confirm_password){
                $("#Confirm_message").html("两次输入的密码不一致");
            }else{
                $("#Confirm_message").html("");
            }
        });
    })

    function registUser() {
        $.post(
            '${APP_PATH}/front/regist',
            $('#user').serialize(),
            function (result) {
                if(result.status==1){
                    alert("注册成功")
                    window.location.href="${APP_PATH}/front/skipToFrontLogin"
                }
            }
        )
    }
</script>
</body>
</html>
