<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
//退出确认框
function confirm_logout() {   
    var msg = "您确定要退出登录吗？";   
    if (confirm(msg)==true){  
    return true;   
    }else{   
    return false;   
    }   
} 
</script>
<div id="divhead">
	<table cellspacing="0" class="headtable">
		<tr>
			<td>
				<a href="/client/index">
					<img src="/images/logotop.png" width="210" height="70" border="0" /> 
					
				</a>
				<img src="/images/top01.jpg" width="300" height="40" border="0" /> 
			</td>
			<td style="text-align:right" >
				<img src="/images/cart.gif" width="26" height="23" style="margin-bottom:-4px" />
			
				 &nbsp;  &nbsp;<a href="/client/page/myAccount">个人中心</a> 
				 <c:if test="${user==null || msg!=null }">
			
				 &nbsp; &nbsp;<a href="/client/page/login">你好，请登录</a>
				 &nbsp; &nbsp; <a href="/client/page/register">免费注册</a>							
				</c:if>
				<c:if test="${user!=null && msg==null}">
				
				 &nbsp; &nbsp;<a href="/user/logout" onclick="javascript:return confirm_logout()">用户退出</a>
				<br><br><br>欢迎您：${user.userName }
		 	   </c:if>
			</td>		
		</tr>
	</table>
</div>