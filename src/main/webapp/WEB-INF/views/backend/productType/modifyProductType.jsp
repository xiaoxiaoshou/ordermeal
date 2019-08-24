<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/26
  Time: 16:32
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
    <title>修改餐品类型</title>
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/admin/layui/css/layui.css" />
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/admin/css/admin.css" />
</head>
<body>
<div class="wrap-container">
    <form class="layui-form" id="productTypeModify" style="width: 90%;padding-top: 20px;">
        <br/>
        <input type="hidden" value="${productType.id}" id="id" name="id">
        <div class="layui-form-item">
            <label class="layui-form-label">餐品类型：</label>
            <div class="layui-input-block">
                <input value="${productType.type}" type="text" id="type" name="type" required lay-verify="required" placeholder="请输入餐品类型名称" autocomplete="off" class="layui-input">
            </div>

        </div>
        <div class="layui-form-item">
            <div class="layui-input-block" style="text-align: center">
                <br/>
                <button class="layui-btn layui-btn-normal" lay-submit lay-filter="formDemo">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>

<script src="${APP_PATH}/static/admin/layui/layui.js" type="text/javascript" charset="utf-8"></script>
<script src="${APP_PATH}/static/admin/js/jquery.js" type="text/javascript" charset="utf-8"></script>
<script>
    //Demo
    layui.use(['form'], function() {
        var form = layui.form();
        form.render();
        //监听提交
        form.on('submit(formDemo)', function(data) {
           $.post(
                '${APP_PATH}/backend/modifyProductType',
                $('#productTypeModify').serialize(),
                function (result) {
                    if(result.status==1){
                        layer.alert("修改成功", {icon: 6},function () {
                            // 获得frame索引
                            var index = parent.layer.getFrameIndex(window.name);
                            //关闭当前frame
                            parent.layer.close(index);
                            window.location.href="${APP_PATH}/backend/skipToProductType";
                        });
                    }
                }
            )
            return false;
        });

    });
</script>
</body>

</html>
