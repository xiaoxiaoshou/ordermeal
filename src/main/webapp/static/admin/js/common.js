layui.config({
	base: '/ordermeal/static/admin/js/module/'
    /*base: 'static/admin/js/module/'*/
}).extend({
	dialog: 'dialog',
});

layui.use(['form', 'jquery', 'laydate', 'layer', 'laypage', 'dialog',   'element'], function() {
	var form = layui.form(),
		layer = layui.layer,
		$ = layui.jquery,
		dialog = layui.dialog;
	//获取当前iframe的name值
	var iframeObj = $(window.frameElement).attr('name');
	//全选
	form.on('checkbox(allChoose)', function(data) {
		var child = $(data.elem).parents('table').find('tbody input[type="checkbox"]');
		child.each(function(index, item) {
			item.checked = data.elem.checked;
		});
		form.render('checkbox');
	});
	//渲染表单

	form.render();	
	//顶部添加
    $('.addBtn').click(function() {
        var url=$(this).attr('data-url');
        //将iframeObj传递给父级窗口,执行操作完成刷新
        parent.page("添加", url, iframeObj, w = "700px", h = "620px");
        return false;

    }).mouseenter(function() {
        dialog.tips('添加', '.addBtn');
    })

	//添加餐品类型
    $('.addProductTypeBtn').click(function() {
        var url=$(this).attr('data-url');
        //将iframeObj传递给父级窗口,执行操作完成刷新
        parent.page("添加餐品类型", url, iframeObj, w = "700px", h = "200px");
        return false;
    }).mouseenter(function() {
        dialog.tips('添加餐品类型', '.addProductTypeBtn');
    })

    //修改餐品类型
    $('.editProductType-btn').click(function() {
        var url=$(this).attr('data-url');
        //将iframeObj传递给父级窗口,执行操作完成刷新
        parent.page("修改餐品类型", url, iframeObj, w = "400px", h = "3000px");
        return false;
    }).mouseenter(function() {
        dialog.tips('修改餐品类型', '.editProductType-btn');
    })
    //删除餐品类型
    $('.delProductType-btn').click(function() {
        var id = $(this).attr('data-id');
        var url=$(this).attr('data-url');
        dialog.confirm({
            message:'您确定要进行删除吗？',
            success:function(){
                layer.msg('确定了')
            },
            cancel:function(){
                layer.msg('取消了')
            }
        })
        return false;
    }).mouseenter(function() {
        dialog.tips('删除餐品类型', '.delProductType-btn');
    })

	/*-------------------------------------------------------------*/
	//添加餐品
    $('.addProductBtn').click(function() {
        var url=$(this).attr('data-url');
        //将iframeObj传递给父级窗口,执行操作完成刷新
        parent.page("添加餐品", url, iframeObj, w = "700px", h = "620px");
        return false;
    }).mouseenter(function() {
        dialog.tips('添加餐品', '.addProductBtn');
    })
    //修改餐品
    $('.editProduct-btn').click(function() {
        var url=$(this).attr('data-url');
        //将iframeObj传递给父级窗口,执行操作完成刷新
        parent.page("修改餐品", url, iframeObj, w = "700px", h = "620px");
        return false;
    }).mouseenter(function() {
        dialog.tips('修改餐品', '.editProduct-btn');
    })
	//删除餐品
    $('.delProduct-btn').click(function() {
        var id = $(this).attr('data-id');
        var url=$(this).attr('data-url');
        dialog.confirm({
            message:'您确定要进行删除吗？',
            success:function(){
                layer.msg('确定了')
            },
            cancel:function(){
                layer.msg('取消了')
            }
        })
        return false;
    }).mouseenter(function() {
        dialog.tips('删除餐品', '.delProduct-btn');
    })
	/*-------------------------------------------------------*/
	//查看订单餐品详情
    $('.show_order_details').click(function() {
        var url=$(this).attr('data-url');
        //将iframeObj传递给父级窗口,执行操作完成刷新
        parent.page("订单详情", url, iframeObj, w = "400px", h = "500px");
        return false;
    })

	/*------------------------------------------------------*/
	//添加用户
    $('.addUserBtn').click(function() {
        var url=$(this).attr('data-url');
        //将iframeObj传递给父级窗口,执行操作完成刷新
        parent.page("添加用户", url, iframeObj, w = "500px", h = "350px");
        return false;
    }).mouseenter(function() {
        dialog.tips('添加用户', '.addUserBtn');
    })
    //修改用户
    $('.modifyUserBtn').click(function() {
        var url=$(this).attr('data-url');
        //将iframeObj传递给父级窗口,执行操作完成刷新
        parent.page("修改用户信息", url, iframeObj, w = "500px", h = "350px");
        return false;
    }).mouseenter(function() {
        dialog.tips('修改用户信息', '.modifyUserBtn');
    })

    /*------------------------------------------------------------------*/
    //添加餐桌
    $('.addBorderBtn').click(function() {
        var url=$(this).attr('data-url');
        //将iframeObj传递给父级窗口,执行操作完成刷新
        parent.page("添加餐桌", url, iframeObj, w = "300px", h = "200px");
        return false;
    }).mouseenter(function() {
        dialog.tips('添加餐桌', '.addBorderBtn');
    })

	//顶部排序
	$('.listOrderBtn').click(function() {
		var url=$(this).attr('data-url');
		dialog.confirm({
			message:'您确定要进行排序吗？',
			success:function(){
				layer.msg('确定了')
			},
			cancel:function(){
				layer.msg('取消了')
			}
		})
		return false;
	}).mouseenter(function() {
		dialog.tips('批量排序', '.listOrderBtn');
	})	

	//列表添加
	$('#table-list').on('click', '.add-btn', function() {
		var url=$(this).attr('data-url');
		//将iframeObj传递给父级窗口
		parent.page("菜单添加", url, iframeObj, w = "700px", h = "620px");
		return false;
	})
	//列表删除
	$('#table-list').on('click', '.del-btn .del-btn', function() {
		var url=$(this).attr('data-url');
		var id = $(this).attr('data-id');
		dialog.confirm({
			message:'您确定要进行删除吗？',
			success:function(){
				layer.msg('确定了')
			},
			cancel:function(){
				layer.msg('取消了')
			}
		})
		return false;
	})
	//列表跳转
	$('#table-list,.tool-btn').on('click', '.go-btn', function() {
		var url=$(this).attr('data-url');
		var id = $(this).attr('data-id');
		window.location.href=url+"?id="+id;
		return false;
	})
	//编辑栏目
	$('#table-list').on('click', '.edit-btn', function() {
		var That = $(this);
		var id = That.attr('data-id');
		var url=That.attr('data-url');
		//将iframeObj传递给父级窗口
		parent.page("菜单编辑", url + "?id=" + id, iframeObj, w = "700px", h = "620px");
		return false;
	})
});

/**
 * 控制iframe窗口的刷新操作
 */
var iframeObjName;

//父级弹出页面
function page(title, url, obj, w, h) {
	if(title == null || title == '') {
		title = false;
	};
	if(url == null || url == '') {
		url = "404.html";
	};
	if(w == null || w == '') {
		w = '700px';
	};
	if(h == null || h == '') {
		h = '350px';
	};
	iframeObjName = obj;
	//如果手机端，全屏显示
	if(window.innerWidth <= 768) {
		var index = layer.open({
			type: 2,
			title: title,
			area: [320, h],
			fixed: false, //不固定
			content: url
		});
		layer.full(index);
	} else {
		var index = layer.open({
			type: 2,
			title: title,
			area: [w, h],
			fixed: false, //不固定
			content: url
		});
	}
}

/**
 * 刷新子页,关闭弹窗
 */
function refresh() {
	//根据传递的name值，获取子iframe窗口，执行刷新
	if(window.frames[iframeObjName]) {
		window.frames[iframeObjName].location.reload();

	} else {
		window.location.reload();
	}

	layer.closeAll();
}