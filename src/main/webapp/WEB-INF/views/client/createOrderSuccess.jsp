<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>外卖订单生成</title>
	<link rel="stylesheet" href="/css/main.css" type="text/css" />
	<script type="text/javascript" src="/js/my.js">	
	</script>
</head>
<body class="main">
	<jsp:include page="head.jsp" />
	<img src="/images/biao.jpg" width="1518" height="60">
	<jsp:include page="menu_search.jsp" />
	<div id="divcontent">
		<table width="850px" border="0" cellspacing="0">
			<tr>
				<td style="padding:30px; text-align:center">
				    <table width="60%" border="0" cellspacing="0" style="margin-top:70px">
						<tr>
							<td style="width:98">
								<img src="/images/to1.jpg" width="128" height="128" />
							</td>
							<td style="padding-top:30px">
							<a href="/order/queryOrderByUser">
							<!-- <a href="/client/page/myAccount"> -->
								<font style="font-weight:bold; color:#FF0000">亲，订单已生成，请点击此文字到“个人中心”-“订单查询”中支付！</font><br /> <br />
								
									</a>
									<!-- <span id="second">5</span>秒后自动为您转跳回个人中心 -->
							</td>
						</tr>
					</table>
				  <h1>&nbsp;</h1>
				</td>
			</tr>
		</table>
	</div>
	<jsp:include page="foot.jsp" />
</body>
</html>
