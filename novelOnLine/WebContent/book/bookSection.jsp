<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>章节信息</title>
<link rel=stylesheet type=text/css href="css/homePage.css" />
</head>
 <body class="easyui-layout" bgcolor="#E0ECFF"style="background-image: url('/novelOnLine/images/bg.jpg');background-size:cover;background-attachment:fixed;">
<jsp:include page="../page/head.jsp"></jsp:include>
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
<div id="contain"
	style="width: 600px; text-align: center; margin-left:300px">

<div id="opus_mark"><img src="images/mark.jpg"
	width="100" height="80" align="left"></div>
<div id="auther_mark"><img src="images/mark.jpg"
	width="100" height="80" align="right" /></div>
<div id="detail_title" style="text-align: center;color: RED;font-size: 16px">
<table  cellpadding="10" align="center" width="100%" height="10%">
<tr>
<td>作品名</td>
<td><s:property value="infor.b_name"></s:property></td>
</tr>
<tr>
<td>作者</td>
<td><s:property value="infor.n_user.u_name"></s:property></td>
</tr>
<tr>
<td>阅读人数</td>
<td><s:property value="infor.b_scanNum"></s:property></td>
</tr>
</table>
			</div>	
</div>


<div style="width:600px;height:auto;margin-top: 100px;text-align:center;margin-left:300px">
<table  cellpadding="10" align="center" width="100%" height="10%">
<tr bgcolor="CFA0FF">
<td>章节信息</td>
</tr>
<s:iterator value="sectionNum">
<tr>
<td><a href="sectionContentBook.action?sectionName=<s:property value="c_section"/>&&id=<s:property value="n_book.b_id"/>">
	<s:property value="c_section"/></a></td>
</tr>
</s:iterator>
</table>
</div>
<jsp:include page="../page/foot.jsp"></jsp:include>
</body>
</html>
