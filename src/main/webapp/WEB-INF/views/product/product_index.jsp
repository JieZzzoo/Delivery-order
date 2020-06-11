<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>商品列表</title>
	<link rel="stylesheet" type="text/css" href="/js/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="/js/easyui/themes/icon.css">
	<script type="text/javascript" src="/js/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="/js/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/js/easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>
	<script type="text/javascript">
		
		$(function(){
			$('#productList').datagrid({
				toolbar:[{
				    text:'新增',
				    iconCls:'icon-add',
				    handler:function(){
				    	//点击按钮触发的事件
				    	$('#window').window({
				    		closed:false,
				    		title:'新增商品',
				    		href:'/product/page/add',
				    		onLoad:function(){}
				    	});
				    }
				},{
				    text:'编辑',
				    iconCls:'icon-edit',
				    handler:function(){
				    	
				    	//获取选中的行
				    	var rows = $("#productList").datagrid("getSelections");
				    	if(rows.length <=0){
				    		$.messager.alert('提示','未选中商品!');
				    		return ;
				    	}
				    	//$.messager.alert('提示','该功能由学员自己实现!');
				    	//弹出window，回显数据
				    	$('#window').window({
				    		closed:false,
				    		title:'编辑商品',
				    		href:'/product/page/edit',
				    		onLoad:function(){
				    			//获取选中的行数据
				    			var node = $("#productList").datagrid("getSelected");
				    			//格式化时间数据
				    			//回显数据
				    			$("#content").form('load',node);
				    		}
				    	});
				    }
				},{
				    text:'删除',
				    iconCls:'icon-cancel',
				    handler:function(){
				    	//获取选中的行
				    	var rows = $("#productList").datagrid("getSelections");
				    	if(rows.length > 0){
				    		var ids = "";
				    		for(var i = 0; i < rows.length; i++){
				    			ids = ids + rows[i].pId + ",";
				    		}
				    		ids = ids.substring(0, ids.length - 1);
					    	
					    	$.messager.confirm('确认','确定删除ID为 '+ids+' 的商品吗？',function(r){
					    	    if (r){
					            	$.post("/product/delete",{'ids':ids}, function(data){
					        			if(data.status == 200){
					        				$.messager.alert('提示','删除用户商品!',undefined,function(){
					        					$("#productList").datagrid("reload");
					        				});
					        			}
					        		});
					    	    }
					    	});
				    	} else {
				    		$.messager.alert('提示','未选中商品!');
				    		return ;
				    	}
				    }
				},
				{
				    text:'查询',
				    iconCls:'icon-search',
				    handler:function(){
				    	//点击按钮触发的事件
				    	$('#window').window({
				    		closed:false,
				    		title:'查询商品',
				    		href:'/product/page/query',
				    		onLoad:function(){}
				    	});
				    }
				},'-',{
				    text:'分页导出',
				    iconCls:'icon-remove',
				    handler:function(){
				    	//获取EasyUI分页的参数
				    	var optins = $("#productList").datagrid("options");
				    	var page = optins.pageNumber;//当前页数
				    	var rows = optins.pageSize;//页面大小
				    	
				    	window.open("/product/export/excel/"+page+"/"+rows);
				    }
				},{
					text:'全部导出',
					iconCls:'icon-remove',
					handler:function(){
				    	var optins = $("#productList").datagrid("options");
				    	window.open("/product/export/excelall/");
				    }
				},{
					  text:'查询全部',
					    iconCls:'icon-filter',
					    handler:function(){
					    	
					    	window.location.reload()
					    }
				}
				] 
			});
		});
	</script>
</head>
<body>
<div class="easyui-layout" data-options="fit:true">
	<table id="productList" class="easyui-datagrid" 
				style="width: 700px, height:450px"
				data-options="url:'/product/list',method:'get',pageSize:10,pageList:[10,15,20,30]
					,singleSelect:false,pagination:true">
				<thead>
					<tr>
						<th data-options="field:'pId'" width="80">商品ID</th>
						<th data-options="field:'name',align:'center'" width="300">商品名称</th>
						<th data-options="field:'price'" width="90">商品价格（元）</th>
						<th data-options="field:'category',align:'center'" width="80">商品分类</th>
						<th data-options="field:'branch',align:'center'" width="80">商品子分类</th>
						<th data-options="field:'pnum',align:'center'" width="80">商品库存量</th>
						<th data-options="field:'description',align:'center'" width="300">商品描述</th>
						<th data-options="field:'imgurl',align:'center'" width="300">商品图片</th>
						
				</thead>
			</table>
</div>
<div id="window" class="easyui-window"
			data-options="modal:true,closed:true,iconCls:'icon-save'"
			style="width: 800px; height: 500px; padding: 10px;"></div>
	
</body>
</body>
</html>