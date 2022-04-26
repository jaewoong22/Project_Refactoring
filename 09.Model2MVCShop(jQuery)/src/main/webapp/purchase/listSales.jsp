<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta charset="EUC-KR">
<title>�Ǹ� �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">


		function fncGetList(currentPage) {
			console.log(currentPage);
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/purchase/listSales").submit();
		}
		
		
		

		 $(function() {
			 
			 
			 $( "td.ct_btn01:contains('��ȸ')" ).on("click" , function() {
					console.log('��ȸ');
						fncGetList(1);
				});
				 
			 
			$( "td.prodNum" ).on("click" , function() {
				console.log('�󼼺���');
				var message1 = $(this).attr("value1");
				console.log(message1);
				var message2 = $(this).attr("value2");
				console.log(message2);
					self.location ="/product/getProduct?prodNo="+message1+"&menu="+message2;
			});
			
			$( "td.divy" ).on("click" , function() {
				console.log('���ǵ���');
				var message1 = $(this).attr("value1");
				console.log(message1);
				var message2 = $(this).attr("value2");
				console.log(message2);
				
				self.location ="/purchase/updateTranCode?tranNo="+message1+"&tranCode="+message2;
			});
			
			$( "td.user" ).on("click" , function() {
				console.log('��������');
				var message = $(this).attr("value");
				console.log(message);
				
				self.location ="/user/getUser?userId="+message;
			});
			
			$( "td.prodNum" ).css("color" , "red");
			$( "td.divy" ).css("color" , "red");
			$( "td.user" ).css("color" , "red");
			
			
		});	
	</script>		

</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

<form name="detailForm">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">�Ǹ� �����ȸ</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37">
		</td>
	</tr>
</table>

<table width="180px" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="left">
		
				<select name="orderCondition" class="ct_input_g" style="width:100px">
				 	<option value="0"  ${ ! empty search.orderCondition && search.orderCondition==0 ? "selected" : "" }>--�����ϱ�--</option>
					<option value="5"  ${ ! empty search.orderCondition && search.orderCondition==5 ? "selected" : "" }>����ϱ�</option>
					<option value="6"  ${ ! empty search.orderCondition && search.orderCondition==6 ? "selected" : "" }>�����</option>
					<option value="7"  ${ ! empty search.orderCondition && search.orderCondition==7 ? "selected" : "" }>��ۿϷ�</option>
				</select>
				
			
		</td>
		<td align="left" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						��ȸ
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
				</tr>
			</table>
		</td>
		
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="11" >
			��ü  ${resultPage.totalCount } �Ǽ�,	���� ${resultPage.currentPage} ������
		</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">�ֹ���ȣ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">��ǰ��ȣ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����Ȳ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�������</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">������ ȸ��ID</td>
		
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>

	<c:set var="i" value="0" />
	<c:forEach var="purchase" items="${list}">
		<c:set var="i" value="${ i+1 }" />
		<tr class="ct_list_pop">
			<td align="center">${ i }</td>
			<td></td>
			<td align="center">${purchase.tranNo}</td>
			<td></td>
			<td align="center" class="prodNum" value1="${purchase.purchaseProd.prodNo }" value2="${param.menu}" >
				${purchase.purchaseProd.prodNo }
			</td>
			<td></td>
			
			<c:choose>
				<c:when test="${purchase.tranCode.equals('000')}">
					<td align="center">���� <b>�������</b> �����Դϴ�.</td>
				</c:when>
				<c:when test="${purchase.tranCode.equals('001')}">
					<td align="center">���� <b>���ſϷ�</b> �����Դϴ�.</td>
				</c:when>
				<c:when test="${purchase.tranCode.equals('002')}">
					<td align="center">���� <b>�����</b> �����Դϴ�.</td>
				</c:when>
				<c:otherwise>
					<td align="center">���� <b>��ۿϷ�</b> �����Դϴ�.</td>
				</c:otherwise>
			</c:choose>
			
			<td></td>
			<c:choose>
					<c:when test="${purchase.tranCode.equals('000') }">
						<td align="center" style="color:gray"> ������� </td>
					</c:when>
					<c:when test="${purchase.tranCode.equals('001') }">
						<td align="center" class="divy" value1="${purchase.tranNo }" value2="${purchase.tranCode}">����ϱ�</td>			
					</c:when>
					<c:when test="${purchase.tranCode.equals('002') }">
						
						<td align="center" style="color:blue"> �����</td>
					</c:when>
					<c:when test="${purchase.tranCode.equals('003') }">
						
						<td align="center"> ��ۿϷ�</td>
					</c:when>
					<c:otherwise>
						<td></td>
					</c:otherwise>
			
			</c:choose>
			<td></td>
			<td align="center" class="user" value="${purchase.buyer.userId}">${purchase.buyer.userId}</td>		
		</tr>
		<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
		</tr>
	</c:forEach>	
	
</table>

<!-- PageNavigation Start... -->
<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top:10px;">
	<tr>
		<td align="center">
		   <input type="hidden" id="currentPage" name="currentPage" value=""/>
			
			<jsp:include page="../common/pageNavigator.jsp"/>
    	</td>
	</tr>
</table>
<!-- PageNavigation End... -->

</form>
</div>

</body>
</html>