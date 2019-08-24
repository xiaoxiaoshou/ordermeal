<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>修改用户</title>
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/admin/layui/css/layui.css" />
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/admin/css/admin.css" />
</head>
<body>
<div class="wrap-container">
    <form class="layui-form" id="modifyUser" style="width: 90%;padding-top: 20px;">
        <br/>
        <input type="hidden" id="id" name="id" value="${user.id}" required lay-verify="required" placeholder="请输入名称" autocomplete="off" class="layui-input">
        <div class="layui-form-item">
            <label class="layui-form-label">用户名：</label>
            <div class="layui-input-block">
                <input type="text" value="${user.username}" id="username" name="username" required lay-verify="required" placeholder="请输入名称" autocomplete="off" class="layui-input">
            </div>

        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码：</label>
            <div class="layui-input-block">
                <input type="text" value="${user.password}" id="password" name="password" required lay-verify="required" placeholder="请输入价格" autocomplete="off" class="layui-input">
            </div>

        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">会员类型：</label>
            <div class="layui-input-block">
                <select id="vipType" name="vipType" lay-verify="required">
                    <option value="">请选择会员类型</option>

                    <option value="0"
                            <c:if test="${user.vipType==0}">
                                selected
                            </c:if>
                    >普通会员</option>
                    <option value="1"
                            <c:if test="${user.vipType==1}">
                                selected
                            </c:if>
                    >黄金会员</option>
                </select>
            </div>

        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">积分：</label>
            <div class="layui-input-block">
                <input type="text" value="${user.integralNum}" id="integralNum" name="integralNum" required lay-verify="required" placeholder="请选择图片" autocomplete="off" class="layui-input">
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
<script src="${APP_PATH}/static/admin/js/jquery.js" type="text/javascript" charset="utf-8"></script>
<script src="${APP_PATH}/static/admin/layui/layui.js" type="text/javascript" charset="utf-8"></script>
<script>
    //Demo
    layui.use(['form'], function() {
        var form = layui.form();
        form.render();
        //监听提交
        form.on('submit(formDemo)', function(data) {
           $.post(
               '${APP_PATH}/backend/modifyUser',
               $('#modifyUser').serialize(),
               function (result) {
                   if(result.status==1){
                       layer.alert("修改成功", {icon: 6},function () {
                           // 获得frame索引
                           var index = parent.layer.getFrameIndex(window.name);
                           //关闭当前frame
                           parent.layer.close(index);
                           window.location.href="${APP_PATH}/backend/skipToUserList";
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
