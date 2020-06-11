<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div style="padding:10px 10px 10px 10px">
	<form id="content" method="post">
		<input type="hidden" name="id"/>
	    <table cellpadding="5">
	        <tr>
	            <td>帐号:</td>
	            <td><input class="easyui-textbox" type="text" id="account" name="account" data-options="required:false" style="width: 280px;"></input></td>
	        </tr>
	        
	        <tr>
	            <td>用户名:</td>
	            <td><input class="easyui-textbox" id="userName" name="userName" data-options="validType:'length[0,150]',required:false" style="width: 280px;"></input></td>
	        </tr>
	        
	        <tr>
	            <td>性别:</td>
	            <td>
	            	<input class="easyui-radio" type="radio" name="gender" value="1" /> 男
	            	<input class="easyui-radio" type="radio" name="gender" value="0"/> 女
	            </td>
	        </tr>
	        
	          <tr>
	            <td>年龄:</td>
	            <td>
	            	<input class="easyui-radio" type="radio" name="age" value="1" /> 小于10岁
	            	<input class="easyui-radio" type="radio" name="age" value="2"/> 10-30岁
	            	<input class="easyui-radio" type="radio" name="age" value="3" /> 30-50岁
	            	<input class="easyui-radio" type="radio" name="age" value="4"/> 50岁以上
	            </td>
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
		var queryParams={'account':encodeURI($('#account').val()),'userName':encodeURI($('#userName').val()),'gender':$('input[name="gender"]:checked').val(),'age':$('input[name="age"]:checked').val()}
		console.log(queryParams);
		$("#userList").datagrid('reload',queryParams);
		$('#window').window('close');
				clearForm();
		
	}
	function clearForm(){
		$('#content').form('reset');
	}
</script>