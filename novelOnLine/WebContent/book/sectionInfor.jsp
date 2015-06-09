<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>小说章节内容</title>
<script>
document.oncontextmenu=new Function("event.returnValue=false;");
document.onselectstart=new Function("event.returnValue=false;");
</script>
<link rel=stylesheet type=text/css href="css/homePage.css" />
</head>
 <body class="easyui-layout" bgcolor="#E0ECFF"style="background-image: url('/novelOnLine/images/bg.jpg');background-size:cover;background-attachment:fixed;">
<jsp:include page="../page/head.jsp"></jsp:include>

<div style="text-align: left;font-size: 18px;letter-spacing: 1px;margin-top:10px;margin-left:130px;margin-right:130px;background:#fade9f">
	<font face="微软雅黑"><s:property value="sectionContent" escape="false"/></font>
</div>
<div style="margin-top:30px;font-size: 16px;margin-bottom: 20px;font-weight: bold;">
	<a style="color: RED;" href="nextOrPreBook.action?page=pre">上一章</a>&nbsp;&nbsp; 
	[<a style="color:blue;" href="sectionBook.action?id=${sessionScope.novelID}">回目录</a>]&nbsp;&nbsp; 
	<a style="color: RED;" href="nextOrPreBook.action?page=next">下一章</a>
</div>
<jsp:include page="../page/foot.jsp"></jsp:include>
</body>
</html>
