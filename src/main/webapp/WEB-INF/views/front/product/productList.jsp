<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/26
  Time: 20:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../include/include.jsp"%>
<html lang="en">
<head>
    <title>餐品</title>
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
        <li class="active">食物</li>
    </ol>
</div>
<!-- //breadcrumb -->
<!-- products -->
<div class="products">
    <div class="container">
        <div class="col-md-9 product-w3ls-right">
            <div class="product-top">
                <h4>餐品列表</h4>
                <div class="clearfix"> </div>
            </div>
            <div class="products-row">
                <c:if test="${products==null}">
                    <div class="text-center">
                        此分类没有餐品
                    </div>
                </c:if>
                <c:forEach items="${products}" var="product">
                    <div class="col-xs-6 col-sm-4 product-grids">
                        <div class="flip-container">
                            <div class="flipper agile-products">
                                <div class="front">
                                    <img src="${REAL_PATH}${product.img}" style="width: 250px;height: 170px" class="img-responsive" alt="img">
                                    <div class="agile-product-text">
                                        <h5>${product.name}<%-- 名字 --%></h5>
                                    </div>
                                </div>
                                <div class="back">
                                    <h4>${product.name}</h4>
                                    <p>${product.describes} <%--描述--%></p>
                                    <h6>${product.price}<sup>￥</sup></h6>
                                    <form action="#"  id="">
                                        <input type="hidden"  name="id" value="${product.id}">
                                        <input type="hidden"  name="name" value="${product.name}">
                                        <input type="hidden"  name="price" value="${product.price}">
                                        <input type="hidden"  name="describe" value="${product.describes}">
                                        <button type="button" onclick="addToCart(${product.id})" class="w3ls-cart pw3ls-cart"><i class="fa fa-cart-plus" aria-hidden="true"></i>加入购物车</button>
                                        <span class="w3-agile-line"> </span>
                                       <%-- <a href="${APP_PATH}/front/skipToProductDetail" >更多</a>--%>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                </c:forEach>

             <div class="col-xs-6 col-sm-4 product-grids hidden">
                    <div class="flip-container">
                        <div class="flipper agile-products">
                            <div class="front">
                                <img src="${APP_PATH}/static/front/images/g10.jpg" class="img-responsive" alt="img">
                                <div class="agile-product-text">
                                    <h5>可乐鸡翅</h5>
                                </div>
                            </div>
                            <div class="back">
                                <h4>可乐鸡翅</h4>
                                <p>可乐红烧鸡翅</p>
                                <h6>24.0<sup>￥</sup></h6>
                                <form action="#" method="post">
                                    <input type="hidden" name="cmd" value="_cart">
                                    <input type="hidden" name="add" value="13">
                                    <input type="hidden" name="w3ls_item" value="可乐鸡翅">
                                    <input type="hidden" name="amount" value="24.0">
                                    <button type="submit" class="w3ls-cart pw3ls-cart"><i class="fa fa-cart-plus" aria-hidden="true"></i>加入购物车</button>
                                    <span class="w3-agile-line"> </span>
                                   <%-- <a href="${APP_PATH}/front/skipToProductDetail" >更多</a>--%>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="clearfix"> </div>
            </div>

        </div>
        <div class="col-md-3 rsidebar">
            <div class="rsidebar-top">
                <div class="sidebar-row">
                    <h4>餐品类型</h4>
                    <ul class="faq">
                        <c:forEach items="${productTypes}" var="productType">
                            <li id="${productType.id}" class="">
                                <a <%--onclick="selectByType(${productType.type})"--%> href="${APP_PATH}/front/selectByType?type=${productType.type}">${productType.type}</a>
                            </li>
                        </c:forEach>

                    </ul>
                    <div class="clearfix"> </div>
                </div>

            </div>

        </div>
        <div class="clearfix"> </div>
    </div>
</div>

<!-- //footer -->
<%@include file="../include/foot.jsp"%>
<!-- //footer -->
<!-- cart-js -->
<script>
    function addToCart(id) {
        window.location.href="${APP_PATH}/front/addToCart?id="+id;
    }
    function selectByType(type) {
        alert(type)
    }
</script>
<!-- //cart-js -->
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
<!-- the jScrollPane script -->
<script type="text/javascript" src="${APP_PATH}/static/front/js/jquery.jscrollpane.min.js"></script>
<script type="text/javascript" id="sourcecode">
    $(function()
    {
        $('.scroll-pane').jScrollPane();
    });
</script>
<!-- //the jScrollPane script -->
<script type="text/javascript" src="${APP_PATH}/static/front/js/jquery.mousewheel.js"></script> <!-- the mouse wheel plugin -->
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
