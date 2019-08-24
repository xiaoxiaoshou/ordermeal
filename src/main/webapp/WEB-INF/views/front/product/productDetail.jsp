<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/26
  Time: 20:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../include/include.jsp"%>
<html lang="en">

<head>
    <title>产品</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
    <script type="application/x-javascript">
        addEventListener("load", function() {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <!-- Custom Theme files -->
    <link href="${APP_PATH}/static/front/css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
    <link href="${APP_PATH}/static/front/css/style.css" type="text/css" rel="stylesheet" media="all">
    <link href="${APP_PATH}/static/front/css/font-awesome.css" rel="stylesheet">
    <!-- font-awesome icons -->
    <link rel="stylesheet" href="${APP_PATH}/static/front/css/owl.carousel.css" type="text/css" media="all" />
    <!-- Owl-Carousel-CSS -->
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
        <li>
            <a href="#"><i class="fa fa-home"></i> 主页</a>
        </li>
        <li class="active">食物</li>
    </ol>
</div>
<!-- //breadcrumb -->
<!-- products -->

<!-- modal -->
<div class="products">
    <div class="container">

        <div class="modal-body">
            <div class="col-md-5 modal_body_left">
                <img src="${APP_PATH}/static/front/images/s1.jpg" alt=" " class="img-responsive">
            </div>
            <div class="col-md-7 modal_body_right single-top-right">
                <h3 class="item_name">法式巧克力蛋糕</h3>
                <p>食物标题文字</p>
                <div class="single-rating">
                    <ul>
                        <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                        <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                        <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                        <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                        <li class="w3act"><i class="fa fa-star-o" aria-hidden="true"></i></li>
                        <li class="rating">20 reviews</li>
                        <li>
                            <a href="#">Add your review</a>
                        </li>
                    </ul>
                </div>
                <div class="single-price">
                    <ul>
                        <li>￥18</li>
                        <li><del>￥20</del></li>
                        <li><span class="w3off">10% OFF</span></li>
                    </ul>
                </div>
                <p class="single-price-text">食物描述文字食物描述文字食物描述文字食物描述文字食物描述文字食物描述文字食物描述文字食物描述文字食物描述文字食物描述文字食物描述文字食物描述文字食物描述文字食物描述文字食物描述文字食物描述文字食物描述文字食物描述文字食物描述文字食物描述文字食物描述文字食物描述文字食物描述文字食物描述文字食物描述文字食物描述文字</p>
                <form action="#" method="post">
                    <input type="hidden" name="cmd" value="_cart" />
                    <input type="hidden" name="add" value="1" />
                    <input type="hidden" name="w3ls_item" value="法式巧克力蛋糕" />
                    <input type="hidden" name="amount" value="18.00" />
                    <button type="submit" class="w3ls-cart"><em class="fa fa-cart-plus" aria-hidden="true"></em> 加入订单</button>
                </form>
            </div>
            <div class="clearfix"> </div>
        </div>

    </div>

</div>
<!-- //modal -->

<%@include file="../include/foot.jsp"%>
<!-- //footer -->
<%--<!-- cart-js -->
<script src="${APP_PATH}/static/front/js/minicart.js"></script>
<script>
    w3ls.render();

    w3ls.cart.on('w3sb_checkout', function(evt) {
        var items, len, i;

        if(this.subtotal() > 0) {
            items = this.items();

            for(i = 0, len = items.length; i < len; i++) {}
        }
    });
</script>
<!-- //cart-js -->--%>
<!-- Owl-Carousel-JavaScript -->
<script src="${APP_PATH}/static/front/js/owl.carousel.js"></script>
<script>
    $(document).ready(function() {
        $("#owl-demo").owlCarousel({
            items: 3,
            lazyLoad: true,
            autoPlay: true,
            pagination: true,
        });
    });
</script>
<!-- //Owl-Carousel-JavaScript -->
<!-- the jScrollPane script -->
<script type="text/javascript" src="${APP_PATH}/static/front/js/jquery.jscrollpane.min.js"></script>
<script type="text/javascript" id="sourcecode">
    $(function() {
        $('.scroll-pane').jScrollPane();
    });
</script>
<!-- //the jScrollPane script -->
<script type="text/javascript" src="${APP_PATH}/static/front/js/jquery.mousewheel.js"></script>
<!-- the mouse wheel plugin -->
<!-- start-smooth-scrolling -->
<script src="${APP_PATH}/static/front/js/SmoothScroll.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/front/js/move-top.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/front/js/easing.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function($) {
        $(".scroll").click(function(event) {
            event.preventDefault();

            $('html,body').animate({
                scrollTop: $(this.hash).offset().top
            }, 1000);
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

        $().UItoTop({
            easingType: 'easeOutQuart'
        });

    });
</script>
<!-- //smooth-scrolling-of-move-up -->
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="${APP_PATH}/static/front/js/bootstrap.js"></script>
</body>

</html>
