<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <title>购物车</title>
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
    <link href="${APP_PATH}/static/front/css/bootstrap.min.css">
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
        <li class="active">购物车</li>
    </ol>
</div>
<!-- //breadcrumb -->

<%-- cart--%>
<div class="products">
    <div class="container">
        <table class="table table-hover">
            <h2>购物车</h2>
            <thead>
            <tr>
                <th hidden>id</th>
                <th>名称</th>
                <th>价格</th>
                <th>数量</th>
                <th>总价</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${carts.map}" var="cart">
                <tr>
                    <td hidden>${cart.value.product.id}</td>
                    <td>${cart.value.product.name}</td>
                    <td>${cart.value.product.price}</td>
                    <td>
                        <input id="productNum" type="number" oninput="modifyNum($(this).val(),${cart.value.product.id},this)"  min="0" max="10" value="${cart.value.count}" >
                    </td>
                    <td>${cart.value.subTotal}</td>
                    <td><a href="${APP_PATH}/front/deleteItem?id=${cart.value.product.id}">取消</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <br/>
        <hr/>
        <br/>
        <c:if test="${carts!=null}">
            <table class="table table-bordered" style="width: 500px;">
                <h4>总价</h4>
                <tbody>
                <tr>
                    <th>总额</th>
                    <td id="cartTotal">${carts.total}</td>
                </tr>
                </tbody>
            </table>
            <button class="button btn-primary" data-toggle="modal" data-target="#confirmCart">
                确认订单
            </button>
        </c:if>
        <c:if test="${carts==null}">
            <div>
                购物车中什么都没有 <a href="${APP_PATH}/front/skipToFrontProductList">前往添加餐品到购物车</a>
            </div>
        </c:if>
    </div>

    <%--确认模态框start--%>
    <div class="modal fade" id="confirmCart" tabindex="-1" role="dialog"  aria-labelledby="mySmallModalLabel" aria-hidden="true">
        <div class="modal-dialog  modal-sm">
            <div class="modal-content" style="width:300px; height:200px;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true">×
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        提示
                    </h4>
                </div>
                <div class="modal-body">
                    确认提交订单？
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default"
                            data-dismiss="modal">关闭
                    </button>
                    <button type="button" class="btn btn-primary" onclick="submitCart()">
                        确认提交
                    </button>
                </div>
            </div>
        </div>
    </div>
<%--确认模态框end--%>

</div>
<%-- //cart --%>

<%@include file="../include/foot.jsp"%>
<!-- //footer -->
<!-- cart-js -->
<script>
    //餐品数量number发生变化
   function modifyNum(num,id,element) {
      $.post(
           '${APP_PATH}/front/modifyItemNum',
           {'id':id,'num':num},
           function (result) {
               if(result.status==1){
                   $(element).parent().next().html(result.data.subTotal);
                   $('#cartTotal').html(result.data.total)
               }
           }
       )
   }


   $(function () {
       //让模态框居中
       function centerModals() {
           $('#confirmCart').each(function(i) {
               var $clone = $(this).clone().css('display', 'block').appendTo('body'); var top = Math.round(($clone.height() - $clone.find('.modal-content').height()) / 2);
               top = top > 0 ? top : 0;
               $clone.remove();
               $(this).find('.modal-content').css("margin-top", top);
           });
       }
       $('#confirmCart').on('show.bs.modal', centerModals);

   })



   //提交购物车
    function submitCart() {
       //关闭模态框
        $('#confirmCart').modal('hide');
        window.location.href="${APP_PATH}/front/confirmCart";
    }


</script>
<!-- //cart-js -->
<!-- Owl-Carousel-JavaScript -->
<script src="${APP_PATH}/static/front/js/owl.carousel.js"></script>
<script>
   /* $(document).ready(function() {
        $("#owl-demo").owlCarousel({
            items: 3,
            lazyLoad: true,
            autoPlay: true,
            pagination: true,
        });
    });*/
</script>
<!-- //Owl-Carousel-JavaScript -->
<!-- the jScrollPane script -->
<script type="text/javascript" src="${APP_PATH}/static/front/js/jquery-2.2.3.min.js"></script>
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
