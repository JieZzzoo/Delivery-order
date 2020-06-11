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
		//处理生日
		function formatDate(value,row,index){
			var date = new Date(value);
			return date.format("yyyy-MM-dd hh:mm:ss");
		}
		//处理性别
		function formatGender(value,row,index){
			if(value == 1) return "男";
			else return "女";
		}
		
		$(function(){
			$('#userList').datagrid({
				toolbar:[{
				    text:'新增',
				    iconCls:'icon-add',
				    handler:function(){
				    	//点击按钮触发的事件
				    	$('#window').window({
				    		closed:false,
				    		title:'新增用户',
				    		href:'/user/page/add',
				    		onLoad:function(){}
				    	});
				    }
				},{
				    text:'编辑',
				    iconCls:'icon-edit',
				    handler:function(){
				    	
				    	//获取选中的行
				    	var rows = $("#userList").datagrid("getSelections");
				    	if(rows.length <=0){
				    		$.messager.alert('提示','未选中用户!');
				    		return ;
				    	}
				    	//$.messager.alert('提示','该功能由学员自己实现!');
				    	//弹出window，回显数据
				    	$('#window').window({
				    		closed:false,
				    		title:'编辑用户',
				    		href:'/user/page/edit',
				    		onLoad:function(){
				    			//获取选中的行数据
				    			var node = $("#userList").datagrid("getSelected");
				    			//格式化时间数据
				    			node.birthday = formatDate(node.birthday);
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
				    	var rows = $("#userList").datagrid("getSelections");
				    	if(rows.length > 0){
				    		var ids = "";
				    		for(var i = 0; i < rows.length; i++){
				    			ids = ids + rows[i].id + ",";
				    		}
				    		ids = ids.substring(0, ids.length - 1);
					    	
					    	$.messager.confirm('确认','确定删除ID为 '+ids+' 的用户吗？',function(r){
					    	    if (r){
					            	$.post("/user/delete",{'ids':ids}, function(data){
					        			if(data.status == 200){
					        				$.messager.alert('提示','删除用户成功!',undefined,function(){
					        					$("#userList").datagrid("reload");
					        				});
					        			}
					        		});
					    	    }
					    	});
				    	} else {
				    		$.messager.alert('提示','未选中用户!');
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
				    		title:'查询用户',
				    		href:'/user/page/query',
				    		onLoad:function(){}
				    	});
				    }
				},'-',{
				    text:'分页导出',
				    iconCls:'icon-remove',
				    handler:function(){
				    	//获取EasyUI分页的参数
				    	var optins = $("#userList").datagrid("options");
				    	var page = optins.pageNumber;//当前页数
				    	var rows = optins.pageSize;//页面大小
				    	
				    	window.open("/user/export/excel/"+page+"/"+rows);
				    }
				},{
					text:'全部导出',
					iconCls:'icon-remove',
					handler:function(){
				    	var optins = $("#userList").datagrid("options");
				    	window.open("/user/export/excelall/");
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
	<table id="userList" class="easyui-datagrid" 
				style="width: 700px, height:450px"
				data-options="url:'/user/list',queryParams:{},method:'get',pageSize:6,pageList:[6,8,10]
					,singleSelect:false,pagination:true">
				<thead>
					<tr>
						<th data-options="field:'id'" width="80">用户ID</th>
						<th data-options="field:'userName',align:'center'" width="120">用户名</th>
						<th data-options="field:'account'" width="120">帐号</th>
						<th data-options="field:'age',align:'center'" width="80">年龄</th>
						<th data-options="field:'birthday',formatter:formatDate"
							width="180">生日</th>
						<th
							data-options="field:'gender',align:'center',formatter:formatGender"
							width="60">性别</th>
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