 <%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>head</title>
<script type="text/javascript">
	function check(obj,str){
	  if(obj.value.length==0){
			document.getElementById('d').innerText='不能为空';
			 document.getElementById('sub').disabled=true
		  }else
		  {
			  document.getElementById('d').innerText='';
			  if(document.getElementById(str).value.length!=0){
				  document.getElementById('sub').disabled=false;
			  }
		}
	}
	function login(){
			 document.getElementById('sub').disabled=true;
	}
	window.onload=login;
</script>
</head>
<body style="background-image: url('/novelOnLine/images/bg.jpg');background-size:cover;background-attachment:fixed;">
<jsp:include page="/page/head.jsp"></jsp:include>
<div style="float:left;margin-left:170px;margin-top:10px;margin-bottom:10px">
	<img style="width: 400px;height: 400px" src="images/login.jpg" ></img>
</div>
<div style="float:left;margin-top:50px">
	<fieldset style="width:500px;height: 300px">
	<legend>用户登陆:</legend>
	<s:form action="loginUser.action">
	<%--<table>
	<tr ><td >用户名：<input type="text" name="n_user.u_name" onchange="check(this,'psw')" id="name"></input>	<span id="d"></span></td> </tr>
	<tr><td>密码：<input type="password"name="n_user.u_psw" id="psw" onchange="check(this,'name')" ></input></td> </tr>
	<tr><td><input type="submit"  value="登录" id="sub" /></td> </tr>
	</table>
		--%>
		<s:textfield label="用户名" name="n_user.u_name" onchange="check(this,'psw')" id="name"></s:textfield><br/>	<div id="d"></div>
		<s:password label="密码" name="n_user.u_psw" id="psw" onchange="check(this,'name')" ></s:password><br/>
		<s:submit value="登录" id="sub"  ></s:submit>
		
	</s:form>
	</fieldset>
</div>

<jsp:include page="/page/foot.jsp"></jsp:include>

</body>
</html>
