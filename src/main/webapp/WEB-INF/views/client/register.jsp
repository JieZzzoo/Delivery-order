<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE>
<html>
<head>

<title>飞毛腿外卖用户注册页面</title>
<%--导入css和js --%>
<link rel="stylesheet" href="/css/main.css" type="text/css"/>
<script type="text/javascript" src="/js/form.js"></script>
</head>

<body class="main">
<!-- 1.网上书城顶部 start -->
       <%@include file="head.jsp"%>

<!-- 网上书城顶部  end -->
       <img src="/images/biao.jpg" width="1518" height="60">
<!--2. 网上书城菜单列表  start -->
       <%@include file="menu_search.jsp" %>
<!-- 网上书城菜单列表  end -->
<!-- 3.网上书城用户注册  start -->
	<div id="divcontent">
		<form:form action="/user/register" modelAttribute="user"  method="post" >
			<table width="850px" border="0" cellspacing="0">
				<tr>
					<td style="padding: 30px"><h1>新用户注册</h1>
						<table width="70%" border="0" cellspacing="2" class="upline">
							<tr>
								<td style="text-align: right">账&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp号：</td>
								<td><input type="text" class="textinput"  id="account" name="account" onkeyup="checkAccount();"/>
								</td>
								<td colspan="2"><span id="accountMsg"></span><font color="#999999">字母数字下划线1到10位, 不能是数字开头</font></td>
							</tr>
							<tr>
								<td style="text-align: right">用&nbsp&nbsp户&nbsp&nbsp名：</td>
								<td><input type="text" class="textinput"  id="userName" name="userName" onkeyup="checkUsername();"/>
								</td>
								<td colspan="2"><span id="usernameMsg"></span><font color="#999999">汉字字母数字下划线1到10位, 不能是数字开头</font></td>
							</tr>
							
							<tr>
								<td style="text-align: right">性&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp别：</td>
								<td colspan="2">&nbsp;&nbsp;
                                <input type="radio" name="gender" value="1" checked="checked" /> 男
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" name="gender" value="0" /> 女
								</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td style="text-align: right">生&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp日：</td>
								<td colspan="2">
								<input type="date" class="textinput" style="width: 150px" name="birthday" id="birthday" />
								</td>
								<td colspan="2">&nbsp</td>
							</tr>
							
							<tr>
								<td style="text-align: right">密&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp码：</td>
								<td><input type="password" class="textinput"  id="password" name="password" onkeyup="checkPassword();"/></td>
								<td><span id="passwordMsg"></span><font color="#999999">密码请设置6-16位字符</font></td>
							</tr>
							<tr>
								<td style="text-align: right">重复密码：</td>
								<td>
								<input type="password" class="textinput"  id="repassword" name="repassword" onkeyup="checkConfirm();"/>
								</td>
								<td><span id="confirmMsg"></span><font color="#999999">请重新输入密码</td>
							</tr>
						</table>
						<table width="70%" border="0" cellspacing="0">
							<tr>
								<td style="padding-top: 20px; text-align: center">
									<input type="image" src="/images/liji.png" onclick="return checkForm()"name="submit" border="0" width="140" height="35"/>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form:form>
	</div>
	
 <!-- 网上书城用户注册  end -->
<!--4. 网上书城下方显示 start -->
     <%@ include file="foot.jsp" %>
<!-- 网上书城下方显示 start -->
</body>
</html>
