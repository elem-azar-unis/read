<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
 <body class="easyui-layout" bgcolor="#E0ECFF"style="background-image: url('/novelOnLine/images/bg.jpg');background-size:cover;background-attachment:fixed;">
<s:form>
<table>

<!--<tr>
<td>图书ID</td>
<td>书名</td>
<td>图书照片</td>
</tr>

-->

<tr>
<td>图书ID</td>
<td>书名</td>
<td>图书照片</td>
</tr>
<s:iterator value="nbook">
<tr>
<td><s:property value="b_id"/></td>
<td><s:property value="b_name"/></td>
<td><s:property value="b_picture"/></td>
</tr>
</s:iterator>
</table>
</s:form>

</body>
</html>