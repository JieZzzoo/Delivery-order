<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>飞毛腿外卖商品列表</title>
	<%--导入css --%>
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
						&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;
						${category }
						&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;
						商品列表
					</div>
					<table cellspacing="0" class="listcontent">
						<tr>
							<td>
								<h1>商品目录</h1>
								<hr />
								<h1>${category} </h1>&nbsp;&nbsp;&nbsp;&nbsp;共&nbsp;${bean.total }&nbsp;种商品
								<hr />
								<div style="margin-top:20px; margin-bottom:5px">
									<img src="/images/plist.jpg" width="100%" height="50" />
								</div>

								<table cellspacing="0" class="booklist">
									<tr>
									   <c:forEach items="${bean.list }" var="p">
											<td>
												<div class="divbookpic">
													<p>
													<a href="/product/findProductById?pId=${p.pId}">
													<img src="${p.imgurl}" width="115" height="129" border="0"/>											
													</a>
													</p>
												</div>
												<div class="divlisttitle">
													<a href="/product/findProductById?pId=${p.pId}">商品名：${p.name } <br />售价：￥${p.price } </a>
												</div>
											</td>
										</c:forEach>
									</tr>
								</table>
								<div class="pagination">
									<ul>
										<c:if test="${bean.pageNum!=1}">
											<li class="disablepage_p">
												<a class="disablepage_a" href="/product/showProductByCategory?page=${bean.pageNum-1}&category=${category}"></a>
											</li>
										</c:if>
										<c:if test="${bean.pageNum==1}">
											<li class="disablepage_p2"></li>
										</c:if>
										<c:forEach begin="1" end="${bean.pages}" var="page">
											<c:if test="${page==bean.pageNum}">
												<li class="currentpage">${page }</li>
											</c:if>
											<c:if test="${page!=bean.pageNum}">
												<li><a href="/product/showProductByCategory?page=${page}&category=${category}">${page}</a>
												</li>
											</c:if>
										</c:forEach>

										<c:if test="${bean.pageNum==bean.pages||bean.pages==0}">
											<li class="disablepage_n2"></li>
										</c:if>
										<c:if test="${bean.pageNum!=bean.pages&&bean.pages!=0}">
											<li class="disablepage_n">
												<a class="disablepage_a" href="/product/showProductByCategory?page=${bean.pageNum+1}&category=${category}"></a>
											</li>
										</c:if>
									</ul>
								</div>
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
