<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
//退出确认框
function confirm_rtindex() {   
    var msg = "您确定要退出管理员账户,返回前台页面吗？";   
    if (confirm(msg)==true){  
    return true;   
    }else{   
    return false;   
    }   
} 
</script>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>飞毛腿外卖管理员界面</title>
<link rel="stylesheet" type="text/css"
	href="/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/js/easyui/themes/icon.css">
<script type="text/javascript" src="/js/easyui/jquery.min.js"></script>
<script type="text/javascript" src="/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="/js/easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="/js/common.js"></script>

<!-- 在主界面的center为一个tabs，可以单击左侧功能树，添加多个标签，完成不同功能 -->
<script type="text/javascript">	
	var index = 0;  
    function addPanel(url,title){  
        if(!$('#admin').tabs('exists', title)){  
            $('#admin').tabs('add',{  
                title: title,  
                content: '<iframe src="'+url+'" frameBorder="0" border="0"  style="width: 100%; height: 100%;"/>',  
                closable: true  
            });  
        }else{  
            $('#tabs').tabs('select', title);  
        }  
    }  
    function removePanel(){  
        var tab = $('#admin').tabs('getSelected');  
        if (tab){  
            var index = $('#admin').tabs('getTabIndex', tab);  
            $('#admin').tabs('close', index);  
        }  
    }  
    
    jQuery(document).ready(function ($) {
        if (window.history && window.history.pushState) {
$(window).on('popstate', function () {
    window.history.forward(1);
});
}
});
	
	
</script>


</head>


<body>
	<div class="easyui-layout" data-options="fit:true">
		
		<div data-options="region:'north'" style="height:80px" >
		<a href="index">
		<img src="/images/logotop.png" width="210" height="70" border="0" /> 
		</a>
		<b >飞毛腿外卖平台管理员账户</b>
		
		</div><br>
		
		
		<div data-options="region:'south'" style="height: 50px;"></div>
		<div data-options="region:'west' ,iconCls:'icon-ok'" title="功能菜单"
			style="width: 120px;">

			<ul class="easyui-tree">
				<li><span><a href="javascript:void(0)"
						onclick="addPanel('user_index','用户管理')">用户管理</a></span></li>
				<li><span><a href="javascript:void(0)"
						onclick="addPanel('/product/product_index','商品管理')">商品管理</a></span></li>
				<li><span><a href="javascript:void(0)"
						onclick="addPanel('/order/order_index','订单管理')">订单管理</a></span></li>
				<li><span><a href="javascript:void(0)"
						onclick="addPanel('/notice/notice_index','公告管理')">公告管理</a></span></li>
						<li><span><a href="javascript:void(0)" onclick="addPanel('/client/index','前台页面预览')">前台页面预览</a></span></li>
						<li><span><a href="/client/index" onclick="javascript:return confirm_rtindex()">返回前台</a></span></li>
			</ul>

		</div>
		
		
		<!-- <div class="body" >
				<iframe src="/images/you.jpg" border="none" width="100%" name="right" scrolling="no" height="755px"></iframe>
			</div>
			 -->
			
		<div id="admin"  data-options="region:'center',iconCls:'icon-ok'"  class="easyui-tabs">
		</div>
		
			
		<div id="window" class="easyui-window"
			data-options="modal:true,closed:true,iconCls:'icon-save'"
			style="width: 50px; height: 500px; padding: 10px;"
			 >
		</div>
	
</body>
</html>