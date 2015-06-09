 <%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="./js/richedit.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户功能界面</title>
<style>
	.aa{margin-bottom: 50px;margin-top:50px;font-size: 18px;color:green; font-weight: bold;}
	.p1{text-align: left;font-size: 14px;color:green}
	.l{border-bottom-width: 2px;border-bottom-style: dotted;border-bottom-color: #D2D2D2;height: auto}
</style>
<link rel=stylesheet type=text/css href="css/homePage.css" />
<script type="text/javascript">
var i=0;
	function check(obj){
		
		if(obj.value.length>0)
		{
			i++;
			if(i>=4){
				 document.getElementById('sum').disabled=false;
		}
		}
	
	}
	function check2(){
		document.getElementById('s').disabled=true;
		if( document.getElementById('charge').value>0&& document.getElementById('charge').value<=100000){
			document.getElementById('s').disabled=false;
		}else{
			document.getElementById('p').innerText="提示：只能输入1-100000的数";
		}
	}
</script>
</head>
<body style="background-image: url('/novelOnLine/images/bg.jpg');background-size:cover;background-attachment:fixed;">
<jsp:include page="../page/head.jsp"></jsp:include>
<div style="width: 100%" >
	<div>
	<fieldset >
	    	<legend>个人信息中心:</legend>
	    	<div class="l">
	    		<p class="p1">钱包信息：</p>
				<div style=" margin-left:-400px;margin-bottom: 40px">
					你得余额为：${user.u_balance }元<br/>
				   	你一共消费:${user.u_expense }元<br/>
				</div>
			</div>
		<div class="l">
			<p class="p1">充值中心：</p>
			<div style="margin-bottom: 40px">
	    		<s:form action="addChargeUser.action">
					<s:textfield id="charge" name="chargeNum" label="充值金额（每次最多充值10万）" onblur="check2()"></s:textfield>
					<s:submit value="充值" id="s" disabled="true"></s:submit>
					<p id="p"></p>
				</s:form>
			</div>
		</div>
		
	
	<div class="l">
		
	    	<div style="margin-bottom: 40px">
	    		<p class="p1">我的藏书信息</p>
	    	</div>
	</div>
	
	</fieldset>
	</div>
	<div  style="margin-top:50px">
		<fieldset >
	    	<legend>作者专区:</legend>
	    	
	    	<s:if test='user.u_author=="看客"'>
	    		<p style="text-align: center;font-size: 18px"><a style="color:red" href="apply.action ">申请成为作者</a></p>
	    	</s:if>	
	    	<s:else>
	    		<div  class="l" style="margin-bottom: 40px">
	    		<P class="p1">你的作品信息如下：</P>
	    		<s:iterator value="books">
	    		<a><s:property value="b_name"/> </a>/ <s:property value="b_type"/>/ <s:property value="b_lastTime"/>
	    		<a href="inforBook.action?id=<s:property value="b_id"/>" style="font-size: 14px;color:red;">点击进入</a><br/><br/>
	    		<s:if test='b_over=="未完结"'>
	    			<a href="goOn.action?bid=<s:property value="b_id"/>" style="font-size: 14px;color:red;">继续更新</a>  &nbsp;&nbsp;&nbsp;&nbsp;
	    			<a style="font-size: 14px;color:red;" href="overUser.action?id=<s:property value="b_id"/>">设为已完结</a><br></br>
	    		</s:if>
	    		
	    		</s:iterator>
	    		</div>

	    		<div   class="l">
	    			<P  class="p1">写新小说：</P>
	    			<div>
	    				<form action="addBook.action">
	    					<table>
	    						<tr>
	    							
	    							<td><s:select label="小说类型" name="bookType" list="{'同人','漫画','玄幻','科幻','游戏','竞技','历史','都市','仙侠','武侠'}"></s:select></td>
	    							<td><s:textfield label="小说名称" name="bookName" onblur="check(this)" /></td>
	    							<td><s:textarea rows="4" cols="100px" label="小说简介"  onblur="check(this)" name="bookIntro"/></td>
	    							<td><s:textfield label="章节" name="bookSection" value="第1章" readonly="true"></s:textfield></td>
	    							<td><s:textfield label="章节名称" name="sectionName" onblur="check(this)"  ></s:textfield></td>
	    							<td><s:textarea rows="40" cols="100px" label="章节内容" onblur="check(this)"  name="sectionContent"/></td>
	    							<td><s:submit id="sum" value="提交" disabled="true" ></s:submit></td>
	    						</tr>
	    					
	    					</table>
	    				</form>
	    			</div>
	    		</div>
	    	
	    		</s:else>
	    	<div>
	    	
	    	</div>
	    </fieldset>
	</div>
</div>
<jsp:include page="../page/foot.jsp"></jsp:include>

</body>

</html>
