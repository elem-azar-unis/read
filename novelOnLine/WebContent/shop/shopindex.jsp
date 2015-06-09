<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>商城首页</title>
<link type="text/css" rel="stylesheet" href="css/shopindex.css"></link>
</head>
<body>
<div><jsp:include page="/page/shophead.jsp" /></div>
<div style="clear:left">

</div>
<div class="bang">
<p style="color: #00697B">人气畅销书</p>
<ul style="list-style: none">
	<s:iterator value="renqiBooks">
		<li style="text-align: left"><span>[<s:property
			value="b_type" />]</span><s:property value="b_name" /><a
			style="color: red;float:right;margin-right:15px" href="inforShop.action?id=<s:property value="b_id"/>">购买</a></li>
	
	          
	
	
	</s:iterator>
</ul>
</div>

<div
	style="margin-left: 100px; float: left; margin-top: 20px; width: 55%; overflow: hidden;">
最新，最流行的小说，尽在潇湘书院。<br></br>
邀你共同关注：<jsp:include page="/page/js.jsp"></jsp:include></div>


<div style="float: left; width: 20%; height:auto; border-style: solid; border-color:#D2D2D2; border-width: 2px; clear: left;margin-top: 10px"><h2>帮助</h2></div>
<div
	style="float: left; width: 20%; height:auto; border-style: solid; border-color:#D2D2D2; border-width: 2px; clear: left">

<ul style="list-style:decimal;margin-bottom: 10px">
	
		<li style="margin-right: 20px;letter-spacing:1px;line-height: 20px">Q.在起点商城购书，是否有什么优惠或者活动？
A. 在起点商城购买起点相应作品的实体书，是可以获得等值于购买金额的作品粉丝值和钻石的。另外，商城不定期地会有一些优惠活动，具体活动敬请关注商城的相关公告。</li>
      <li style="margin-right: 20px;letter-spacing:1px;line-height: 20px">Q.确认付款后多长时间能收到图书？
A. 付款后出版社会直接发货，订单状态变为“已发货”后，一周内能收到图书，偏远地区时间可能稍长，可以在订单中查看快递单号。</li>
      <li style="margin-right: 20px;letter-spacing:1px;line-height: 20px">Q.签收图书需注意哪些？
A. 签收图书需当快递员面拆封验货，如有问题请勿签收，在订单中留言说明情况后会得到处理，签收后恕不接受调换的请求。</li>
      <li style="margin-right: 20px;letter-spacing:1px;line-height: 20px">Q.遇到图书质量问题或发送的图书与订单不符时怎么办？
A. 若图书有质量问题或与订单不符请在订单中客服留言，会有专人联系解决事宜。</li>
      <li style="margin-right: 20px;letter-spacing:1px;line-height: 20px">Q.购买起点相应作品实体书何时收到钻石和粉丝值？在哪里查看？</li>
</ul>


</div>
<div><img  width="790" style="margin-left: 5px;margin-top:60px" 
	src="/novelOnLine/shop/image/04.bmp"></img></div>
<div
	style="border-style: solid; border-color: #D2D2D2; border-width: 2px; width:73%; height:auto; margin-top: 0px; float: left; margin-left: 35px">
<table>
	<tr>
		<s:iterator value="suijiBooks">

			<td><img style="width: 90px; height: 120px; margin-left: 7px"
				src="<s:property value="b_picture" />">
			<p style=""><s:property value="b_name" /></p>
			<p style="color: red">起点价格：<s:property value="b_salePrice" /></p>
			<a href="inforShop.action?id=<s:property value="b_id"/>"/><img src="/novelOnLine/shop/image/07.bmp"></a>
			</td>


		</s:iterator>
	</tr>
</table>
</div>
<div><img  width="790"
	style="margin-left: 10px; margin-top: 10px"
	src="/novelOnLine/shop/image/04.jpg"></img></div>
<div
	style="border-style: solid; border-color: #D2D2D2; border-width: 2px; width:73%; height: auto; margin-top: 0px; float: left; margin-left: 35px">
<table>
	<tr>
		<s:iterator value="xuanhuanBooks">

			<td><img style="width: 90px; height: 120px; margin-left: 7px"
				src="<s:property value="b_picture" />">
			<p style=""><s:property value="b_name" /></p>
			<p style="color: red">起点价格：<s:property value="b_salePrice" /></p>
			<a href="inforShop.action?id=<s:property value="b_id"/>"/><img src="/novelOnLine/shop/image/07.bmp"></a>
			</td>
		</s:iterator>
	</tr>
</table>
</div>

<div><img  width="790" height="40"
	style="margin-left: 10px; margin-top: 10px"
	src="/novelOnLine/shop/image/05.jpg"></img>
</div>
	
<div
	style="border-style: solid; border-color: #D2D2D2; border-width: 2px; width:73%; height:auto; margin-top: 0px; float: left; margin-left: 35px">
<table>
	<tr>
		<s:iterator value="xianxiaBooks">

			<td><img style="width: 90px; height: 120px; margin-left: 7px"
				src="<s:property value="b_picture" />">
			<p style=""><s:property value="b_name" /></p>
			<p style="color: red">起点价格：<s:property value="b_salePrice" /></p>
			<a href="inforShop.action?id=<s:property value="b_id"/>"/><img src="/novelOnLine/shop/image/07.bmp"></a>
			</td>
		</s:iterator>
	</tr>
</table>
</div>

<div style="text-align: center;clear:left;width: 100%"><jsp:include page="/page/shopfoot.jsp" /></div>
</body>


</html>