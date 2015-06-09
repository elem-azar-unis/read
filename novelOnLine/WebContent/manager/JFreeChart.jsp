<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style>
		.bigDiv{font-size: 14px;color: #FF00FF; float:left;width:20%; clear:left;height:600px; border-style: solid ;border-color: #00697B;border-width:  1px}
	
</style>
<script type="text/javascript">
function hiddenDiv(div){
	div.style.display=(div.style.display=='none'?'block':'none');
}
</script>
</head>
<body style="background-image: url('/novelOnLine/images/bg.jpg');background-size:cover;background-attachment:fixed;">
<jsp:include page="../page/head.jsp"></jsp:include>
<div class="bigDiv" >
<div style="margin-top:100px">
	<div style="background-color:#A0FFFF;height: 40px">
	<div style="margin-left:15px;line-height: 40px">
		<a  href="javascript:void(0)" onmousedown="hiddenDiv(document.getElementById('div1'))">用户管理</a>
	</div>
	</div>
	<div id="div1" style="margin-top:10px;height: 60px">
			<p ><a  href="usuallyUser.action">用户管理</a></p>
			
	</div>
	
	<div style="background-color:#A0FFFF;height: 40px;">
	<div style="margin-left:15px;line-height: 40px">
		<a href="javascript:void(0)" onmousedown="hiddenDiv(document.getElementById('div2'))">书籍管理</a>
	</div>
	</div>
	<div id="div2" style="margin-top:10px;height: 90px">
			<p><a href="ManBBook.action">小说管理</a></p>
	</div>
	
	<div style="background-color:#A0FFFF;height: 40px;">
	<div style="margin-left:15px;line-height: 40px">
		<a href="javascript:void(0)" onmousedown="hiddenDiv(document.getElementById('div3'))">统计</a>
	</div>
	<div id="div3" style="margin-top:10px">
			<p><a href="jFreeChart.action">统计</a></p>
	</div>
	</div>
</div>
</div>
<div style="float: left ;width:75%;margin-left:30px;margin-top:40px">
	<div style="float:left;width:50px;margin-left:450px;margin-top:50px;font-size: 15px">
	同人${num[0]*100/totalScan}%
	游戏${num[1]*100/totalScan}%
	玄幻${num[2]*100/totalScan}%
	科幻${num[3]*100/totalScan}%
	仙侠${num[4]*100/totalScan}%
	武侠${num[5]*100/totalScan}%
	竞技${num[6]*100/totalScan}%
	漫画${num[7]*100/totalScan}%
	历史${num[8]*100/totalScan}%
	都市${num[9]*100/totalScan}%
	</div>
	
</div>
	<jsp:include page="../page/foot.jsp"></jsp:include>
</body>
</html>