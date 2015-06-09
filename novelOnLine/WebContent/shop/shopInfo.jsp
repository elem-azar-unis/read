<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript">
	function al()
	{
		window.alert("成功加入购物车")
	}
	function check(obj){
		 document.getElementById('sum').disabled=true;
		if(obj.value>0&&obj.value<1000)
		{
			 document.getElementById('sum').disabled=false;
		}else if(obj.value.length>0){
			document.getElementById('con').innerText="只能输入1到1000的数字";
		}
	}
</script>
<style type="text/css">
span {
	color: red;
	text-transform: uppercase;
}

li {
	text-align: left;
	margin-bottom: 10px
}

body {
	font-size: 14px
}

a {
	text-decoration: none
}

td {
	text-align: left;
	padding-left: 10px;
	border-bottom-width: 1px;
	border-bottom-style: dashed;
	border-bottom-color: gray;
}
</style>

</head>
<body>
<div><jsp:include page="/page/shophead.jsp" /></div>

<div style="width: 700px; text-align: center; margin-left: 150px;padding-top: 40px">
<div id="opus_mark"><img src="/novelOnLine/images/mark.jpg"
	width="100" height="80" align="left"></div>
<div id="auther_mark"><img src="/novelOnLine/images/star.jpg"
	width="20" height="20" align="right" /></div>
<div id="detail_title">
<h3><span>${bookInfor.b_name}</span>文 / ${bookInfor.n_user.u_name }</h3>

</div>
</div>

<div id="detail_box" style="text-align:left; margin-left:150px;margin-top:30px">
<div id="detail_left" style="float:left;margin-left:-90px">
<div id="cover" style="float: left"><s:iterator value="bookInfor">
	<div><img style="width: 200px; height: 250px; float: left"
		src="<s:property value="b_picture" />" /></div>
</s:iterator>

</div>
</div>
<div id="detail_right" style="float:left;margin-left: 20px">
<ul style="padding-left: 50px">
	<li><b>作品信息</b></li>
</ul>

<table cellpadding="2%">
	<s:iterator value="bookInfor">
		<tr>
			<td>作者:</td>
			<td><s:property value="n_user.u_name"></s:property></td>
		</tr>
		<tr>
			<td>作品类型:</td>
			<td><s:property value="b_type"></s:property></td>
		</tr>
		<tr>
			<td>开始写时间:</td>
			<td><s:property value="b_startTime"></s:property></td>
		</tr>
		<tr>
			<td>最近更新时间:</td>
			<td><s:property value="b_lastTime"></s:property></td>
		</tr>
		<tr>
			<td>获得鲜花数:</td>
			<td><s:property value="b_flowerNum"></s:property></td>
		</tr>
		<tr>
			<td>获得鸡蛋数:</td>
			<td><s:property value="b_eggNum"></s:property></td>
		</tr>
		<tr>
			<td>书的浏览量:</td>
			<td><s:property value="b_scanNum"></s:property></td>
		</tr>
		<tr>
			<td>是否免费浏览:</td>
			<td><s:property value="b_freeScan"></s:property></td>
		</tr>
		<tr>
			<td>书的销售价格:</td>
			<td><s:property value="b_salePrice"></s:property></td>
		</tr>
		<tr>
			<td >内容介绍:</td>
			<td style="width:350px"><s:property value="b_intro"></s:property></td>
		</tr>
		
	</s:iterator>
</table>

</div>
</div>

<form action="carShop.action">
<s:textfield label="购买数量（1-1000）" name="num" onblur="check(this)" id="num"></s:textfield>
<input  type="hidden" name="bookID" value=${bookInfor.b_id }   ></input>
<s:submit value="购买" id="sum" disabled="true"></s:submit>
<P id="con"></P>
</form>

<div style="text-align: center;clear:left;width: 100%;padding-top: 200px"><jsp:include page="/page/shopfoot.jsp" /></div>
</body>
</html>