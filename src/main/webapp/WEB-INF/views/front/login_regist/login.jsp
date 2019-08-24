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
    <title>登录</title>
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
        <li class="active">登录</li>
    </ol>
</div>
<!-- //breadcrumb -->
<!-- login-page -->
<div class="login-page about">
    <img class="login-w3img" src="${APP_PATH}/static/front/images/img3.jpg" alt="">
    <div class="container">
        <h3 class="w3ls-title w3ls-title1">登录您的账户</h3>
        <div class="login-agileinfo">
            <form action="#" method="post" id="myUser">
                <input class="agile-ltext" type="text" id="Username" name="Username" placeholder="用户名" required="">
                <input class="agile-ltext" type="password" id="password" name="password" placeholder="密码" required="">
                <div class="wthreelogin-text">
                    <ul>
                        <li>
                            <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>
                                <span> 记住我 ?</span>
                            </label>
                        </li>
                        <li><a href="#">忘记密码?</a> </li>
                    </ul>
                    <div class="clearfix"> </div>
                </div>
                <input type="button" class="btn btn-default" style="width: 430px;height: 40px;background-color: #00a0e9"  onclick="login()" value="登录">
            </form>
            <p>没有帐号? <a href="${APP_PATH}/front/skipToFrontRegist"> 现在注册!</a></p>
        </div>
    </div>
</div>
<!-- //login-page -->
<%@include file="../include/foot.jsp"%>
<!-- //footer -->
<!--login -->
<script src="${APP_PATH}/static/front/js/jquery-2.2.3.min.js"></script>
<script>
    $(function () {

    })
    function login() {
        $.post(
            '${APP_PATH}/front/login',
            $('#myUser').serialize(),
            function (result) {
                if(result.status==1){
                    alert("登录成功");
                    var id = result.data.id;
                    window.location.href="${APP_PATH}/front/loginSuccess?id="+id;
                }else{
                    alert("用户名密码不正确")
                }
            }
        )
    }
</script>
<!-- //login-js -->
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
</body>
</html>
