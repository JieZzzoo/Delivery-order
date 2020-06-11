<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>飞毛腿外卖</title>
	<link rel="stylesheet" href="/css/main.css" type="text/css" />
	<script type="text/javascript">
	//删除订单
	function o_del() {   
	    var msg = "您确定要删除该订单吗？";   
	    if (confirm(msg)==true){   
	    return true;   
	    }else{   
	    return false;   
	    }   
	} 
	
	//退出确认框
	function confirm_logout() {   
	    var msg = "您确定要退出登录吗？";   
	    if (confirm(msg)==true){   
	    	return true
	    }else{   
	    return false;   
	    }   
	} 
	</script>
</head>
<body class="main">
	<jsp:include page="head.jsp" />
	<img src="/images/biao.jpg" width="1518" height="60">
	<jsp:include page="menu_search.jsp" />
	<div id="divpagecontent">
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td width="25%">
					<table width="100%" border="0" cellspacing="0" style="margin-top:30px">
						<tr>
							<td class="listtitle">我的帐户</td>
						</tr>
						<tr>
							<td class="listtd">
								<img src="/images/icon1.png" width="15" height="10" />
								&nbsp;&nbsp;&nbsp;&nbsp; 
								<a href="/client/page/modifyUserInfo">用户信息修改</a>
							</td>
						</tr>
						<tr>
							<td class="listtd">
								<img src="/images/icon2.png" width="15" height="10" />
								&nbsp;&nbsp;&nbsp;&nbsp; 
								<a href="#">订单查询</a>
								<!-- /order/findOrderByUser -->
							</td>
						</tr>
						<tr>
							<td class="listtd">
								<img src="/images/icon3.png" width="15" height="10" />
								&nbsp;&nbsp;&nbsp;&nbsp; 
								<a href="/user/logout" onclick="javascript:return confirm_logout()">用户退出</a>
							</td>
						</tr>
					</table>
				</td>
				<td>
					<div style="text-align:right; margin:5px 10px 5px 0px">
						<a href="/client/index">首页</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;
						<a href="/client/page/myAccount">&nbsp;我的帐户</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;
						订单查询
					</div>
					<table cellspacing="0" class="infocontent">
						<tr>
							<td style="padding:20px"><p><b>我的订单</b></p>
								<p>
									共有<font style="color:#FF0000" >${orders.size()}</font>订单
								</p>
								<table width="100%" border="0" cellspacing="0" class="tableopen">
									<tr>
										<td bgcolor="#A3E6DF" class="tableopentd01">订单号</td>
										<td bgcolor="#A3D7E6" class="tableopentd01">收件人</td>
										<td bgcolor="#A3CCE6" class="tableopentd01">下单时间</td>
										<td bgcolor="#A3B6E6" class="tableopentd01">状态</td>
										<td bgcolor="#A3E2E6" class="tableopentd01">操作</td>
									</tr>
									<c:forEach items="${orders}" var="order">
										<tr>
											<td class="tableopentd02">${order.oId}</td>
											<td class="tableopentd02">${order.receiverName }</td>
											<td class="tableopentd02"><fmt:formatDate value="${order.ordertime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
											<td class="tableopentd02">${order.paystate==0?"未支付":"已支付"}</td>
											<td class="tableopentd03">
												<a href="/orderitem/findOrderItemById?oId=${order.oId} ">查看</a>&nbsp;&nbsp;
												<a href="/order/deleteById?oId=${order.oId} "  onclick="javascript:return o_del()">刪除</a>
											</td>
										</tr>
									</c:forEach>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
	<%@ include file="foot.jsp" %>
</body>
</html>
