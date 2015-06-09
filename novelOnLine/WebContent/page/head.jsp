<%@ page language="java"  contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>head</title>
<link rel=stylesheet type=text/css href="css/homePage.css" />
</head>
<body>

<div style="text-align: left;border-color:#A0FFFF;border-width: 2px" >
	
	<s:if test='#session.name!=null'>
	<div style="font-size: 12px;color:#00697B ">
		<a href="getIntoUser.action?name=${sessionScope.name }" class="a1" style="color: red">${sessionScope.name }</a>
		你好，欢迎访问T4读书网&nbsp;&nbsp;&nbsp;[<a style="color:blue" href="logoutUser.action">退出</a>]
		
	</div>
		
	</s:if>
	<s:else>
		<div style="font-size: 12px;color:#00697B ">
			欢迎访问T4读书网,请
			<a href="extranceUser.action" class="a1" style="color: red">登录</a>
			或<a href="/novelOnLine/reg.jsp" class="a1">注册</a>
		</div>
	</s:else>
	<img alt="logo" src="/novelOnLine/images/logo.png"  style="height:70px; width:250px">
</div>
<div style="font-size: 12px;overflow: hidden;margin-top:5px;">


	<form action="searchBook.action">
	<s:textfield label="关键字" name="bookName"  cssStyle="width:120px;height:14px;"></s:textfield>
	<s:select  list="{'书名','作者名'}" name="bookTag"></s:select>
	<input type="submit" value="快速搜书" style="width:80px;"></input>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="moreBook.action?type=同人&flag=1">同人</a>·
	<a class="a2" href="moreBook.action?type=漫画&flag=1">漫画</a>
	<a href="moreBook.action?type=玄幻&flag=1">玄幻</a>·
	<a class="a2" href="moreBook.action?type=科幻&flag=1">科幻</a>
	<a href="moreBook.action?type=游戏&flag=1">游戏</a>·
	<a  class="a2" href="moreBook.action?type=竞技&flag=1">竞技</a>
	<a href="moreBook.action?type=历史&flag=1">历史</a>·
	<a  class="a2" href="moreBook.action?type=都市&flag=1">都市</a>
	<a href="moreBook.action?type=仙侠&flag=1">仙侠</a>·
	<a class="a2" href="moreBook.action?type=武侠&flag=1">武侠</a>
	</form>
</div>
<div class="block" style="border:0;margin-top:5px;">
	<div class="menuDiv"><a href="homePage.action"><br/>首页</a></div>
	<div class="menuDiv"><a href="seaBook.action"><br/>搜书</a></div>
	<div class="menuDiv"><a href="mainComment.action"><br/>论坛</a></div>
	<div class="menuDiv"><!--a href=""--><br/>商城(暂留)</div>
	<div class="menuDiv"><a href="VIPBook.action"><br/>管理</a></div>
	<div class="menuDiv"><a href="getIntoUser.action"><br/>作者</a></div>
	<div class="menuDiv"><a href="getIntoUser.action"><br/>充值</a></div>
</div>
</body>
</html>