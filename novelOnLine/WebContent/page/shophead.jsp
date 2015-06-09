<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="css/shopindex.css"></link>
</head>
<body>

<div
	style="text-align: left; border-style: hidden; border-color:red;">
	<s:if test='#session.name!=null'>
	<div style="font-size: 12px;color:#00697B ">
		<a href="getIntoUser.action?name=${sessionScope.name }" class="a1" style="color: red">${sessionScope.name }</a>
		你好，欢迎访问潇湘书院&nbsp;&nbsp;&nbsp;[<a style="color:blue" href="logoutUser.action">退出</a>]
		
	</div>
		
	</s:if>
	<s:else>
		<div style="font-size: 12px;color:#00697B ">
			欢迎访问潇湘书院,请
			<a href="extranceUser.action" class="a1" style="color: red">登录</a>
			或<a href="" class="a1">注册</a>
		</div>
	</s:else>
<img alt="logo" src="/novelOnLine/shop/image/01.bmp" style="margin-left:10px">
<img alt="adver" src="/novelOnLine/shop/image/02.bmp" style="margin-left:200px">
</div>

<div class="block">
<div class="menuDiv"><a href="homePage.action" style="color:white;line-height: 35px">潇湘</a></div>
<div class="menuDiv"><a href="homeShop.action" style="color:white;line-height: 35px">商城</a></div>
<div class="menuDiv"><a href="getIntoUser.action" style="color:white;line-height: 35px">充值</a></div>
<div class="menuDiv"></div>
<div class="menuDiv"></div>
<div class="menuDiv"></div>
<div class="menuDiv"></div>
<div class="menuDiv"></div>
<div class="menuDiv"></div>
<div><a href="searchCarShop.action"><img src="/novelOnLine/shop/image/10.bmp" align="right"></img></a></div>

</div>





</body>
</html>