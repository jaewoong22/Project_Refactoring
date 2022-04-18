<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>판매 목록조회</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
	// 검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScrpt 이용  
	function fncGetList(currentPage) {
		document.getElementById("currentPage").value = currentPage;
	   	document.detailForm.submit();		
	}
</script>

</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

<form name="detailForm" action="/purchase/listSale" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">판매 목록조회</td>
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
				 	<option value="0"  ${ ! empty search.orderCondition && search.orderCondition==0 ? "selected" : "" }>--정렬하기--</option>
					<option value="5"  ${ ! empty search.orderCondition && search.orderCondition==5 ? "selected" : "" }>배송하기</option>
					<option value="6"  ${ ! empty search.orderCondition && search.orderCondition==6 ? "selected" : "" }>배송중</option>
					<option value="7"  ${ ! empty search.orderCondition && search.orderCondition==7 ? "selected" : "" }>배송완료</option>
				</select>
				
			
		</td>
		<td align="left" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<a href="javascript:fncGetList('1');">조회</a>
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
			전체  ${resultPage.totalCount } 건수,	현재 ${resultPage.currentPage} 페이지
		</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">주문번호</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">상품번호</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">배송현황</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">현재상태</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">구매한 회원ID</td>
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
			<td align="center"><a href="/product/getProduct?prodNo=${purchase.purchaseProd.prodNo }&menu=${param.menu}">${purchase.purchaseProd.prodNo }</a></td>
			<td></td>
			
			<c:choose>
				<c:when test="${purchase.tranCode.equals('000')}">
					<td align="center">현재 <b>구매취소</b> 상태입니다.</td>
				</c:when>
				<c:when test="${purchase.tranCode.equals('001')}">
					<td align="center">현재 <b>구매완료</b> 상태입니다.</td>
				</c:when>
				<c:when test="${purchase.tranCode.equals('002')}">
					<td align="center">현재 <b>배송중</b> 상태입니다.</td>
				</c:when>
				<c:otherwise>
					<td align="center">현재 <b>배송완료</b> 상태입니다.</td>
				</c:otherwise>
			</c:choose>
			
			<td></td>
					<c:if test="${purchase.tranCode.equals('000') }">
						<td align="center"> 구매취소 </td>
					</c:if>
					<c:if test="${purchase.tranCode.equals('001') }">
						<td align="center"> 구매완료 <a href="/purchase/updateTranCode?tranNo=${purchase.tranNo }&tranCode=${purchase.tranCode}"> 배송하기</a></td>
					</c:if>
					<c:if test="${purchase.tranCode.equals('002') }">
						<td align="center"> 배송중</td>
					</c:if>
					<c:if test="${purchase.tranCode.equals('003') }">
						<td align="center"> 배송완료</td>
					</c:if>
				
			
			<td></td>
			<td align="center">
				<a href="/user/getUser?userId=${purchase.buyer.userId}">${purchase.buyer.userId}</a>
			
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