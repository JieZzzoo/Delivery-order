<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>用户列表</title>
	<link rel="stylesheet" type="text/css" href="/js/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="/js/easyui/themes/icon.css">
	<script type="text/javascript" src="/js/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="/js/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/js/easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>
	<script type="text/javascript">
		//处理时间
		function formatDate(value,row,order_index){
			var date = new Date(value);
			return date.format("yyyy-MM-dd hh:mm:ss");
		}
		//处理订单状态
		function formatpaystate(value,row,order_index){
			if(value == 1) return "已支付";
			else return "未支付";
		}
		
		$(function(){
			$('#orderList').datagrid({
				toolbar:[{
				    text:'删除',
				    iconCls:'icon-cancel',
				    handler:function(){
				    	//获取选中的行
				    	var rows = $("#orderList").datagrid("getSelections");
				    	
				    	if(rows.length > 0){
				    		var ids = "";
				    		var paystates = "";
				    		for(var i = 0; i < rows.length; i++){
				    			paystates = paystates + rows[i].paystate + ",";
				    			ids = ids + rows[i].oId + ",";
				    		}
				    		ids = ids.substring(0, ids.length - 1);
				    		paystates = paystates.substring(0,paystates.length - 1);
				    		if (paystates [i]== 0||paystates==0){
								$.messager.alert('提示','抱歉，您不能删除未支付订单!',undefined,
										function() {$("#orderList").datagrid("reload");
										});
							}else{
					    	$.messager.confirm('确认','确定删除ID为 '+ids+' 的订单吗？',function(r){
					    	    if (r){
					            	$.post("/order/delete",{'ids':ids}, function(data){
					        			if(data.status == 200){
					        				$.messager.alert('提示','删除订单成功!',undefined,function(){
					        					$("#orderList").datagrid("reload");
					        				});
					        			}
					        		});
					    	    }
					    	});
				    	} }else {
				    		$.messager.alert('提示','未选中订单!');
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
				    		title:'查询订单',
				    		href:'/order/page/query',
				    		onLoad:function(){}
				    	});
				    }
				},'-',{
				    text:'分页导出',
				    iconCls:'icon-remove',
				    handler:function(){
				    	//获取EasyUI分页的参数
				    	var optins = $("#orderList").datagrid("options");
				    	var page = optins.pageNumber;//当前页数
				    	var rows = optins.pageSize;//页面大小
				    	
				    	window.open("/order/export/excel/"+page+"/"+rows);
				    }
				},{
					text:'全部导出',
					iconCls:'icon-remove',
					handler:function(){
				    	var optins = $("#orderList").datagrid("options");
				    	window.open("/order/export/excelall/");
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
	<table id="orderList" class="easyui-datagrid" 
				style="width: 700px, height:450px"
				data-options="url:'/order/list',queryParams:{},method:'get',pageSize:5,pageList:[5,10]
					,singleSelect:false,pagination:true">
				<thead>
					<tr>
						<th data-options="field:'oId'" width="80">订单ID</th>
						<th data-options="field:'money',align:'center'" width="120">订单价格</th>
						<th data-options="field:'receiverAddress'" width="300">收货地址</th>
						<th data-options="field:'receiverName',align:'center'" width="80">收货人姓名</th>
						<th data-options="field:'receiverPhone',align:'center'" width="300">收货人电话</th>
						<th data-options="field:'paystate',align:'center',formatter:formatpaystate" width="120">收货地址</th>
						<th data-options="field:'ordertime',formatter:formatDate"
							width="180">订单创建时间</th>
						<th
							data-options="field:'id'"
							width="60">用户ID</th>
					</tr>
				</thead>
			</table>
</div>
<div id="window" class="easyui-window"
			data-options="modal:true,closed:true,iconCls:'icon-save'"
			style="width: 800px; height: 500px; padding: 10px;"></div>
	
</body>
</body>
</html>