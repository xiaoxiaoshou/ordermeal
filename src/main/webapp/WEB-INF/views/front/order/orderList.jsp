<%@ taglib prefix="v" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/26
  Time: 20:24
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
        <li class="active">我的订单</li>
    </ol>
</div>
<!-- //breadcrumb -->
<!-- products -->
<div class="products">
    <div class="container">
        <div class="col-md-12 ">
            <c:forEach items="${orderListUtils}" var="oderListUtil">
                <div class="rsidebar-top col-md-12">
                    <div class="sidebar-row">
                        <h4><span class="col-md-10">于 ${oderListUtil.order.createTime} 的订单--餐桌号：${oderListUtil.order.boardId}</span><span class="col-md-2">￥${oderListUtil.order.total}</span></h4>
                        <ul class="faq">
                            <c:forEach items="${oderListUtil.orderDatails}" var="datail">
                            <li>
                                <a href="javascript:;"><span class="col-md-8">${datail.name}</span><span class="col-md-2">${datail.count}份</span><span class="col-md-2">￥${datail.count*datail.price}</span></a>
                            </li>
                            </c:forEach>
                        </ul>
                        <div class="col-md-3 col-md-offset-9">
                            <c:if test="${oderListUtil.order.status==0}">
                                订单未支付,请往前台支付
                            </c:if>
                            <c:if test="${oderListUtil.order.status==1}">
                                <button class="button btn-default" data-toggle="modal" onclick="toValueModal(${oderListUtil.order.id})" data-target="#comment_modal">
                                    用餐完成，请对此次用餐做出评价
                                </button>
                            </c:if>
                        </div>
                    </div>
                </div>

                    <div class="clearfix">&nbsp;</div>
            </c:forEach>
        </div>
    </div>
</div>

<%--评价模态框start--%>
<div class="modal fade bs-example-modal-lg" id="comment_modal" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog  modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">×
                </button>
                <h4 class="modal-title" id="myModalLabel">
                   用餐评价
                </h4>
            </div>
            <div class="modal-body">
                <input type="hidden" id="commentId">
                <div class="control-label">为了更好的服务，麻烦您对此次用餐做出评价</div>
                <textarea id="comment_content" style="width: 100%;height: 100px"></textarea>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" onclick="submitComment()">
                    确认提交
                </button>
            </div>
        </div>
    </div>
</div>
<%--评价模态框end--%>

<%@include file="../include/foot.jsp"%>
<!-- //footer -->
<%--comment--%>
<script>

    function toValueModal(id) {
        $('#commentId').val(id);
    }

    //提交评价
    function submitComment() {
        var content = $('#comment_content').val();

        $.post(
            '${APP_PATH}/front/addComment',
            {'content':content,'id': $('#commentId').val()},
            function (result) {
                alert("谢谢您的评价")
            }
        )
        $('#comment_content').val("");
        $('#comment_modal').modal('hide');
    }

</script>
<%--comment--%>
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
