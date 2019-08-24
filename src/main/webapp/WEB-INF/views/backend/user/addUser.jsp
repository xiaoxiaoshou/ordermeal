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
    <title>网站后台管理模版</title>
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/admin/layui/css/layui.css" />
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/admin/css/admin.css" />
</head>
<body>
<div class="wrap-container">
    <form class="layui-form" id="addUser" style="width: 90%;padding-top: 20px;">
        <br/>
        <div class="layui-form-item">
            <label class="layui-form-label">用户名：</label>
            <div class="layui-input-block">
                <input type="text" id="username" name="username" required lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
            </div>

        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码：</label>
            <div class="layui-input-block">
                <input type="text" id="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
            </div>

        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">会员类型：</label>
            <div class="layui-input-block">
                <select id="vipType" name="vipType" lay-verify="required">
                    <option value="">请选择会员类型</option>
                    <option value="0">普通会员</option>
                    <option value="1">黄金会员</option>
                </select>
            </div>

        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">积分：</label>
            <div class="layui-input-block">
                <input type="text" id="integralNum" name="integralNum" required lay-verify="required" placeholder="请输入用户初始积分" autocomplete="off" class="layui-input">
            </div>

        </div>
        <div class="layui-form-item">
            <div class="layui-input-block" style="text-align: center">
                <br/>
                <button class="layui-btn layui-btn-normal" lay-submit lay-filter="formDemo">添加</button>
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
        form.on('submit(formDemo)', function(data) {
            $.post(
                '${APP_PATH}/backend/addUser',
                $('#addUser').serialize(),
                function (result) {
                    if(result.status==1){
                        layer.alert("增加成功", {icon: 6},function () {
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
