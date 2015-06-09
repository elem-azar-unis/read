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
<jsp:include page="/page/head.jsp"></jsp:include>

<div class="bang" style="float:left;height: 500px">
		<p style="color: #00697B" >已完结精品推荐</p>
		<ul style="list-style:none">
		<s:iterator value="endBooks" >
			<li style="text-align: left">
				<span>[<s:property value="b_type" />]</span>
				<a href="inforBook.action?id=<s:property value="b_id"/>"> <s:property value="b_name" /></a>
				</li>
			<p class="xian">-------------------</p>
		</s:iterator>
		</ul>
</div>

<div style="float:left;margin-top:-500px;margin-left:200px">
		<p style="text-align: center;color: RED;font-size: 16px">${infor.b_name}  </p>
				<p class="xian">---------------------------------------------------------------------------------------------------------</p>
		
			
			<div style="left"><img style="height: 250px;width: 200px;float: left;margin-left:60px" src="${infor.b_picture }"></img>
				
			<div style="float:left;clear:left;margin-left:60px" ><a href="sectionBook.action?id=${infor.b_id}"><img style="width: 160px; margin-top: 10px" src="/novelOnLine/images//2.jpg"></img></a>
			<ul style="list-style: none; margin-left: -10px">
				
				<li class="li">
				
				<a href="eggBook.action?id=${infor.b_id}" style="line-height: 30px">砸鸡蛋</a></li>
				<li class="li">
				<a href="flowerBook.action?id=${infor.b_id}" style="line-height: 30px">送鲜花</a></li>
				<li class="li">
				<a href="bookComt.action?bid=${infor.b_id }" style="line-height: 30px">查看评论</a></li>
			</ul>
			</div></div>
			
			<div style="color: RED; font-size:16px">作品信息</div>
			<div style="margin-left: 80px;margin-top:20px">
			<p class="xian">----------------------------------------------------------------</p>
			<div style="margin-left:200px">
				<table cellpadding="2%" style="margin-left:100px">
				
			<s:iterator value="infor" id="infor">
			<tr>
				<td><span class="td1">作者:</span></td>
				<td><s:property value="#infor.n_user.u_name"></s:property></td>
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
				<td><s:property value="b_salePrice"></s:property>
					<s:if test='infor.b_salePrice!=0'><a style="color:red" href="inforShop.action?id=${infor.b_id }">去商城购买</a></s:if>
				
				</td>
			</tr>
			
		</s:iterator>
		</table>
		
				<div ><div class="td1" style="margin-right:420px">内容简介：</div><p style="width:60%;" >${infor.b_intro }</p></div>
				<a href="publishComment.action?bid=${infor.b_id}" ><img src="/novelOnLine/images/3.jpg"></img></a>
			</div>
		</div>
</div>
<jsp:include page="../page/foot.jsp"></jsp:include>
</body>
</html>
