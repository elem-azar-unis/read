<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>搜索</title>

<link rel=stylesheet type=text/css href="css/homePage.css" />
</head>
 <body class="easyui-layout" bgcolor="#E0ECFF"style="background-image: url('/novelOnLine/images/bg.jpg');background-size:cover;background-attachment:fixed;">
<jsp:include page="../page/head.jsp"></jsp:include>


<div style="margin-top:30px;text-align: left;margin-left:450px;margin-bottom: 50px">
<form action="search1Book.action">
	
	<s:textfield label="关键字" name="bookName"  cssStyle="width:120px;height:14px;"></s:textfield>
	
	<input type="submit" value="快速搜索" ></input><br></br>
	<s:radio cssStyle="" name="bookTag" value="1" list="#{'1':'书名','2':'作者名'}"></s:radio><br></br>
	<p style="">小说类型:</p>
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


<jsp:include page="../page/foot.jsp"></jsp:include>
</body>
</html>
