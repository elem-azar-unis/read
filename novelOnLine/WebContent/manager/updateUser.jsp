 <%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>管理员功能界面</title>
<style>
	.t{text-align: center}
	.aa{margin-bottom: 50px;margin-top:50px;font-size: 18px;color:green; font-weight: bold;}
	.p1{text-align: left;font-size: 14px;color:green}
	.l{border-bottom-width: 2px;border-bottom-style: dotted;border-bottom-color: #D2D2D2;height: 150px}
	.bigDiv{font-size: 14px;color: #FF00FF; float:left;width:20%; clear:left;height:600px; border-style: solid ;border-color: #00697B;border-width:  1px}
</style>

<script type="text/javascript">
function hiddenDiv(div){
	div.style.display=(div.style.display=='none'?'block':'none');
}
function check(obj){
	
	if(obj.value>0&&obj.value<=10){
		document.getElementById("t1").innerText="";
		document.getElementById("sub").disabled=false;
	}else{
		document.getElementById("t1").innerText="作家等级应为0-10的数字";
		document.getElementById("sub").disabled=true;
		}
	
}
</script>
<link rel=stylesheet type=text/css href="css/homePage.css" />
</head>
 <body class="easyui-layout" bgcolor="#E0ECFF"style="background-image: url('/novelOnLine/images/bg.jpg');background-size:cover;background-attachment:fixed;">
<jsp:include page="../page/head.jsp"></jsp:include>
<div class="bigDiv" >
<div style="margin-top:100px">
	<div style="background-color:#A0FFFF;height: 40px">
	<div style="margin-left:15px;line-height: 40px">
		<a  href="javascript:void(0)" onmousedown="hiddenDiv(document.getElementById('div1'))">用户管理</a>
	</div>
	</div>
	<div id="div1" style="margin-top:10px;height: 60px">
			<p ><a  href="usuallyUser.action">用户管理</a></p>
			
	</div>
	
	<div style="background-color:#A0FFFF;height: 40px;">
	<div style="margin-left:15px;line-height: 40px">
		<a href="javascript:void(0)" onmousedown="hiddenDiv(document.getElementById('div2'))">书籍管理</a>
	</div>
	</div>
	<div id="div2" style="margin-top:10px;height: 90px">
			<p><a href="ManBBook.action">小说管理</a></p>
	</div>
	
	<div style="background-color:#A0FFFF;height: 40px;">
	<div style="margin-left:15px;line-height: 40px">
		<a href="javascript:void(0)" onmousedown="hiddenDiv(document.getElementById('div3'))">统计</a>
	</div>
	<div id="div3" style="margin-top:10px">
			<p><a href="jFreeChart.action">统计</a></p>
	</div>
	</div>
</div>
</div>
<div style="float:right;width:78%;margin-top:30px">
	<s:form action="updateUser.action" >
		
	<table>
		
		<tr><td >用户ID:</td><td align="left" ><s:textfield name="n_user.u_id" readonly="true" /></td></tr>
		<tr><td>用户名称:</td><td><s:textfield name="n_user.u_name" readonly="true" /></td></tr>
		<tr><td >登陆密码:</td><td ><s:textfield  name="n_user.u_psw" readonly="true" /></td></tr>
		<tr><td >是否是作家:</td><td ><s:textfield  name="n_user.u_author" readonly="true" /></td></tr>
		<tr><td >钱包余额:</td><td><s:textfield name="n_user.u_balance" readonly="true"/></td><td></td></tr>
		<tr><td >消费总额:</td><td ><s:textfield name="n_user.u_expense" readonly="true"/></td></tr>
		<tr><td >作家等级:</td><td><s:textfield name="n_user.u_level" id="level" onblur="check(this)" /></td><td id="t1"></td></tr>
		
		<tr><s:submit value="更新" disabled="true" id="sub"></s:submit></tr>
	</table>
		
		</s:form>
</div>
<jsp:include page="../page/foot.jsp"></jsp:include>

</body>

</html>
