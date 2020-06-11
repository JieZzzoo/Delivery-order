<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div style="padding:10px 10px 10px 10px">
	<form id="content" method="post">
		<input type="hidden" name="pId"/>
	    <table cellpadding="5">
	        <tr>
	            <td>商品名称:</td>
	            <td><input class="easyui-textbox" type="text" id="name" name="name" data-options="required:false" style="width: 280px;"></input></td>
	        </tr>
	        
	        <tr>
	            <td>商品分类:</td>
	            <td><input class="easyui-textbox" id="category" name="category" data-options="validType:'length[0,150]',required:false" style="width: 280px;"></input></td>
	        </tr>
	        
	        
	        
	          <tr>
	            <td>商品价格:</td>
	            <td>
	            	<input class="easyui-radio" type="radio" name="price" value="1" /> 50元以下
	            	<input class="easyui-radio" type="radio" name="price" value="2"/> 50~100元
	            	<input class="easyui-radio" type="radio" name="price" value="3" /> 100~200元
	            	<input class="easyui-radio" type="radio" name="price" value="4"/> 200元以上
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
		var queryParams={'name':encodeURI($('#name').val()),'category':encodeURI($('#category').val()),'price':$('input[name="price"]:checked').val()}
		console.log(queryParams);
		$("#productList").datagrid('reload',queryParams);
		$('#window').window('close');
				clearForm();
		
	}
	function clearForm(){
		$('#content').form('reset');
	}
</script>