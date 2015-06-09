<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>购物车信息</title>
<style type="text/css">
  .one{background-color:#FFA0A0;}
	.two{background-color:#A0FFFF;}
	.a{
	width:100px;
	height: 10px;
	}
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
window.onload=trcolor;
</script>
</head>
<body>
<jsp:include page="/page/shophead.jsp" />
<s:if test='goodsNum==0'>
<pre style="font-size: 22px;color:red">



你的购物车还是空的偶，赶快装满它吧</pre>
<div><a style="font-size: 25px;color:green" href="homeShop.action">点击这里回商城首页购书去</a></div>
</s:if>
<s:else>
<div  style="margin-top:35px;border-width:  1px;text-align: center;" >
<table align="center" border="0" id="table" cellspacing="2" cellpadding="10px">
<caption style="font-size: 16px">你的购物车信息如下表所示：</caption>
<tr>
<td>订单编号</td>
<td>用户ID</td>
<td>书籍ID</td>
<td>购买件数</td>
<td>物品单价</td>
<td>操作</td>

</tr>
<s:iterator value="shopcars">
<tr>
<td class="a"><s:property value="s_orderid"></s:property></td>
<td class="a"><s:property value="n_user.u_name"></s:property></td>
<td class="a"><s:property value="n_book.b_name"></s:property></td>
<td class="a"><s:property value="s_num"></s:property></td>
<td class="a"><s:property value="n_book.b_salePrice"></s:property></td>
<td class="a"><a href="deleteShop.action?sid=<s:property value="s_orderid"/>" style="color: red">从购物车中删除</a></td>
</tr>
</s:iterator>
</table>
<div style="margin-top:40px">总价格为：${totalPrice }元<a href="payShop.action?payNum=${totalPrice }">付款</a></div>
</div>
</s:else>
<div style="text-align: center;clear:left;width: 100%;padding-top: 200px"><jsp:include page="/page/shopfoot.jsp" /></div>
</body>
</html>