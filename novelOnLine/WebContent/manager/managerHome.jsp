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
	.one{background-color:#FFCEA0;}
	.two{background-color:#A0FFFF;}
	.aa{margin-bottom: 50px;margin-top:50px;font-size: 18px;color:green; font-weight: bold;}
	.p1{text-align: left;font-size: 14px;color:green}
	.l{border-bottom-width: 2px;border-bottom-style: dotted;border-bottom-color: #D2D2D2;height: 150px}
	.bigDiv{font-size: 14px;color: #FF00FF; float:left;width:20%; clear:left;height:600px; border-style: solid ;border-color: #00697B;border-width:  1px}
</style>
<script type="text/javascript">
	function trcolor(){
			var tabnode=document.getElementById("table");
			var trs=tabnode.rows;
		
			for(var x=0;x<trs.length;x++){
				if(x%2==1)
					trs[x].className="one";
				else
					trs[x].className="two";
				}	
		}
window.onload=trcolor;

</script>
<script type="text/javascript">
function hiddenDiv(div){
	div.style.display=(div.style.display=='none'?'block':'none');
}
</script>
<link rel=stylesheet type=text/css href="css/homePage.css" />
</head>
 <body class="easyui-layout" bgcolor="#E0ECFF" style="background-image: url('/novelOnLine/images/bg.jpg');background-size:cover;background-attachment:fixed;">
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
	<table id="table">
		<tr>
			<th>用户ID</th>
			<th>用户名称</th>
			<th>登陆密码</th>
			<th>是否是作者</th>
			<th>作家等级</th>
			<th>钱包余额</th>
			<th>消费总额</th>
			<th>操作</th>
			<th>操作</th>
			<th>操作</th>
		</tr>
		<s:iterator value="users" >
			<tr>
			<td style="height:40px;text-align: center"><s:property value="u_id"/></td>
			<td class="t" ><s:property value="u_name"/></td>
			<td class="t" ><s:property value="u_psw"/></td>
			<td class="t" ><s:property value="u_author"/></td>
			<td class="t"><s:property value="u_level"/></td>
			<td class="t"><s:property value="u_balance"/></td>
			<td class="t"><s:property value="u_expense"/></td>
			<td class="t"><a href="inforUser.action?name=<s:property value="u_name"/>">修改</a></td>
			<td class="t"><a href="deleteUser.action?name=<s:property value="u_name"/>">删除</a></td>
			</tr>
		</s:iterator>
		</table>
	<a href="nextUser.action?page=pre">上一页</a>
	 &nbsp;&nbsp;第${pageNum/10+1}页/共${number}页&nbsp;&nbsp;
	<a href="nextUser.action?page=next">下一页</a>
	<s:form  action="nextUser.action?page=null">
	跳到第<s:select cssStyle="margin-top:-25px;margin-left:130px"  name="pNum"  list="pageList" />
	<input style="margin-left:50px" type="submit" value="GO" />
	
	
	</s:form>
</div>
<jsp:include page="../page/foot.jsp"></jsp:include>

</body>

</html>
