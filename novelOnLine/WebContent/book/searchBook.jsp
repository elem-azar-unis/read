<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>作品信息</title>
<link rel=stylesheet type=text/css href="css/homePage.css" />
</head>
 <body class="easyui-layout" bgcolor="#E0ECFF"style="background-image: url('/novelOnLine/images/bg.jpg');background-size:cover;background-attachment:fixed;">
<jsp:include page="../page/head.jsp"></jsp:include>
<br>
<form action="searchBook.action">
	
	<s:textfield label="关键字" name="bookName"  cssStyle="width:120px;height:14px;"></s:textfield>
	<s:select  list="{'书名','作者名'}" name="bookTag"></s:select>
	<!-- <s:submit   value="搜索"  cssStyle="width:40px;"></s:submit> -->
	<input type="submit" value="搜索" style="width:40px;"></input>
</form>

<s:if test='num!=0'>
<div style="border-bottom-width: 3px;border-bottom-style: dotted;border-bottom-color: #D2D2D2;margin-top:30px;" >
	<p style="">根据你得搜索条件，得到的信息如下：</p>
</div>	

	<s:iterator value="searchBook">
	<fieldset style="margin-top:30px;margin-left:150px;margin-right:150px;border-color: #D2D2D2;" >
		<p >
		<a style="font-size: 20px;color: RED" href="inforBook.action?id=<s:property value="b_id" />"><s:property value="b_name"/></a>
		&nbsp;&nbsp;文/<a href="searchBook.action?bookName=<s:property value="n_user.u_name"/>&bookTag=作者名"><s:property value="n_user.u_name"/></a>
		&nbsp;&nbsp;类型/<a href="moreBook.action?type=<s:property value="b_type"/>&flag=1"><s:property value="b_type"/></a>
		</p>
	
		<div style="float:left">
			<img style="height: 250px;width: 200px;float: left;margin-left:40px" src="${searchBook[0].b_picture }"></img>
			<div style="float:left;clear:left;margin-left:40px" ><a href="sectionBook.action?id=<s:property value="b_id" />"><img style="width: 160px; margin-top: 10px" src="/novelOnLine/images/2.jpg"></img></a>
			<ul style="list-style: none; margin-left: -10px">
				<li class="li">
				<a href="eggBook.action?id=<s:property value="b_id" />" style="line-height: 30px">砸鸡蛋</a></li>
				<li class="li">
				<a href="flowerBook.action?id=<s:property value="b_id" />" style="line-height: 30px">送鲜花</a></li>
				<li class="li">
				<a href="bookComt.action?bid=<s:property value="b_id" />" style="line-height: 30px">查看评论</a></li>
			</ul>
			</div>
		</div>
			


<div style="color: RED; font-size:20px;margin-left:30px">作品信息</div>
			<div style="margin-left: 80px;margin-top:20px">
			<p class="xian">----------------------------------------------------------------</p>
			<div style="margin-left:200px;font-size:14px;">
				<table cellpadding="2%" style="margin-left:140px">
				
			<tr>
				<td><span class="td1">作者:</span></td>
				<td><s:property value="n_user.u_name"></s:property></td>
			</tr>
			<tr>
				<td><span class="td1">作品类型:</span></td>
				<td><s:property value="b_type"></s:property></td>
			</tr>
			<tr>
				<td><span class="td1">开始写时间:</span></td>
				<td><s:property value="b_startTime"></s:property></td>
			</tr>
			<tr>
				<td><span class="td1">最近更新时间:</span></td>
				<td><s:property value="b_lastTime"></s:property></td>
			</tr>
			<tr>
				<td><span class="td1">获得鲜花数:</span></td>
				<td><s:property value="b_flowerNum"></s:property></td>
			</tr>
			<tr>
				<td><span class="td1">获得鸡蛋数:</span></td>
				<td><s:property value="b_eggNum"></s:property></td>
			</tr>
			<tr>
				<td><span class="td1">书的浏览量:</span></td>
				<td><s:property value="b_scanNum"></s:property></td>
			</tr>
			<tr>
				<td><span class="td1">是否免费浏览:</span></td>
				<td><s:property value="b_freeScan"></s:property></td>
			</tr>
			<tr>
				<td><span class="td1">书的销售价格:</span></td>
				<td><s:property value="b_salePrice"></s:property></td>
			</tr>
			
		
		</table>
		
				<div ><div class="td1" style="margin-right:420px">内容简介：</div><p style="width:60%;" ><s:property value="b_intro"></s:property></p></div>
				<a href="publishComment.action?bid=<s:property value="b_id" />" ><img src="/novelOnLine/images/3.jpg"></img></a>
			</div>
			
		</div>
		</fieldset>
		</s:iterator>
	</s:if>
	<s:else>
	<div style="margin-top:130px;margin-left:250px;font-size: 21px;color:red" >
	对不起，根据你得搜索信息，查找不到相关的信息.<br></br>请检查你得输入是否有错误！或者重新搜索</div>
	</s:else>
	<br><br>
<jsp:include page="../page/foot.jsp"></jsp:include>
</body>
</html>
