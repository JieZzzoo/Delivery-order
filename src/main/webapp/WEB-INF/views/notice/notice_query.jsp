<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div style="padding:10px 10px 10px 10px">
	<form id="content" method="post">
		<input type="hidden" name="nId"/>
	    <table cellpadding="5">
	        <tr>
	            <td>公告标题:</td>
	            <td><input class="easyui-textbox" type="text" id="title" name="title" data-options="required:false" style="width: 280px;"></input></td>
	        </tr>
	        
	        <tr>
	            <td>公告内容:</td>
	            <td><input class="easyui-textbox" id="details" name="details" data-options="validType:'length[0,150]',required:false" style="width: 280px;"></input></td>
	        </tr>
	        
	       
	    </table>
	</form>
	<div style="padding:5px">
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">查询</a>
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">重置</a>
	</div>
</div>
<script type="text/javascript">
	function submitForm(){
		var queryParams={'title':encodeURI($('#title').val()),'details':encodeURI($('#details').val())}
		console.log(queryParams);
		$("#noticeList").datagrid('reload',queryParams);
		$('#window').window('close');
				clearForm();
		
	}
	function clearForm(){
		$('#content').form('reset');
	}
</script>