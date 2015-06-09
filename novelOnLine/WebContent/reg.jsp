 <%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>head</title>

</head>
<body>
<jsp:include page="/page/head.jsp"></jsp:include>
<div style="float:left">
	<img style="width: 400px;height: 400px" src="images/login.jpg" ></img>
</div>
<div style="float:left;margin-top:50px">
	<fieldset style="width:500px;height: 300px">
	<legend>用户注册:</legend>
	<s:form action="reg.action">
	<s:fielderror></s:fielderror>
		<s:textfield label="用户名" name="n_user.u_name" ></s:textfield><br/>	
		<s:password label="密码" name="n_user.u_psw"  ></s:password><br/>
		<s:password label="确认密码" name="u_psw"  ></s:password><br/>
		<s:submit value="注册"  ></s:submit>
	</s:form></fieldset>

</div>

<jsp:include page="/page/foot.jsp"></jsp:include>

</body>
</html>
