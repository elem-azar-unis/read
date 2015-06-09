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
function check(){
	
	var a=document.getElementById('t1');
	var b=document.getElementById('t2');
	document.getElementById("p").innerText="";
	if(b.value>=0&&b.value<=10000&&a.value.length>0){
		document.getElementById("sub").disabled=false;
		document.getElementById("p").innerText="";
	}else{
		document.getElementById("p").innerText="1、请检查你填写的小说简介的内容长度是否大于0  2、请检查你所填写的价格是否是大于0小于10000的数字";
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
	<s:form action="novelUpdate.action" >
		
	<table>
		<tr><td><input type="hidden" name="novel.b_id" value="novel.b_id"></input></td></tr>
		<tr><td >小说名称:</td><td align="left" ><s:textfield name="novel.b_name" readonly="true" disabled="true"/></td></tr>
		<tr><td>小说作者:</td><td><s:textfield name="novel.n_user.u_name" readonly="true" disabled="true"/></td></tr>
		<tr><td >小说类型:</td><td ><s:select name="novel.b_type" list="{'玄幻','科幻','同人','漫画','武侠','仙侠','历史','都市','竞技','游戏'}"></s:select></td></tr>
		<tr><td >小说简介:</td><td ><s:textarea   name="novel.b_intro" cols="50" rows="4" id="t1" onblur="check()" /></td></tr>
		<tr><td >是否完结:</td><td><s:select name="novel.b_over" list='{"已完结","未完结"}' ></s:select></td></tr>
		<tr><td >是否免费:</td><td ><s:select name="novel.b_freeScan" list='{"免费","收费"}' ></s:select></td></tr>
		<tr><td >是否推荐:</td><td><s:select name="novel.b_recommend" list='{"推荐","不推荐"}'></s:select> </td></tr>
		<tr><td >浏览总量:</td><td><s:textfield name="novel.b_scanNum" readonly="true" disabled="true" /></td></tr>
		<tr><td >销售价格:</td><td><s:textfield  name="novel.b_salePrice" id="t2" onblur="check()" /></td></tr>
		<tr><s:submit value="更新" disabled="true" id="sub"></s:submit></tr>
	</table>
		
		</s:form>
		<p id="p"></p>
</div>
<jsp:include page="../page/foot.jsp"></jsp:include>

</body>

</html>
