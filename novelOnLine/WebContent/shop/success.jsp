<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>购物车信息</title>
<meta http-equiv="refresh" content="3;url=homeShop.action" />

</head>
<body>
<jsp:include page="/page/shophead.jsp" />
<center>
<s:if test='tag=="添加到购物车"'>
	<pre>





					<font size="20px" color="red">成功添加到购物车,3秒后将跳回商城首页</font>
					



	</pre>

</s:if>
<s:elseif test='tag=="付款成功"'>
	<pre>





					<font size="20px" color="red">付款成功,3秒后将跳回商城首页</font>
					



	</pre>
</s:elseif>
<s:elseif test='tag=="余额不足"'>

	<pre>





					<font size="20px" color="red">对不起,你的余额不足，请及时<a href="chargeBook">充值</a>；3秒后将跳回商城首页</font>
					



	</pre>
</s:elseif>
</center>
<div style="text-align: center;clear:left;width: 100%;padding-top: 200px"><jsp:include page="/page/shopfoot.jsp" /></div>
</body>
</html>