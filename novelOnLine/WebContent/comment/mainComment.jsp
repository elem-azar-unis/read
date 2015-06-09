<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel=stylesheet type=text/css href="../css/homePage.css" />
<style>
tr{
	text-align:center;
	align=center;
}
th{
	text-align:center;
	align=center;
}
td {
	text-align:center;
	align=center;
}
</style>
<!--style>
tr {
	text-align:left;
	width: 250px;
	border-bottom-width: 1px;
	border-bottom-style: dotted;
	border-bottom-color: #D2D2D2;
}
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
</style-->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>评论首页</title>
</head>
 <body class="easyui-layout" bgcolor="#E0ECFF"style="background-image: url('/novelOnLine/images/bg.jpg');background-size:cover;background-attachment:fixed;">
 <!--
<div style="text-align: left;border-style: solid;border-color:#A0FFFF;border-width: 2px" >
	<s:if test='#session.name!=null'>
		<a href="getIntoUser.action?name=${sessionScope.name }" class="a1" style="color: red">${sessionScope.name }</a>
		你好，欢迎访问潇湘书院&nbsp;&nbsp;&nbsp;[<a style="color:blue" href="logoutUser.action">退出</a>]
	</s:if>
	<s:else>
			欢迎访问潇湘书院,请
			<a href="extranceUser.action" class="a1" style="color: red">登录</a>
			或<a href="/novelOnLine/reg.jsp" class="a1">注册</a>
	</s:else>
		<img alt="logo" src="/novelOnLine/images/logo.JPG">
	<div style="text-align: center;color:blue；font-size: 20px;"><font color=blue size=10>论坛</font></div>

</div>
<div class="block">
	<div class="menuDiv"><a href="homePage.action"><br/>首页</a></div>
	<div class="menuDiv"><a href="seaBook.action"><br/>搜书</a></div>
	<div class="menuDiv"><a href="mainComment.action"><br/>论坛</a></div>
	<div class="menuDiv"><a href="homeShop.action"><br/>商城</a></div>
	<div class="menuDiv"><a href="VIPBook.action"><br/>VIP</a></div>
	<div class="menuDiv"><a href="tinyBook.action"><br/>微小说</a></div>
	<div class="menuDiv"><a href="getIntoUser.action"><br/>充值</a></div>
</div>
-->
<jsp:include page="/page/head.jsp"></jsp:include>
<!--div class="bang">
		<p style="color: #00697B" >点击量排行榜</p>
		<ul style="list-style: decimal">
		<s:iterator value="dianjiBooks" >
			<li style="text-align: left"><span>[<s:property value="b_type" />]</span>
				<a href="bookComt.action?bid=<s:property value="b_id"/>"><s:property value="b_name" /></a></li>
		</s:iterator>
		</ul>
</div-->
<div class="bg">
		<fieldset style="width: 95%;margin-left:5px">
			<legend>同人</legend>
		<table>
			<tr>
			   <th>图片</th>
				<th>书名</th>
				<th>作者</th>
				<th>类型</th>
				<th>简介</th>
				<th>篇幅</th>
				<th>鲜花</th>
				<th>鸡蛋</th>
				<th>浏览量</th>
			</tr>
			<s:iterator value="nBooks1" id="d1" >
			<tr >
				<td><a href="publishComment.action?bid=<s:property value="b_id"/>"><img style="width: 40px;height: 30px;float:left;"  src="<s:property value="b_picture" />"></a></td>
				<td width="100px" align="center"><s:property value="b_name" /></td>
				<td width="70px" align="center"><s:property value="n_user.u_name" /></td>
				<td width="40px" align="center"><s:property value="b_type" /></td>	
				<td width="150px" align="center"><s:property value="b_intro.substring(0,22)" />......</td>	
				<td width="40px" align="center"><s:property value="b_long" /></td>
				<td width="60px" align="center"><s:property value="b_flowerNum" /></td>
				<td width="60px" align="center"><s:property value="b_eggNum" /></td>		
				<td width="60px" align="center"><a href="bookComt.action?bid=<s:property value="b_id"/>"><font color=blue><s:property value="b_scanNum" />条</font></a></td>	
			</tr>
		</s:iterator>	
		</table>	
		<br></br>
		<div style="margin-left:400px;font-size: 15px;"><a href="moreBook.action?type=同人" ><font color=blue>更多>></font></a></div>
		</fieldset>	
		<fieldset style="width: 95%;margin-left:5px">
			<legend>漫画</legend>
		<table>
			<tr>
			   <th>图片</th>
				<th>书名</th>
				<th>作者</th>
				<th>类型</th>
				<th>简介</th>
				<th>篇幅</th>
				<th>鲜花</th>
				<th>鸡蛋</th>
				<th>浏览量</th>
			</tr>
			<s:iterator value="nBooks2" id="d2" >
			<tr >
				<td><a href="publishComment.action?bid=<s:property value="b_id"/>"><img style="width: 40px;height: 30px;float:left;"  src="<s:property value="b_picture" />"></a></td>
				<td width="100px" align="center"><s:property value="b_name" /></td>
				<td width="70px" align="center"><s:property value="n_user.u_name" /></td>
				<td width="40px" align="center"><s:property value="b_type" /></td>	
				<td width="150px" align="center"><s:property value="b_intro.substring(0,22)" />......</td>	
				<td width="40px" align="center"><s:property value="b_long" /></td>
				<td width="60px" align="center"><s:property value="b_flowerNum" /></td>
				<td width="60px" align="center"><s:property value="b_eggNum" /></td>		
				<td width="60px" align="center"><a href="bookComt.action?bid=<s:property value="b_id"/>"><font color=blue><s:property value="b_scanNum" />条</font></a></td>	
			</tr>
		</s:iterator>	
		</table>	
		<br></br>
		<div style="margin-left:400px;font-size: 15px;"><a href="moreBook.action?type=漫画" ><font color=blue>更多>></font></a></div>
		</fieldset>	
		<fieldset style="width: 95%;margin-left:5px">
			<legend>玄幻</legend>
			<table >
			<tr >
			    <th>图片</th>
				<th>书名</th>
				<th>作者</th>
				<th>类型</th>
				<th>简介</th>
				<th>篇幅</th>
				<th>鲜花</th>
				<th>鸡蛋</th>
				<th>浏览量</th>
			</tr>
			<s:iterator value="nBooks3" id="d3" >
			<tr>
				<td><a href="publishComment.action?bid=<s:property value="b_id"/>"><img style="width: 40px;height: 30px;float:left;"  src="<s:property value="b_picture" />"></a></td>
				<td width="100px" align="center"><s:property value="b_name" /></td>
				<td width="70px" align="center"><s:property value="n_user.u_name" /></td>
				<td width="40px" align="center"><s:property value="b_type" /></td>	
				<td width="150px" align="center"><s:property value="b_intro.substring(0,22)" />......</td>	
				<td width="40px" align="center"><s:property value="b_long" /></td>
				<td width="60px" align="center"><s:property value="b_flowerNum" /></td>
				<td width="60px" align="center"><s:property value="b_eggNum" /></td>		
				<td width="60px" align="center"><a href="bookComt.action?bid=<s:property value="b_id"/>"><font color=blue><s:property value="b_scanNum" />条</font></a></td>	
			</tr>
		</s:iterator>	
		</table>
		<br></br>
		<div style="margin-left:400px;font-size: 15px;"><a href="moreBook.action?type=玄幻" ><font color=blue>更多>></font></a></div>
		</fieldset>
		<fieldset style="width: 95%;margin-left:5px">
			<legend>科幻</legend>
		<table>
			<tr>
			   <th>图片</th>
				<th>书名</th>
				<th>作者</th>
				<th>类型</th>
				<th>简介</th>
				<th>篇幅</th>
				<th>鲜花</th>
				<th>鸡蛋</th>
				<th>浏览量</th>
			</tr>
			<s:iterator value="nBooks4" id="d4" >
			<tr >
				<td><a href="publishComment.action?bid=<s:property value="b_id"/>"><img style="width: 40px;height: 30px;float:left;"  src="<s:property value="b_picture" />"></a></td>
				<td width="100px" align="center"><s:property value="b_name" /></td>
				<td width="70px" align="center"><s:property value="n_user.u_name" /></td>
				<td width="40px" align="center"><s:property value="b_type" /></td>	
				<td width="150px" align="center"><s:property value="b_intro.substring(0,22)" />......</td>	
				<td width="40px" align="center"><s:property value="b_long" /></td>
				<td width="60px" align="center"><s:property value="b_flowerNum" /></td>
				<td width="60px" align="center"><s:property value="b_eggNum" /></td>		
				<td width="60px" align="center"><a href="bookComt.action?bid=<s:property value="b_id"/>"><font color=blue><s:property value="b_scanNum" />条</font></a></td>	
			</tr>
		</s:iterator>	
		</table>	
		<br></br>
		<div style="margin-left:400px;font-size: 15px;"><a href="moreBook.action?type=科幻" ><font color=blue>更多>></font></a></div>
		</fieldset>	
		<fieldset style="width: 95%;margin-left:5px">
			<legend>游戏</legend>
		<table>
			<tr>
			   <th>图片</th>
				<th>书名</th>
				<th>作者</th>
				<th>类型</th>
				<th>简介</th>
				<th>篇幅</th>
				<th>鲜花</th>
				<th>鸡蛋</th>
				<th>浏览量</th>
			</tr>
			<s:iterator value="nBooks5" id="d5" >
			<tr >
				<td><a href="publishComment.action?bid=<s:property value="b_id"/>"><img style="width: 40px;height: 30px;float:left; "  src="<s:property value="b_picture" />"></a></td>
				<td width="100px" align="center"><s:property value="b_name" /></td>
				<td width="70px" align="center"><s:property value="n_user.u_name" /></td>
				<td width="40px" align="center"><s:property value="b_type" /></td>	
				<td width="150px" align="center"><s:property value="b_intro.substring(0,22)" />......</td>	
				<td width="40px" align="center"><s:property value="b_long" /></td>
				<td width="60px" align="center"><s:property value="b_flowerNum" /></td>
				<td width="60px" align="center"><s:property value="b_eggNum" /></td>		
				<td width="60px" align="center"><a href="bookComt.action?bid=<s:property value="b_id"/>"><font color=blue><s:property value="b_scanNum" />条</font></a></td>	
			</tr>
		</s:iterator>	
		</table>	
		<br></br>
		<div style="margin-left:400px;font-size: 15px;"><a href="moreBook.action?type=游戏" ><font color=blue>更多>></font></a></div>
		</fieldset>	
		<fieldset style="width: 95%;margin-left:5px">
			<legend>竞技</legend>
		<table>
			<tr>
			   <th>图片</th>
				<th>书名</th>
				<th>作者</th>
				<th>类型</th>
				<th>简介</th>
				<th>篇幅</th>
				<th>鲜花</th>
				<th>鸡蛋</th>
				<th>浏览量</th>
			</tr>
			<s:iterator value="nBooks6" id="d6" >
			<tr >
				<td><a href="publishComment.action?bid=<s:property value="b_id"/>"><img style="width: 40px;height: 30px;float:left;"  src="<s:property value="b_picture" />"></a></td>
				<td width="100px" align="center"><s:property value="b_name" /></td>
				<td width="70px" align="center"><s:property value="n_user.u_name" /></td>
				<td width="40px" align="center"><s:property value="b_type" /></td>	
				<td width="150px" align="center"><s:property value="b_intro.substring(0,22)" />......</td>	
				<td width="40px" align="center"><s:property value="b_long" /></td>
				<td width="60px" align="center"><s:property value="b_flowerNum" /></td>
				<td width="60px" align="center"><s:property value="b_eggNum" /></td>		
				<td width="60px" align="center"><a href="bookComt.action?bid=<s:property value="b_id"/>"><font color=blue><s:property value="b_scanNum" />条</font></a></td>	
			</tr>
		</s:iterator>	
		</table>	
		<br></br>
		<div style="margin-left:400px;font-size: 15px;"><a href="moreBook.action?type=竞技" ><font color=blue>更多>></font></a></div>
		</fieldset>	
<fieldset style="width: 95%;margin-left:5px">
			<legend>历史</legend>
			<table>
			<tr>
			   <th>图片</th>
				<th>书名</th>
				<th>作者</th>
				<th>类型</th>
				<th>简介</th>
				<th>篇幅</th>
				<th>鲜花</th>
				<th>鸡蛋</th>
				<th>浏览量</th>
			</tr>
		<s:iterator value="nBooks7" id="d7" >
			<tr >
				<td><a href="publishComment.action?bid=<s:property value="b_id"/>"><img style="width: 40px;height: 30px;float:left;"  src="<s:property value="b_picture" />"></a></td>
				<td width="100px" align="center"><s:property value="b_name" /></td>
				<td width="70px" align="center"><s:property value="n_user.u_name" /></td>
				<td width="40px" align="center"><s:property value="b_type" /></td>	
				<td width="150px" align="center"><s:property value="b_intro.substring(0,22)" />......</td>	
				<td width="40px" align="center"><s:property value="b_long" /></td>
				<td width="60px" align="center"><s:property value="b_flowerNum" /></td>
				<td width="60px" align="center"><s:property value="b_eggNum" /></td>		
				<td width="60px" align="center"><a href="bookComt.action?bid=<s:property value="b_id"/>"><font color=blue><s:property value="b_scanNum" />条</font></a></td>	
			</tr>
		</s:iterator>	
		</table>
		<br></br>
		<div style="margin-left:400px;font-size: 15px;"><a href="moreBook.action?type=历史" ><font color=blue>更多>></font></a></div>
		</fieldset>
<fieldset style="width: 95%;margin-left:5px">
		<legend>都市</legend>
		<table>
			<tr>
			    <th>图片</th>
				<th>书名</th>
				<th>作者</th>
				<th>类型</th>
				<th>简介</th>
				<th>篇幅</th>
				<th>鲜花</th>
				<th>鸡蛋</th>
				<th>浏览量</th>
			</tr>
			<s:iterator value="nBooks8" id="d8" >
			<tr >
				<td><a href="publishComment.action?bid=<s:property value="b_id"/>"><img style="width: 40px;height: 30px;float:left;"  src="<s:property value="b_picture" />"></a></td>
				<td width="100px" align="center"><s:property value="b_name" /></td>
				<td width="70px" align="center"><s:property value="n_user.u_name" /></td>
				<td width="40px" align="center"><s:property value="b_type" /></td>	
				<td width="150px" align="center"><s:property value="b_intro.substring(0,22)" />......</td>	
				<td width="40px" align="center"><s:property value="b_long" /></td>
				<td width="60px" align="center"><s:property value="b_flowerNum" /></td>
				<td width="60px" align="center"><s:property value="b_eggNum" /></td>		
				<td width="60px" align="center"><a href="bookComt.action?bid=<s:property value="b_id"/>"><font color=blue><s:property value="b_scanNum" />条</font></a></td>	
			</tr>
		</s:iterator>	
		</table>
		<br></br>
		<div style="margin-left:400px;font-size: 15px;"><a href="moreBook.action?type=都市" ><font color=blue>更多>></font></a></div>
		</fieldset>	
<fieldset style="width: 95%;margin-left:5px">
			<legend>仙侠</legend>
		<table>
			<tr>
			   <th>图片</th>
				<th>书名</th>
				<th>作者</th>
				<th>类型</th>
				<th>简介</th>
				<th>篇幅</th>
				<th>鲜花</th>
				<th>鸡蛋</th>
				<th>浏览量</th>
			</tr>
			<s:iterator value="nBooks9" id="d9" >
			<tr >
				<td><a href="publishComment.action?bid=<s:property value="b_id"/>"><img style="width: 40px;height: 30px;float:left;"  src="<s:property value="b_picture" />"></a></td>
				<td width="100px" align="center"><s:property value="b_name" /></td>
				<td width="70px" align="center"><s:property value="n_user.u_name" /></td>
				<td width="40px" align="center"><s:property value="b_type" /></td>	
				<td width="150px" align="center"><s:property value="b_intro.substring(0,22)" />......</td>	
				<td width="40px" align="center"><s:property value="b_long" /></td>
				<td width="60px" align="center"><s:property value="b_flowerNum" /></td>
				<td width="60px" align="center"><s:property value="b_eggNum" /></td>		
				<td width="60px" align="center"><a href="bookComt.action?bid=<s:property value="b_id"/>"><font color=blue><s:property value="b_scanNum" />条</font></a></td>	
			</tr>
		</s:iterator>	
		</table>	
		<br></br>
		<div style="margin-left:400px;font-size: 15px;"><a href="moreBook.action?type=仙侠" ><font color=blue>更多>></font></a></div>
		</fieldset>	
		<fieldset style="width: 95%;margin-left:5px">
			<legend>武侠</legend>
		<table>
			<tr>
			   <th>图片</th>
				<th>书名</th>
				<th>作者</th>
				<th>类型</th>
				<th>简介</th>
				<th>篇幅</th>
				<th>鲜花</th>
				<th>鸡蛋</th>
				<th>浏览量</th>
			</tr>
			<s:iterator value="nBooks10" id="d10" >
			<tr >
				<td><a href="publishComment.action?bid=<s:property value="b_id"/>"><img style="width: 40px;height: 30px;float:left;"  src="<s:property value="b_picture" />"></a></td>
				<td width="100px" align="center"><s:property value="b_name" /></td>
				<td width="70px" align="center"><s:property value="n_user.u_name" /></td>
				<td width="40px" align="center"><s:property value="b_type" /></td>	
				<td width="150px" align="center"><s:property value="b_intro.substring(0,22)" />......</td>	
				<td width="40px" align="center"><s:property value="b_long" /></td>
				<td width="60px" align="center"><s:property value="b_flowerNum" /></td>
				<td width="60px" align="center"><s:property value="b_eggNum" /></td>		
				<td width="60px" align="center"><a href="bookComt.action?bid=<s:property value="b_id"/>"><font color=blue><s:property value="b_scanNum" />条</font></a></td>	
			</tr>
		</s:iterator>	
		</table>	
		<br></br>
		<div style="margin-left:400px;font-size: 15px;"><a href="moreBook.action?type=武侠" ><font color=blue>更多>></font></a></div>
		</fieldset>	
</div><br/><br/><br/>
    <div style="clear:both; margin:0px; padding:0px;"></div>
</body>
</html> 