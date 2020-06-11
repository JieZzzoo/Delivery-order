<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div style="padding:10px 10px 10px 10px">
	<form id="content" method="post">
	    <table cellpadding="5">
	        <tr>
	            <td>商品名称:</td>
	            <td><input class="easyui-textbox" type="text" name="name" data-options="required:true" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>商品价格:</td>
	            <td><input class="easyui-numberbox" type="text" name="price" data-options="precision:0,required:true" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>商品分类:</td>
	            <td>
	          <!--   <select>

               <option class="easyui-textbox" name="category" data-options="required:true" style="width: 280px;" >美食</option>
               <option value="甜品">甜品</option>
        

                  </select> -->
	            
	            
	            <input class="easyui-textbox" type="text" name="category" data-options="required:true" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>商品子分类:</td>
	            <td><input class="easyui-textbox" type="text" name="branch" data-options="required:true" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>商品库存量:</td>
	            <td><input class="easyui-numberbox" type="text" name="pnum" data-options="precision:0,required:true" />
	            </td>
	        </tr>
	        <tr>
	            <td>商品描述:</td>
	            <td><input class="easyui-textbox" type="text" name="description" data-options="required:true" style="width: 280px;"></input></td>
	        </tr>
	         <tr>
	            <td>商品图片:</td>
	            <td><input class="easyui-textbox" type="text" name="imgurl" data-options="required:true" style="width: 280px;" value="/productImg/"></input> 
	           <!--  <label type="button" class="btn">
                   <input type="file" />
	            </label> -->
	    </table></td>
	            
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
		$.post("/product/save",$("#content").serialize(), function(data){
			if(data.status == 200){
				$.messager.alert('提示','新增商品成功!');
				$('#window').window('close');
				$("#productList").datagrid("reload");
				clearForm();
			}else{
				$.messager.alert('提示','新增商品失败!');
			}
		});
	}
	function clearForm(){
		$('#content').form('reset');
	}
</script>