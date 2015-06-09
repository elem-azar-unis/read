<%@ page language="java" contentType="text/html; charset=UTF-8" 	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>小说分类</title>
    <link rel=stylesheet type=text/css href="<%=path%>/css/common.css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/table.js"></script>
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
		window.location.href="pageupMoreBook.action?page="+pageNum+"&type="+type+"&flag=1";
		});
});
</script>
    
  </head>
  
  <body class="easyui-layout" bgcolor="#E0ECFF"style="background-image: url('/novelOnLine/images/bg.jpg');background-size:cover;background-attachment:fixed;">
  <input type="hidden" value="${totlesize}" id="totlesize" />
<input type="hidden" value="${type}" id="type" />
  	<jsp:include page="../page/head.jsp"></jsp:include>
  	<!--div class="bang">
		<p style="color: #00697B" >点击量排行榜</p>
		<ul style="list-style: decimal">
		<s:iterator value="dianjiBooks" >
			<li style="text-align: left">
			<span>[<s:property value="b_type" />]</span>
			<a href="bookComt.action?bid=<s:property value="b_id"/>"><s:property value="b_name" /></a></li>
		</s:iterator>
		</ul>
</div-->
<div class="bg">
<fieldset style="width: 95%;margin-left:5px">
			<legend><s:property value="type"/></legend>
			<table>
			<tr>
			    <th>图片</th>
				<th>书名</th>
				<th>作者</th>
				<th>类型</th>
				<th width="250px">简介</th>
				<th>篇幅</th>
				<th>鲜花</th>
				<th>鸡蛋</th>
				<th>浏览量</th>
			</tr>
			<s:iterator value="nBook" id="d1" >
			<tr >
				<td><img style="width: 60px;height: 60px;float:left;"  src="<s:property value="b_picture" />"></td>
				<td width="100px" align="center"><s:property value="b_name" /></td>
				<td width="70px" align="center"><s:property value="n_user.u_name" /></td>
				<td width="40px" align="center"><s:property value="b_type" /></td>	
				<td width="250px" align="center"><s:property value="b_intro.substring(0,22)" />......</td>	
				<td width="40px" align="center"><s:property value="b_long" /></td>
				<td width="60px" align="center"><s:property value="b_flowerNum" /></td>
				<td width="60px" align="center"><s:property value="b_eggNum" /></td>		
				<td width="60px" align="center"><font color=blue><s:property value="b_scanNum" />条</font></td>	
			</tr>
		</s:iterator>	
		</table>
		<br></br>
		<div style="margin-top:20px;margin-left:20px;margin-right:40px">
			<div style="float: left">共 <s:property value="totle" /> 条记录,每页<s:property value="everyPageSize" /> 条,当前第 ${pageNo} /  <s:property value="totlesize" /> 页</div>
			<div style="float: right">
				<s:if test="first">上一页 </s:if> 
				<s:else>
              		<s:a href="nextMoreBook.action?pageNo=%{pageNo-1}&type=%{type}&flag=1">上一页</s:a>
           		</s:else> 
           	 	<s:if test="last">下一页</s:if>
           	    <s:else>
              		<s:a href="nextMoreBook.action?pageNo=%{pageNo+1}&type=%{type}&flag=1">下一页</s:a>
           	    </s:else>
                                        转到第 <s:textfield name="page" cssStyle="width:30px" id="jspageNo"></s:textfield> 页<input  type="submit" value="跳转"   id="jspageup">
            </div>
		</div>
		</fieldset>
		
		
</div>
  	<jsp:include page="../page/foot.jsp"></jsp:include>
  </body>
</html>
