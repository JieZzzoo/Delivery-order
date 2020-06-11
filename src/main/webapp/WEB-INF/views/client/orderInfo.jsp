<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
//退出确认框
function confirm_delete() {   
    var msg = "您确定要删除当前订单吗？此操作不可逆，请慎重！";   
    if (confirm(msg)==true){  
    return "/client/orderinfo";   
    }else{   
    return false;   
    }   
} 
</script>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>飞毛腿外卖</title>
<link rel="stylesheet" href="/css/main.css" type="text/css" />
</head>
<body class="main">
	<jsp:include page="head.jsp" />
	<img src="/images/biao.jpg" width="1518" height="60">
	<jsp:include page="menu_search.jsp" />
	<div id="divpagecontent">
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td>
					<div style="text-align:right; margin:5px 10px 5px 0px">
						<a href="/client/index">首页</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;
						<a href="/client/page/myAccount">我的账户</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;
						<a href="/order/queryOrderByUser">订单查询</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;订单详细信息
					</div>
					<table cellspacing="0" class="infocontent">
						<tr>
							<td>
								<table width="100%" border="0" cellspacing="0">
									<tr>
										<td>
											<p>订单编号:${order.oId}</p>
										</td>
									</tr>
									<tr>
										<td>
											<table cellspacing="1" class="carttable">
												<tr>
													<td width="10%">序号</td>
													<td width="40%">商品名称</td>
													<td width="10%">价格</td>
													<td width="10%">数量</td>
													<td width="10%">小计</td>
												</tr>
											</table> 
											<c:forEach items="${orderResultList}" var="orderResult" varStatus="vs">
												<table width="100%" border="0" cellspacing="0">
													<tr>
														<td width="10%">${vs.count }</td>
														<td width="40%">${orderResult.p.name}</td>
														<td width="10%">${orderResult.p.price }</td>
														<td width="10%">${orderResult.buynum }</td>
														<td width="10%">${orderResult.buynum*orderResult.p.price }</td>
													</tr>
												</table>
											</c:forEach>
											<table cellspacing="1" class="carttable">
												<tr>
													<td style="text-align:right; padding-right:40px;"><font
														style="color:#FF0000">合计：&nbsp;&nbsp;${order.money}</font>
													</td>
												</tr>
											</table>
											<p>
												收货地址：${order.receiverAddress }&nbsp;&nbsp;&nbsp;&nbsp;<br />
												收货人：&nbsp;&nbsp;&nbsp;&nbsp;${order.receiverName }&nbsp;&nbsp;&nbsp;&nbsp;<br />
												联系方式：${order.receiverPhone }&nbsp;&nbsp;&nbsp;&nbsp;
											</p>
											<hr>
											
											<p style="text-align:right">
											<a href="/order/deleteById?oId=${order.oId} && client/orderinfo" onclick="javascript:return o_del()">
											
													<img src="/images/delete.png" width="204" height="60" border="0" />
													
											</a>
											
											
											<c:if test="${order.paystate != 1 }">
											
												<a href="/client/page/pay?oId=${order.oId}&money=${order.money}">
													<img src="/images/qianqu.png" width="204" height="60" border="0" /> 
												</a>
											</p>
											</c:if>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
	<jsp:include page="foot.jsp" />
</body>
</html>
