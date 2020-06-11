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
		function formatDate(value,row,index){
			var date = new Date(value);
			return date.format("yyyy-MM-dd hh:mm:ss");
		}
		
		
		$(function(){
			$('#noticeList').datagrid({
				toolbar:[{
				    text:'新增',
				    iconCls:'icon-add',
				    handler:function(){
				    	//点击按钮触发的事件
				    	$('#window').window({
				    		closed:false,
				    		title:'新增公告',
				    		href:'/notice/page/add',
				    		onLoad:function(){}
				    	});
				    }
				},{
				    text:'编辑',
				    iconCls:'icon-edit',
				    handler:function(){
				    	
				    	//获取选中的行
				    	var rows = $("#noticeList").datagrid("getSelections");
				    	if(rows.length <=0){
				    		$.messager.alert('提示','未选中用户!');
				    		return ;
				    	}
				    	//$.messager.alert('提示','该功能由学员自己实现!');
				    	//弹出window，回显数据
				    	$('#window').window({
				    		closed:false,
				    		title:'编辑公告',
				    		href:'/notice/page/edit',
				    		onLoad:function(){
				    			//获取选中的行数据
				    			var node = $("#noticeList").datagrid("getSelected");
				    			//格式化时间数据
				    			node.birthday = formatDate(node.nTime);
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
				    	var rows = $("#noticeList").datagrid("getSelections");
				    	if(rows.length > 0){
				    		var ids = "";
				    		for(var i = 0; i < rows.length; i++){
				    			ids = ids + rows[i].nId + ",";
				    			}
				    		ids = ids.substring(0, ids.length - 1);
					    	
					    	$.messager.confirm('确认','确定删除ID为 '+ids+' 的公告吗？',function(r){
					    	    if (r){
					            	$.post("/notice/delete",{'ids':ids}, function(data){
					        			if(data.status == 200){
					        				$.messager.alert('提示','删除公告成功!',undefined,function(){
					        					$("#noticeList").datagrid("reload");
					        				});
					        			}
					        		});
					    	    }
					    	});
				    	} else {
				    		$.messager.alert('提示','未选中公告!');
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
				    		title:'查询公告',
				    		href:'/notice/page/query',
				    		onLoad:function(){}
				    	});
				    }
				},'-',{
				    text:'分页导出',
				    iconCls:'icon-remove',
				    handler:function(){
				    	//获取EasyUI分页的参数
				    	var optins = $("#noticeList").datagrid("options");
				    	var page = optins.pageNumber;//当前页数
				    	var rows = optins.pageSize;//页面大小
				    	
				    	window.open("/notice/export/excel/"+page+"/"+rows);
				    }
				},{
					text:'全部导出',
					iconCls:'icon-remove',
					handler:function(){
				    	var optins = $("#noticeList").datagrid("options");
				    	window.open("/notice/export/excelall/");
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
	<table id="noticeList" class="easyui-datagrid" 
				style="width: 700px, height:450px"
				data-options="url:'/notice/list',queryParams:{},method:'get',pageSize:5,pageList:[5,10]
					,singleSelect:false,pagination:true">
				<thead>
					<tr>
						<th data-options="field:'oId'" width="80">公告ID</th>
						<th data-options="field:'title'" width="300">公告标题</th>
						<th data-options="field:'details'" width="500">公告内容</th>
						<th data-options="field:'nTime',formatter:formatDate"
							width="180">公告创建时间</th>
					</tr>
				</thead>
			</table>
</div>
<div id="window" class="easyui-window"
			data-options="modal:true,closed:true,iconCls:'icon-save'"
			style="width: 800px; height: 50	0px; padding: 10px;"></div>
	
</body>
</body>
</html>