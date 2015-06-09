<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>跟帖</title>
<style>
	.one{background-color:#FFCEA0;}
.two{background-color:#A0FFFF;}
	
</style>
<script type="text/javascript">
	function trcolor(){
			var tabnode=document.getElementById("table");
			var trs=tabnode.rows;
		
			for(var x=0;x<trs.length;x++){
				if(x%2==1)
					trs[x].className="one";
				else
					trs[x].className="two";
				}	
		}
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
window.onload=trcolor;

</script>
</head>
 <body class="easyui-layout" bgcolor="#E0ECFF"style="background-image: url('/novelOnLine/images/bg.jpg');background-size:cover;background-attachment:fixed;">
<div style="text-align: left;border-style: solid;border-color:#A0FFFF;border-width: 2px" >
	<img alt="logo" src="/novelOnLine/images/logo.JPG">
</div>
<div align="center" style="border-style: solid;border-color:#A0FFFF;border-width: 2px;width: 100%;height: 400px;margin-top:10px ">
<h3><font color="blue">跟帖</font></h3><br/>
<s:form action="saveReplay" method="post">
<s:hidden name="nRepalay.r_id"  /> 
<s:hidden name="nRepalay.n_discuss.d_id" value="%{did}"></s:hidden>
<s:textarea name="nRepalay.r_content" cols="60" rows="15" id="t1" id="x"/><br/>
<p id="p"></p>
<s:hidden name="nRepalay.n_user.u_id" value=""></s:hidden>
<s:submit value="提交" id="sum"  align="center" onclick="return  validate()"></s:submit>
</s:form>
</div>
<div align="center" style="border-style: solid;border-color:#A0FFFF;border-width: 2px;width: 100%;height: 600px;margin-top:10px ">
<h3><font color="blue">关于此条评论所有的跟帖</font></h3><br/><br/>
<table id="table">
<tr>
<td width="100px">主帖人姓名</td>
<td width="400px">回复内容</td>
<td>回复的用户</td>
</tr>
<s:iterator value="nReplies">
<tr>
<td width="100px"><s:property value="n_discuss.n_user.u_name"/></td>
<td width="400px"><s:property value="r_content"/></td>
<td><s:property value="n_user.u_name"/></td>
</tr>
</s:iterator>
</table>

</div>

</body>
</html>