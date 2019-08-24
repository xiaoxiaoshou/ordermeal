<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/26
  Time: 19:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../include/include.jsp"%>
<html lang="en">
<head>
    <title>主页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- Custom Theme files -->
    <link href="${APP_PATH}/static/front/css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
    <link href="${APP_PATH}/static/front/css/style.css" type="text/css" rel="stylesheet" media="all">
    <link href="${APP_PATH}/static/front/css/font-awesome.css" rel="stylesheet"> <!-- font-awesome icons -->
    <link rel="stylesheet" href="${APP_PATH}/static/front/css/owl.carousel.css" type="text/css" media="all"/> <!-- Owl-Carousel-CSS -->
    <!-- //Custom Theme files -->
    <!-- js -->
    <script src="${APP_PATH}/static/front/js/jquery-2.2.3.min.js"></script>
    <!-- //js -->

</head>
<body>
<!-- banner -->
<div class="banner">
    <%@include file="../include/head.jsp"%>
    <!-- banner-text -->
    <div class="banner-text">
        <div class="container">
            <h2>唯有美食与爱不可辜负<br> <span>best chefs for you.</span></h2>
            <%--<div class="agileits_search">
                <form action="#" method="post">
                    <input name="Search" type="text" placeholder="搜索你想要的美食" required="">
                    <select id="agileinfo_search" name="agileinfo_search" required>
                        <option value="">全部</option>
                        <option value="navs">主食</option>
                        <option value="quotes">点心</option>
                        <option value="videos">饮料</option>
                    </select>
                    <input type="submit" value="搜索">
                </form>
            </div>--%>
        </div>
    </div>
</div>
<!-- //banner -->

<!-- order -->
<div class="wthree-order">

    <div class="container">
        <h3 class="w3ls-title">怎样点餐</h3>
        <p class="w3lsorder-text">简单的三步Get到你喜欢的食物</p>
        <div class="order-agileinfo">
            <div class="col-md-4 col-sm-4 col-xs-4 order-w3lsgrids">
                <div class="order-w3text">
                    <i class="fa fa-map" aria-hidden="true"></i>
                    <h5>点击菜单</h5>
                    <span>1</span>
                </div>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-4 order-w3lsgrids">
                <div class="order-w3text">
                    <i class="fa fa-cutlery" aria-hidden="true"></i>
                    <h5>选择食物</h5>
                    <span>2</span>
                </div>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-4 order-w3lsgrids">
                <div class="order-w3text">
                    <i class="fa fa-credit-card" aria-hidden="true"></i>
                    <h5>用餐支付</h5>
                    <span>3</span>
                </div>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<!-- //order -->

<%@include file="../include/foot.jsp"%>
<!-- //footer -->
<%--<!-- cart-js -->
<script src="${APP_PATH}/static/front/js/minicart.js"></script>
<script>
    w3ls.render();

    w3ls.cart.on('w3sb_checkout', function (evt) {
        var items, len, i;

        if (this.subtotal() > 0) {
            items = this.items();

            for (i = 0, len = items.length; i < len; i++) {
            }
        }
    });
</script>
<!-- //cart-js -->--%>
<!-- Owl-Carousel-JavaScript -->
<script src="${APP_PATH}/static/front/js/owl.carousel.js"></script>
<script>
    $(document).ready(function() {
        $("#owl-demo").owlCarousel ({
            items : 3,
            lazyLoad : true,
            autoPlay : true,
            pagination : true,
        });
    });
</script>
<!-- //Owl-Carousel-JavaScript -->
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
