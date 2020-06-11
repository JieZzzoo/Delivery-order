<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div style="padding:10px 10px 10px 10px">
	<form id="content" method="post">
		<input type="hidden" name="oId"/>
	    <table cellpadding="5">
	        <tr>
	            <td>收货人姓名:</td>
	            <td><input class="easyui-textbox" type="text" id="receiverName" name="receiverName" data-options="required:false" style="width: 280px;"></input></td>
	        </tr>
	        
	        <tr>
	            <td>收货地址:</td>
	            <td><input class="easyui-textbox" id="receiverAddress" name="receiverAddress" data-options="validType:'length[0,150]',required:false" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>收货人电话:</td>
	            <td><input class="easyui-textbox" type="text" id="receiverPhone" name="receiverPhone" data-options="required:false" style="width: 280px;"></input></td>
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
		var queryParams={'receiverName':encodeURI($('#receiverName').val()),'receiverAddress':encodeURI($('#receiverAddress').val()),'receiverPhone':encodeURI($('#receiverPhone').val())}
		console.log(queryParams);
		$("#orderList").datagrid('reload',queryParams);
		$('#window').window('close');
				clearForm();
		
	}
	function clearForm(){
		$('#content').form('reset');
	}
</script>