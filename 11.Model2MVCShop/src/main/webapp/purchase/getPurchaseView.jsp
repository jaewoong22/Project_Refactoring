<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript" src="../javascript/calendar.js">
</script>
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">

$(function() {
	
	$( "td.ct_btn01:contains('확인')" ).on("click" , function() {
		 self.location = "/product/listProduct?menu=search"
	});
	
});

</script>
</head>

<body>


<table width="600" border="0" cellspacing="0" cellpadding="0"	align="center" style="margin-top: 13px;">
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			상품번호 
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${purchase.purchaseProd.prodNo }</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">
			구매자아이디 
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${purchase.buyer.userId}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			구매개수 
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${purchase.buyNum }</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">
			구매방법 
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<c:if test="${purchase.paymentOption.equals('1') }">
				현금구매
			</c:if>
			<c:if test="${purchase.paymentOption.equals('2') }">
				신용구매
			</c:if>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			구매자이름 
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${purchase.receiverName }</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			구매자연락처
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${purchase.receiverPhone }</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			구매자주소 
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${purchase.divyAddr }</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			구매요청사항 
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${purchase.divyRequest }</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			배송희망날짜 
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${purchase.divyDate }</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top:10px;">
	<tr>
		<td width="53%"></td>
		<td align="right">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
				
					
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						확인
					</td>
					
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

</body>
</html>
