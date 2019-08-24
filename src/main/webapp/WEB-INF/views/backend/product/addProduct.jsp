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
    <meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
    <title>网站后台管理模版</title>
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/admin/layui/css/layui.css" />
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/admin/css/admin.css" />
</head>
<body>
<div class="wrap-container">
    <form class="layui-form" style="width: 90%;padding-top: 20px;">
        <br/>
        <div class="layui-form-item">
            <label class="layui-form-label">名称：</label>
            <div class="layui-input-block">
                <input type="text" name="name" id="name" required lay-verify="required" placeholder="请输入名称" autocomplete="off" class="layui-input">
            </div>

        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">价格：</label>
            <div class="layui-input-block">
                <input type="text" name="price" id="price" required lay-verify="required" placeholder="请输入价格" autocomplete="off" class="layui-input">
            </div>

        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">类型：</label>
            <div class="layui-input-block">
                <select name="type" id="type" lay-verify="required">
                    <option value="请选择餐品类型"></option>
                    <c:forEach items="${productTypes}" var="productType">
                        <option value="${productType.type}">${productType.type}</option>
                    </c:forEach>
                </select>
            </div>

        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">图片：</label>
            <div class="layui-input-block">
                <input type="file" name="img" id="img" required lay-verify="required" placeholder="请选择图片" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">状态：</label>
            <div class="layui-input-block">
                <input type="radio" name="status"  value="1" title="显示">
                <input type="radio" name="status"  value="0" title="隐藏">
            </div>

        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">描述</label>
            <div class="layui-input-block">
                <textarea name="describes" id="describes" placeholder="请输入描述内容" class="layui-textarea"></textarea>
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

            var name = $('#name').val();
            var price = $('#price').val();
            var describes = $("#describes").val();
            var type = $('#type').val();
            var status = $("input[name='status']:checked").val();


            var formData = new FormData();
             formData.append("file",$("#img")[0].files[0]);
             formData.append("name",name);
             formData.append("price",price);
             formData.append("describes",describes);
             formData.append("type",type);
             formData.append("status",status);

            $.ajax({
                url:'${APP_PATH}/backend/addProduct',
                data:formData,
                type:'post',
              /*  dataType:'formData',*/
                cache:false,
                processData: false,//用于对data参数进行序列化处理 这里必须false
                contentType: false, //必须
                success:function (result) {
                    if(result.status==1){
                        layer.alert("增加成功", {icon: 6},function () {
                            // 获得frame索引
                            var index = parent.layer.getFrameIndex(window.name);
                            //关闭当前frame
                            parent.layer.close(index);
                        });
                    }
                },
                error:function (result) {
                    alert(result.status+"error");
                }
            })

            //layer.msg(JSON.stringify(data.field));
            return false;
        });
    });
</script>
</body>

</html>
