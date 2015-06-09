 <%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>作品信息</title>
<link rel=stylesheet type=text/css href="css/homePage.css" />
</head>
 <body class="easyui-layout" bgcolor="#E0ECFF"style="background-image: url('/novelOnLine/images/bg.jpg');background-size:cover;background-attachment:fixed;">
<jsp:include page="/page/head.jsp"></jsp:include>

<div class="bang" style="float:left;height: 500px;margin-right: 40px">
		<p style="color: #00697B" >VIP精品小说推荐</p>
		<ul style="list-style:none">
		<s:iterator value="endBooks" >
			<li style="text-align: left">
				<span>[<s:property value="b_type" />]</span>
				<a href="inforBook.action?id=<s:property value="b_id"/>"> <s:property value="b_name" /></a>
				</li>
			<p class="xian">-------------------</p>
		</s:iterator>
		</ul>
</div>
<div style="width: 70%;margin-top:50px;float:right">
	<s:iterator value="searchBook">
		<div style="margin-bottom: 30px">
			<p style=" text-align: left;color: blue;">
				<a style="color: blue" href="inforBook.action?id=<s:property value="b_id"/>"><s:property value="b_name"/></a>/ 
				<s:property value="n_user.u_name"/>/ 
				<s:property value="b_type"/>
			</p>
			
			<p style="text-align: left">
				<span>简介：</span>
				<s:property value="b_intro"/>
			</p>
		</div>
	</s:iterator>
	<a style="color: RED;" href="nextBook.action?page=pre">上一页</a>&nbsp;&nbsp; 
	<a style="color: RED;" href="nextBook.action?page=next">下一页</a>
</div>
<jsp:include page="../page/foot.jsp"></jsp:include>
</body>
</html>
