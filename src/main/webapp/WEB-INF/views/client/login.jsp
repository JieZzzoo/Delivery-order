<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>飞毛腿外卖用户登录</title>

	<link rel="stylesheet" href="/css/main.css" type="text/css" />
	

</head>
<body class="main">
	<jsp:include page="head.jsp" />
    <img src="/images/biao.jpg" width="1518" height="60">
	<jsp:include page="menu_search.jsp"/>
	<div id="divcontent">
		<form:form action="/user/login" method="post" modelAttribute="user">
			<table width="900px" border="0" cellspacing="0">
				<tr>
					<td style="padding:30px"><div style="height:470px">
							<b>&nbsp;&nbsp;首页&nbsp;&raquo;&nbsp;个人用户登录</b>
							<div>
								<table width="85%" border="0" cellspacing="0">
									<tr>
										<td>
											<div id="logindiv">
												<table width="100%" border="0" cellspacing="0">
													<tr>
														<td style="text-align:center; padding-top:20px">
															<img src="/images/logintitle.gif" width="150" height="30" />
														</td>
													</tr>
													<tr>
														<td style="text-align:center;padding-top:20px;"><font
															color="#ff0000">${requestScope["register_message"]}</font>
														</td>
													</tr>
													<tr>
														<td style="text-align:center">
															<table width="80%" border="0" cellspacing="0"
																style="margin-top:15px ;margin-left:auto; margin-right:auto">
																<tr>
																	<td
																		style="text-align:right; padding-top:5px; width:25%">用户名：</td>
																	<td style="text-align:left"><input name="userName"
																		type="text" class="textinput"  />
																	<%-- 	value=${user.userName} --%>
																	</td>
																</tr>
																<tr>
																	<td style="text-align:right; padding-top:5px">密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
																	<td style="text-align:left"><input name="password"
																		type="password" class="textinput"  />
																		<%-- value=${user.passsword} --%>
																	</td>
																</tr>
		                                                        
																<tr>
																	<td colspan="2" style="text-align:center">
																		<input type="checkbox" name="checkbox" value="checkbox01" />记住用户名
																		&nbsp;&nbsp; 
																		<input type="checkbox" name="checkbox" value="checkbox02" /> 自动登录
																	</td>
																</tr>
																
																<tr>
																	<td colspan="2"
																		style="padding-top:10px; text-align:center">
																		<input name="image" type="image" onclick="return formcheck()"
																		src="/images/kaiqi.png" width="120" height="40" />
																	</td>
																</tr>

																<tr>
																	<td colspan="2" style="padding-top:10px">
																		<img src="/images/loginline.gif" width="241" height="10" />
																	</td>
																</tr>
																<tr>
																	<td colspan="2"
																		style="padding-top:10px; text-align:center"></td>
																</tr> 
																<tr>
																	<td colspan="2" style="padding-top:10px;text-align:center" ">
																	<c:if test="${!empty msg }">${msg}</c:if>
																	<%-- <%  
																	   if(request.getSession().getAttribute("msg")!=null)  {
																	         out.print(request.getSession().getAttribute("msg"));
																	    }
																	%> --%>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</div></td>
										<td style="text-align:left; padding-top:30px; width:60%"><h1>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp您还没有注册？</h1>
											<h4>免费注册新用户，享受更优惠价格!</h4>
											<h4>外卖商品丰富齐全,各种不同类型的商品应有尽有,还有各种优惠...</h4>
											<h4>只有你想不到,没有我们做不到的,新用户更有专享...</h4>
													<h4>满满的优惠券信息,先领券再购物,轻松享受折扣优惠,欢迎注册！</h4>
											<p style="text-align:left">
												<a href="/client/page/register">
												&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<img src="/images/zhu.png" width="135" height="40" />
												</a>
											</p>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</form:form>
	</div>
	<jsp:include page="foot.jsp" />
	
	<div><%=request.getAttribute("cc_error") == null ? "" : request.getAttribute("cc_error")%></div>
    <div><%=request.getAttribute("login_error") == null ? "" : request.getAttribute("login_error") %></div>
</body>


</html>
