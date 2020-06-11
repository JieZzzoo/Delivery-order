<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>飞毛腿外卖商品简介</title>
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
						<a href="/product/showProductByCategory?category=${product.category}">&nbsp;${product.category}</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;${product.name}
					</div>
					<table cellspacing="0" class="infocontent">
						<tr>
							<td><img src="/images/page_ad.jpg"/  height="200" width="1000">
								<table width="100%%" border="0" cellspacing="0">
									<tr>
										<td width="30%">
											<div class="divbookcover">
												<p>
													<img src="${product.imgurl}" width="213" height="269" border="0" />
												</p>
											</div>
											<div style="text-align:center; margin-top:10px">
												<a href="/product/addCart?pId=${product.pId }">
													<img src="/images/buybutton.jpg" border="0" width="100" height="30" /> 
												</a>
												<a href="/product/showProductByBranch?branch=${product.branch}">
													<img src="/images/xiangsi.png" border="0" width="110" height="34" /> 
												</a>
											</div>
										</td>
										<td style="padding:20px 5px 5px 5px">
											<img src="/images/miniicon3.gif" width="16" height="16" />
											<font class="bookname">&nbsp;${product.name}</font>
											<hr />售价：<font color="#FF0000">￥${product.price}</font>
											<hr /> 类别：${product.category }
											<hr />
											<p>
												<b>商品简介：</b>
											</p> ${product.description}
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
