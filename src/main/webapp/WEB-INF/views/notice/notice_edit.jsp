<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div style="padding:10px 10px 10px 10px">
	<form id="content" method="post">
		<input type="hidden" name="nId"/>
	    <table cellpadding="5">
	        <tr>
	            <td>公告标题:</td>
	            <td><input class="easyui-textbox" type="text" name="title" data-options="required:true" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>公告内容:</td>
	            <td><input class="easyui-textbox" type="text" name="details" data-options="required:true" style="width: 280px;"></input></td>
	        </tr>
	        
	    </table>
	</form>
	<div style="padding:5px">
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">提交</a>
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">重置</a>
	</div>
</div>
<script type="text/javascript">
	function submitForm(){
		if(!$('#content').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}
		$.post("/notice/edit",$("#content").serialize(), function(data){
			if(data.status == 200){
				$.messager.alert('提示','编辑公告成功!');
				$('#window').window('close');
				$("#noticeList").datagrid("reload");
				clearForm();
			}else{
				$.messager.alert('提示','编辑公告失败!');
			}
		});
	}
	function clearForm(){
		$('#content').form('reset');
	}
</script>