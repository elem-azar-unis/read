<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
     <!--2012-10-17 孟书  图书评论页面   -->
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>发表评论</title>
<!--<script type="text/javascript">
function check(obj){
	 document.getElementById('sum').disabled=true;
	 obj.value=RegExp.$1; 
	 
	if(obj.value.length>10)
	{
		 document.getElementById('sum').disabled=false;
	}else{
		document.getElementById('p').innerText="请至少输入十个字";
	}
}
</script>-->
<script type="text/javascript">
	function validate(){
		var obj= document.getElementById('x');
		var reg = /^\s*(\S+)\s*$/; 
		if(reg.test(obj.value)){
			obj.value=RegExp.$1; 
			return true;
		}else{
			obj.value="";
			document.getElementById('p').innerText="请输入内容";
			return false;
		}		
	}
</script>

</head>
 <body class="easyui-layout" bgcolor="#E0ECFF"style="background-image: url('/novelOnLine/images/bg.jpg');background-size:cover;background-attachment:fixed;">
<div style="text-align: left;border-style: solid;border-color:#A0FFFF;border-width: 2px" >
	<img alt="logo" src="/novelOnLine/images/logo.JPG">
</div>
<div align="center" style="border-style: solid;border-color:#A0FFFF;border-width: 2px;width: 100%;height: 500px;margin-top:10px ">
<h3><font color="blue">发表评论</font></h3><br/><br/>
<s:form action="saveComment" method="post">
<s:hidden name="nDiscuss.d_id"></s:hidden>
<s:textarea name="nDiscuss.d_content" cols="60" rows="15" id="x" /><br/>
<p id="p"></p>
<s:hidden name="nDiscuss.n_book.b_id" value="%{bid}"></s:hidden>
<s:hidden name="nDiscuss.n_user.u_id" value=""></s:hidden>
<s:submit value="提交" align="center"   onclick="return  validate()" ></s:submit>
</s:form>
</div>
</body>
</html>