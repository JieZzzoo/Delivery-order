<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">
/**
 * my_click和my_blur均是用于前台页面搜索框的函数
 */
//鼠标点击搜索框时执行
function my_click(obj, myid){
	//点击时，如果取得的值和搜索框默认value值相同，则将搜索框清空
	if (document.getElementById(myid).value == document.getElementById(myid).defaultValue){
	  document.getElementById(myid).value = '';
	  obj.style.color='#000';
	}
}
//鼠标不聚焦在搜索框时执行
function my_blur(obj, myid){
	//鼠标失焦时，如果搜索框没有输入值，则用搜索框的默认value值填充
	if (document.getElementById(myid).value == ''){
	 document.getElementById(myid).value = document.getElementById(myid).defaultValue;
	 obj.style.color='#999';
 }
}

/**
 * 点击搜索按钮执行的函数
 */
function search(){
	document.getElementById("searchform").submit();
}
</script>
<div id="divmenu">
       <a href="/client/index">首页</a>
       <a href="/product/showProductByCategory?category=美食">美食</a>
        <a href="/product/showProductByCategory?category=甜品">甜品</a>
        <a href="/product/showProductByCategory?category=饮料">饮料</a>
        <a href="/product/showProductByCategory?category=蔬菜">蔬菜</a>
        <a href="/product/showProductByCategory?category=水果">水果</a>
        <a href="/product/showProductByCategory?category=药品">药品</a>
        <a href="/product/showProductByCategory?category=鲜花">鲜花</a>
        <a href="/product/showProductByCategory?category=蛋糕">蛋糕</a>
        <a href="/product/showProductByCategory?category=火锅">火锅</a>
        <a href="/product/showProductByCategory?category=宵夜">宵夜</a>
        <a href="/product/showProductByCategory?category=家常菜">家常菜</a>
        <a href="/product/showProductByCategory?category=日韩料理">日韩料理</a>
        <a href="/product/showProductByCategory?category=北方佳肴">北方佳肴</a>
        <a href="/product/showProductByCategory?category=快食简餐">快食简餐</a>
        <a href="/product/showProductByCategory?category=全部商品目录">全部外卖商品目录</a>
</div>
<div id="divsearch">
<form action="/product/showProductByName" id="searchform">
	<table width="100%" border="0" cellspacing="0">
		<tr>
			<td style="text-align:right; padding-right:220px">
				Search 
				<input type="text" name="name" class="inputtable" id="textfield" value="请输入外卖商品名"
				onmouseover="this.focus();"
				onclick="my_click(this, 'textfield');"
				onBlur="my_blur(this, 'textfield');"/> 
				<a href="#">
					<img src="/images/serchbutton.gif" border="0" style="margin-bottom:-4px" onclick="search()"/> 
				</a>
				<br>
				 <a href="/product/showProductByBranch?branch=辣子鸡">辣子鸡</a>
                 <a href="/product/showProductByBranch?branch=奶茶">奶茶</a>
        		 <a href="/product/showProductByName?name=求爱<br>【99枝红玫瑰鲜花花束】">玫瑰鲜花</a>
      			 <a href="/product/showProductByName?name=【鸳鸯火锅】尊享3-4人火锅">火锅</a>
       			 <a href="/product/showProductByName?name=【蛋糕】水果组合">蛋糕</a>
        		 <a href="/product/showProductByName?name=【进口】越南优质白火龙果">火龙果</a>
       			 <a href="/product/showProductByName?name=四拼口味慕斯">甜品</a>
			</td>
		</tr>
	</table>
</form>
</div>