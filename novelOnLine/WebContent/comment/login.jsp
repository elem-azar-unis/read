<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<style>
	.bg{align:center;float:center;width:75%;border-style: solid;border-color:#A0FFFF;border-width: 2px;overflow: hidden;}
</style>

</head>
 <body class="easyui-layout" bgcolor="#E0ECFF"style="background-image: url('/novelOnLine/images/bg.jpg');background-size:cover;background-attachment:fixed;">
<s:actionmessage/>
<br/><br/><br/>
<fieldset style="width: 95%;margin-left:5px">
	<legend>登录</legend>
	<s:form  action="login.action">
	<table align="center">
	<tr><s:textfield label="用户名" name="name"></s:textfield></tr>
     <tr><s:password label="密    码" name="password"></s:password></tr>
    <tr><s:submit value="提交"></s:submit></tr>
	</table>
	</s:form>
	</fieldset>
</body>
</html>