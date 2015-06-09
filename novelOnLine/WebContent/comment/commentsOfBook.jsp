<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>这本书的所有评论</title>
  <link rel=stylesheet type=text/css href="<%=path%>/css/common.css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
// 跳页
	$("#jspageup").click(function(){
		if($("#jspageNo").val()<1||$("#jspageNo").val()>100000)
		{
			alert("请输入合理的页数");
			return false;
		}
		if($("#jspageNo").val()>$("#totlesize").val())
		{
			alert("请选择小于总页数的跳转页数");
			return false;
		}
		var pageNum=$("#jspageNo").val();
		var type=$("#type").val();
		window.location.href="pageupComments.action?page="+pageNum+"&bid="+bid;
		});
});
</script>
<style>
	li{margin-bottom: 10px}
	body{text-align: center;width: 80%;margin-left: 100px;font-size: 12px;height: auto}
	.a1{text-decoration: none;margin-left: 5px;margin-right: 5px}
	.a2{margin-right: 20px}
	a{text-decoration: none;}
	.menuDiv{float:left;font-size: 20px;font-weight: bold;color: #00697B;margin-top:-10px;
			width:144px;background-image: url("/novelOnLine/images/menu.jpg");height: 50px;text-align: center}
	span{color: gray}
	a{color: BLACK}
	.bang{float:left;width:20%;border-style: none;border-color:#A0FFFF;border-width: 2px;overflow: hidden; }
	.bg{float:right;width:75%;border-style: none;border-color:#A0FFFF;border-width: 2px;overflow: hidden;}
	.block{background-color:#A0FFFF;height: 40px;width:100% ;text-align: left;overflow: hidden;}
</style>
</head>
 <body class="easyui-layout" bgcolor="#E0ECFF" style="background-image: url('/novelOnLine/images/bg.jpg');background-size:cover;background-attachment:fixed;">
<input type="hidden" value="${totlesize}" id="totlesize" />
<input type="hidden" value="${bid}" id="bid" />
<jsp:include page="../page/head.jsp"></jsp:include>
<%--<div style="border-style: solid;border-color:#A0FFFF;border-width: 2px" >
	<div style="text-align: center;color:blue；font-size: 20px;"><font color=blue size=10>论坛</font></div>
	<img alt="logo" src="/novelOnLine/images/logo.JPG">
</div>
<br/><br/><br/>
--%><div align="center" style="border-style: none;border-color:#A0FFFF;border-width: 2px;width: 100%;height: 600px;margin-top:10px ">
<table id="table">
<tr>
<td style="height:40px;width: 150px;text-align: center;">书名</td>
<td style="height:40px;width: 280px;text-align: center;">评论内容</td>
<td style="height:40px;width: 80px;text-align: center;">评论者姓名</td>
<td style="height:40px;width: 80px;text-align: center;">操作</td>
</tr>
<s:iterator value="%{#request.nDiscusses}" status="i">
<tr>
<td style="height:40px;width: 80px;text-align: center;"><s:property value="n_book.b_name"/></td>
<td style="height:40px;width: 280px;text-align: center;"><s:property value="d_content"/></td>
<td style="height:40px;width: 80px;text-align: center;"><s:property value="n_user.u_name"/></td>
<td><a href="replay.action?did=<s:property value="d_id"/>"><font color=blue>跟帖</font></a></td>
</tr>
</s:iterator>
</table>
<div style="margin-top:20px;margin-left:180px;margin-right:300px">
			<div style="float: left">共 <s:property value="totle" /> 条记录,每页<s:property value="everyPageSize" /> 条,当前第 ${pageNo} /  <s:property value="totlesize" /> 页</div>
			<div style="float: right">
				<s:if test="first">上一页 </s:if> 
				<s:else>
              		<s:a href="nextComments.action?pageNo=%{pageNo-1}&bid=%{bid}">上一页</s:a>
           		</s:else> 
           	 	<s:if test="last">下一页</s:if>
           	    <s:else>
              		<s:a href="nextComments.action?pageNo=%{pageNo+1}&bid=%{bid}">下一页</s:a>
           	    </s:else>
                                        转到第 <s:textfield name="page" cssStyle="width:30px" id="jspageNo"></s:textfield> 页<input  type="submit" value="跳转"   id="jspageup">
            </div>
		</div>
</div>
</body>
</html>