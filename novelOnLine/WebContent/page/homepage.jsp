<%@ page language="java" contentType="text/html; charset=UTF-8" 	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>T4读书网-首页</title>
<link rel=stylesheet type=text/css href="css/homePage.css" />
</head>
 <body class="easyui-layout" bgcolor="#E0ECFF" style="background-image: url('/novelOnLine/images/bg.jpg');background-size:cover;background-attachment:fixed;">
<jsp:include page="head.jsp"></jsp:include>

<div style="margin-left:280px;float:left;margin-top:20px;margin-bottom:20px;width:55%;overflow: hidden;">
		<b><FONT SIZE=6px>最新，最流行的小说，尽在T4读书网</FONT></b><jsp:include page="js.jsp"></jsp:include>
</div>
<!--div class="bang" style="float:right">
		<p style="color: #00697B" >编辑推荐</p>
		<ul style="list-style:none">
		<s:iterator value="tuijianBooks" >
			<li style="text-align: left"><span>[<s:property value="b_type" />]</span><s:property value="b_name" /></li>
			<p class="xian">-------------------</p>
		</s:iterator>
		</ul>
</div-->

<!--div class="block" style="height: 60px"></div>

<div style="border-style: solid;border-color:#A0FFFF;border-width: 2px;width: 100%;height: 300px; ">
	<s:iterator value="suijiBooks" >
			<div style="width:300; height: 100px;float:left;margin-bottom:50px;margin-right:10px;margin-left:10px">
				<div ><img style="width: 100px;height: 120px;float:left;"  src="<s:property value="b_picture" />"></div>
				<div style="font-weight: bold;margin-top:10px;font-size: 15px;color: RED;margin-bottom: 10px" ><s:property value="b_name" /></div>
				<div style="height: 100px;width:200px;padding-left:10px;margin-right:10px;letter-spacing: 2px"><s:property value="b_intro.substring(0,20)" /></div>
			</div>
	</s:iterator>
</div>
<div class="block" style="height: 60px;"></div>

<div style="width: 100%;">
	<div class="type1">
		<div>
			<img   src="/novelOnLine/images/001.jpg"></img>
		</div>
		<div class="type5" >
				<img class="type2" src="<s:property value="xuanhuanBooks.get(0).getB_picture()"/>"></img>
				<div class="type3"><s:property value="xuanhuanBooks.get(0).getB_name()" /></div>
				<div style="letter-spacing: 2px"><s:property value="xuanhuanBooks.get(0).getB_intro()" /></div>
				<div style="float:right;color: RED">[点击阅读]</div>
		</div>
		<table class="type4">
			<s:iterator value="xuanhuanBooks">
				<tr>
					<td style="text-align: left"><span>[<s:property value="b_type" />]</span><s:property value="b_name"/></td>
				</tr>
			</s:iterator>
		</table>
	</div>
	<div class="type1">
		<div>
			<img  src="/novelOnLine/images/002.jpg"></img>
		</div>
		<div class="type5">
				<img class="type2" src="<s:property value="dushiBooks.get(0).getB_picture()"/>"></img>
				<div class="type3"><s:property value="dushiBooks.get(0).getB_name()" /></div>
				<div style="letter-spacing: 2px"><s:property value="dushiBooks.get(0).getB_intro()" /></div>
				<div style="float:right;color: RED">[点击阅读]</div>
		</div>
		<table class="type4">
			<s:iterator value="dushiBooks">
				<tr>
					<td style="text-align: left"><span>[<s:property value="b_type" />]</span><s:property value="b_name"/></td>
				</tr>
			</s:iterator>
		</table>
	</div>
	<div class="type1">
		<div>
			<img  src="/novelOnLine/images/003.jpg"></img>
		</div>
		<div class="type5">
				<img class="type2" src="<s:property value="lishiBooks.get(0).getB_picture()"/>"></img>
				<div class="type3"><s:property value="lishiBooks.get(0).getB_name()" /></div>
				<div style="letter-spacing: 2px"><s:property value="lishiBooks.get(0).getB_intro()" /></div>
				<div style="float:right;color: RED">[点击阅读]</div>
		</div>
		<table class="type4">
			<s:iterator value="lishiBooks">
				<tr>
					<td style="text-align: left"><span>[<s:property value="b_type" />]</span><s:property value="b_name"/></td>
				</tr>
			</s:iterator>
		</table>
	</div>
	
</div-->

<div class="block" style="height: 30px;background-color:lightgray"></div>

<div class="bang" style="margin-left:120px;border:0;">
		<p style="color: #00697B" >点击排行榜</p>
		<ul style="list-style: decimal;border:0;">
		<s:iterator value="dianjiBooks" >
			<li style="text-align: left">
			<span>[<s:property value="b_type" />]</span>
			<a href="inforBook.action?id=<s:property value="b_id"/>"> <s:property value="b_name" /></a>
			<span>[<s:property value="b_scanNum" />]</span>
			</li>
			
			<p class="xian">-------------------</p>
		</s:iterator>
		</ul>
</div>
<div class="bang" style="margin-left:120px;border:0;">
		<p style="color: #00697B" >鲜花排行榜</p>
		<ul style="list-style: decimal;border:0;">
		<s:iterator value="flowerBooks" >
			<li style="text-align: left"><span>[<s:property value="b_type" />]</span>
			<a href="inforBook.action?id=<s:property value="b_id"/>"> <s:property value="b_name" /></a>
			<span>[<s:property value="b_flowerNum" />]</span>
			</li>
			<p class="xian">------------------</p>
		</s:iterator>
		</ul>
</div>

<div class="bang" style="margin-left:120px;border:0;">
		<p style="color: #00697B" >鸡蛋排行榜</p>
		<ul style="list-style: decimal;border:0;">
		<s:iterator value="eggBooks" >
			<li style="text-align: left"><span>[<s:property value="b_type" />]</span>
			<a href="inforBook.action?id=<s:property value="b_id"/>"> <s:property value="b_name" /></a>
			<span>[<s:property value="b_eggNum" />]</span>
			</li>
			<p class="xian">-------------------</p>
		</s:iterator>
		</ul>
</div>

<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>