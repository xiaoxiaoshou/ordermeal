<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/25
  Time: 22:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@include file="../include/head.jsp"%>--%>
<%
request.setAttribute("APP_PATH",request.getContextPath());
%>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <title>后台登录</title>
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/admin/layui/css/layui.css" />
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/admin/css/login.css" />
    <script>


    </script>
</head>

<body>
<div class="m-login-bg">
    <div class="m-login">
        <h3>点餐管理系统后台登录</h3>
        <div class="m-login-warp">
            <form class="layui-form" id="loginAdmin">
                <div class="layui-form-item">
                    <input type="text" name="username" required lay-verify="required" placeholder="用户名" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-item">
                    <input type="password" name="password" required lay-verify="required" placeholder="密码" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-item m-login-btn">
                    <div class="layui-inline">
                        <button class="layui-btn layui-btn-normal" lay-submit lay-filter="login">登录</button>
                    </div>
                    <div class="layui-inline">
                        <button type="reset" class="layui-btn layui-btn-primary">取消</button>
                    </div>
                </div>
            </form>
        </div>
        <p class="copyright">Copyright &copy; 2019毕业设计版权所有</p>
    </div>
</div>
<script src="${APP_PATH}/static/admin/layui/layui.js" type="text/javascript" charset="utf-8"></script>
<script src="${APP_PATH}/static/admin/js/jquery.js"></script>
<script>
    layui.use(['form', 'layedit', 'laydate'], function() {
        var form = layui.form(),
            layer = layui.layer;


       /* //自定义验证规则
        form.verify({
            title: function(value) {
                if(value.length < 5) {
                    return '标题至少得5个字符啊';
                }
            },
            password: [/(.+){6,12}$/, '密码必须6到12位'],
            verity: [/(.+){6}$/, '验证码必须是6位'],

        });*/


        //监听提交
        form.on('submit(login)', function(data) {
            /*layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            })
            layer.msg('用户名或密码错误!',{icon:2,time:1000});*/
            $.post(
                '${APP_PATH}/backend/login',
                $('#loginAdmin').serialize(),
                function (result) {
                    if (result.status==1){
                        layer.msg('登录成功!',{icon:1,time:2000});
                        window.location.href="${APP_PATH}/backend/loginSuccessSkipToIndex?id="+result.data.id
                    } else{
                        layer.msg('用户名或密码错误!',{icon:2,time:1000});
                    }
                }
            )
            return false;
        });

    });
</script>
</body>

</html>
