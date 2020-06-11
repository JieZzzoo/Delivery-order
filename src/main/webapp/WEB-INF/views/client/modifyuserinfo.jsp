<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE>
<html>
<head>
<title>飞毛腿外卖用户信息修改</title>
<link rel="stylesheet" href="/css/main.css" type="text/css" />
<script type="text/javascript" src="/js/form.js"></script>
</head>
<body class="main">
	<jsp:include page="head.jsp" />
	<img src="/images/biao.jpg" width="1518" height="60">
	<jsp:include page="menu_search.jsp" />
	<div id="divpagecontent">
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td width="25%">
					<table width="100%" border="0" cellspacing="0"
						style="margin-top:30px">
						<tr>
							<td class="listtitle">个人帐户</td>
						</tr>
						<tr>
							<td class="listtd">
								<img src="/images/icon1.png" width="15" height="10" />&nbsp;&nbsp;&nbsp;&nbsp; 
								<a href="#">用户信息修改</a>
							</td>
						</tr>
						<tr>
							<td class="listtd">
								<img src="/images/icon2.png" width="15" height="10" />&nbsp;&nbsp;&nbsp;&nbsp; 
								<a href="/order/queryOrderByUser">订单查询</a>
							</td>
						</tr>
						<tr>
							<td class="listtd">
								<img src="/images/icon3.png" width="15" height="10" />&nbsp;&nbsp;&nbsp;&nbsp; 
								<a href="/user/logout">退出账号</a>
							</td>
						</tr>
					</table>
				</td>
				<td>
					<div style="text-align:right; margin:5px 10px 5px 0px">
						<a href="/client/index">首页</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;
						<a href="/client/page/myAccount">&nbsp;我的帐户</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;用户信息修改
					</div>
					<form:form action="/user/editUserInfo?id=${user.id }" modelAttribute="user" method="post" >
					<table cellspacing="0" class="infocontent">
						<tr>
							<td>
								<table width="100%" border="0" cellspacing="2" class="upline">
									<tr>
										<td style="text-align:right; width:20%">账号：</td>
										<td style="width:40%; padding-left:20px">${user.account }</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td style="text-align:right">用户名：</td>
										<td style="padding-left:20px">${user.userName }</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td style="text-align:right">修改密码：</td>
										<td><input type="password" class="textinput"  id="password" name="password" value="${user.password }" onkeyup="checkPassword();"/></td>
								        <td><span id="passwordMsg"></span><font color="#999999">密码请设置6-16位字符</font></td>
									</tr>
									<tr>
										<td style="text-align:right">重复密码：</td>
										<td><input type="password" class="textinput"  id="repassword" name="repassword" value="${user.password }" onkeyup="checkConfirm();"/></td>
								        <td><span id="confirmMsg"></span>&nbsp;</td>
									</tr>
									<tr>
										<td style="text-align:right">性别：</td>
										<td colspan="2">&nbsp;&nbsp;
											<input type="radio" name="gender" value="1" ${user.gender=='1'?'checked':'' }/> 男
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="radio" name="gender" value="0"  ${user.gender=='0'?'checked':'' }/> 女
										</td>
									</tr>
									<tr>
										<td style="text-align:right">出生日期：</td>
										<td colspan="2">
										<input type="date" value="<fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd"/>" name="birthday"/>
										</td>
									</tr>
									<tr>
										<td style="text-align:right">&nbsp;</td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
									</tr>
								</table>
								<p style="text-align:center">
									<input type="image" src="/images/botton_gif_025.gif"  onclick="return checkConfirm();" name="submit" width="140" height="35"/>
								</p>
								<p style="text-align:center">&nbsp;</p>
								
							</td>
						</tr>
					</table>
					</form:form>
				</td>
			</tr>
		</table>
	</div>
	<jsp:include page="foot.jsp" />
</body>
</html>
