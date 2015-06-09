 <%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="./js/richedit.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>更新小说</title>
<script type="text/javascript">
	function check(){
		var num=document.getElementById("id2").value.length;
		if(document.getElementById("id1").value.length>0&&document.getElementById("id2").value.length>500){
			document.getElementById("t").innerText="你已输入了"+num+"字";
			document.getElementById("sum").disabled=false;
		}else{
			
			document.getElementById("t").innerText="你已输入了"+num+"字";
			document.getElementById("sum").disabled=true;
		}
	}
	function sub(){
		document.getElementById("sectionContent").value=rto['0'].toggleSource();
	}
</script>
</head>
<body style="text-align:left;background-image: url('/novelOnLine/images/bg.jpg');background-size:cover;background-attachment:fixed;">
<jsp:include page="/page/head.jsp"></jsp:include>
<s:if test='yourBook.b_over=="未完结"'>
<div style="text-align:center">
	<p><font color="red" size="4px"><s:property value="yourBook.b_name"/>  你已经更新了${num}章，欢迎继续更新${sectionNum}</font></p>
	如果已经更新完毕，请点击<a style="font-size: 14px;color:red;" href="overUser.action?id=<s:property value="b_id"/>">设为更新完结</a><br></br>
</div>
	<div>
<s:form action="renew.action">
<input  id="sectionContent" name="sectionContent" type="hidden" ></input>
<table>
	<tr style="float:left">
		<td><input name="id" type="hidden" value=${id}></input></td>
		<td><input name="content" type="hidden" value=${sectionNum}></input></td>
	</tr>
	<tr>
		<td>章节</td><td>${sectionNum}</td>
	</tr>
	<tr>
		<td>章节名称</td><td><input type="text" id="id1" name="sectionName" onblur="check()" ></input></td>
	</tr>
	<tr>
		<td>章节内容</td><%--<td><s:textarea id="id2" name="sectionContent"  onkeydown="check()"   rows="30px" cols="100px"></s:textarea></td>
		<td id="t"></td>--%>
		<td>
			<script type="text/javascript"> 
				var editor1 = new EDITOR();
				editor1.fieldName='sectionContent';
				editor1.create("");
			</script>
		</td>
	</tr>
	<tr>
		<td><s:submit id="sum" value="更新" onclick="sub()"></s:submit></td>
	</tr>
</table>
</s:form>
</div>
</s:if>
	    		
<s:else>

	<pre style="height: 200px;font-size: 18px;color: red;text-align: center">
	
	
	
	
	
	
	你的这本书已经完结。有兴趣的话请写新书。
	
	
	
	
	</pre>

</s:else>



<jsp:include page="/page/foot.jsp"></jsp:include>
</body>
</html>