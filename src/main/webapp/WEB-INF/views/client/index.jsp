<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>飞毛腿外卖</title>
	

	<%-- 导入css --%>
	<link rel="stylesheet" href="/css/main.css" type="text/css" />
	<!-- 导入首页轮播图css和js脚本 -->
	<link type="text/css" href="/css/autoplay.css" rel="stylesheet" />
	<script type="text/javascript" src="/js/autoplay.js"></script>
	

	
</head>

<body class="main">

	<%@include file="head.jsp"%>
	<img src="/images/biao.jpg" width="1518" height="60">
	<%@include file="menu_search.jsp" %>	
	

	
	
	<!-- 图书商场首页轮播图  start -->
	<div id="box_autoplay">
    	<div class="list">
        	<ul>
            	<li><img src="/ad/index_qiantai01 .jpg" width="900" height="335" /></li>
            	<li><img src="/ad/index_qiantai02.jpg" width="900" height="335" /></li>
            	<li><img src="/ad/index_qiantai03.jpg" width="900" height="335" /></li>
            	<li><img src="/ad/index_qiantai04.jpg" width="900" height="335" /></li>
            	<li><img src="/ad/index_qiantai05.jpg" width="900" height="335" /></li>
            	<li><img src="/ad/index_qiantai06.jpg" width="900" height="335" /></li>
            	<li><img src="/ad/index_qiantai07.jpg" width="900" height="335" /></li>
            	<li><img src="/ad/index_qiantai08.jpg" width="900" height="335" /></li>
        	</ul>
    	</div>

	<!-- 图书商场首页轮播图  end -->	
	</div>
	
	<!-- 新品上市  start-->
	<div id="divcontent">
		<table width="900px" border="0" cellspacing="0">
			<tr>
				<td width="500">
					<img src="/images/xinpin.gif" width="500" height="40" />
					<table width="100%" border="0" cellspacing="0">
						<tr>
							<c:forEach items="${xpList }" var="pArray">
								<td style="width:80; text-align:center">
									
									<a href="/product/findProductById?pId=${pArray.pId }">
									 <br/>
										<img src="${pArray.imgurl}" width="102" height="130" border="0" /> 
									</a>
									
								        <br/>
										 
									<a href="/product/findProductById?pId=${pArray.pId }">${pArray.name}</a>
									 <br/>
									  <br/>
								</td>
							</c:forEach>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		
	</div>
<!-- 	新品上市  end -->
	
	
	<!-- 	喜欢+热卖 start-->
		<div id="divcontent">
		<table width="900px" border="0" cellspacing="0">
			<tr>
				<td width="500">
					<img src="/images/tui.jpg" width="500" height="50" />
					<table width="100%" border="0" cellspacing="0">
						<tr>
							<c:forEach items="${xList }" var="pArray">
								<td style="width:80; text-align:center">
									
									<a href="/product/findProductById?pId=${pArray.pId }">
									 <br/>
										<img src="${pArray.imgurl}" width="102" height="130" border="0" /> 
									</a>
									
								        <br/>
										 
									<a href="/product/findProductById?pId=${pArray.pId }">${pArray.name}</a>
									 <br/>
									  <br/>
								</td>
							</c:forEach>
						</tr>
					</table>
				</td>
				<td style="padding:5px 15px 10px 40px">
					<table width="100%" border="0" cellspacing="0">
						<tr>
							<td>
								<img src="/images/hottitle.gif" width="126" height="29" />
							</td>
						</tr>
					</table>
					<table width="100%" border="0" cellspacing="0">
						<tr>
						<c:forEach items="${pList }" var="pArray">
							<td style="width:80; text-align:center">
								<a href="/product/findProductById?pId=${pArray.pId }">
									<img src="${pArray.imgurl}" width="102" height="130" border="0" /> 
								</a>
								<br/> 
								<a href="/product/findProductById?pId=${pArray.pId }">${pArray.name}</a>
							</td>
						</c:forEach>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
	<!-- 	喜欢+热卖  end -->
	
	
	<!-- 	公告 start -->
	<div id="divcontent">
		<table width="900px" border="0" cellspacing="0">
			<tr>
			<td width="493">
					<img src="/images/billboard.gif" width="497" height="38" />
					<table cellspacing="0" class="ctl">
						<tr>
						<c:forEach items="${nList }" var="nArray">
							<td width="485" height="100%">${nArray.details }</td>
						</c:forEach>	
						</tr>
					</table>
				</td>
				<td >
				<table cellspacing="0" class="ctl">
					&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<img src="/images/you.jpg" width="297" height="250" />
					</table>
				</td>
			</tr>
		</table>
	</div>
	<!-- 	公告 end -->

	<%@ include file="foottop.jsp" %>
	<%@ include file="foot.jsp" %>
</body>
</html>
