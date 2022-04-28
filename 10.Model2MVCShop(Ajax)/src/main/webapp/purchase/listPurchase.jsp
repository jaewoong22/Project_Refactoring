<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta charset="EUC-KR">
<title>구매 목록조회</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">


		function fncGetList(currentPage) {
			console.log(currentPage);
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/purchase/listPurchase").submit();
		}
		
		

		 $(function() {
				 
			 /*
			$( "td.view" ).on("click" , function() {
				console.log('상세보기');
				var message = $(this).attr("value");
				console.log(message);
					self.location ="/purchase/getPurchase?tranNo="+message;
			});
			//*/
			$( "td.divy" ).on("click" , function() {
				console.log('물건도착');
				var message1 = $(this).attr("value1");
				console.log(message1);
				var message2 = $(this).attr("value2");
				console.log(message2);
				
				self.location ="/purchase/updateTranCode?tranNo="+message1+"&tranCode="+message2;
			});
			
			$( "td.cancel" ).on("click" , function() {
				console.log('구매취소');
				var message1 = $(this).attr("value1");
				console.log(message1);
				var message2 = $(this).attr("value2");
				console.log(message2);
				
				self.location ="/purchase/cancelOrder?tranNo="+message1+"&tranCode="+message2;
			});
			
			
			$( "td.view" ).css("color" , "#ffb6c1");
			$( "td.divy" ).css("color" , "#ffb6c1");
			$( "td.cancel" ).css("color" , "#ffb6c1");
			
			///*
			$( "td.view" ).on("click" , function() {
		         console.log($(this).attr("value"));
		         
		         var tranNo =$(this).attr("value");
		         $.ajax( 
		               {
		                  url : "/purchase/json/getPurchase/"+tranNo ,
		                  method : "GET" ,
		                  dataType : "json" ,
		                  headers : {
		                     "Accept" : "application/json",
		                     "Content-Type" : "application/json"
		                  },
		                  success : function(JSONData , status) {
		                	  
		                     var displayValue = "<table class='display' height='180'>"
		                     					  +"<tr>"
		                     					  +"<td>&emsp;"
		                     					  +"<img src='/images/uploadFiles/"+JSONData.purchaseProd.fileName+"' width='150' height='150' />"
		                                          +"</td>"
		                                          +"<td>"
		                                          +"<h4><br/>&emsp;"
		                                          +"물품번호	: "+JSONData.purchaseProd.prodNo+"<br/><br/>&emsp;"
		                                          +"구매자아이디	: "+JSONData.buyer.userId+"<br/><br/>&emsp;"
		                                          +"구매방법	: "+JSONData.paymentOption+"<br/><br/>&emsp;"
		                                          +"구매자이름 	: "+JSONData.receiverName+"<br/><br/>&emsp;"
		                                          +"구매자연락처	: "+JSONData.receiverPhone+"<br/><br/>&emsp;"
		                                          +"구매자주소	: "+JSONData.divyAddr+"<br/><br/>&emsp;"
		                                          +"구매요청사항	: "+JSONData.divyRequest+"<br/><br/>&emsp;"
		                                          +"배송희망일	: "+JSONData.divyDate+"<br/><br/>&emsp;"
		                                          +"주문일	: "+JSONData.orderDate
		                                          +"</h4>"
		                                          +"</td>"
		                                          +"</tr>"	                                          
		                                          +"</table>";
		                                          
		                     //Debug...                           
		                     //alert(displayValue);
		                     $("table.display").remove();
		                     $( "#"+tranNo+"" ).html(displayValue);
		                  }
		            });
	  			 });
				//*/
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
					<td width="93%" class="ct_ttl01">구매 목록조회</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37">
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
		<td class="ct_list_b">구매내역</td>		
		<td class="ct_line02"></td>
		<td class="ct_list_b">배송현황</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">정보수정</td>
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
			<td align="center" class="view" value="${purchase.tranNo }">상세보기</td>		
			<td></td>
			
			<c:choose>
				<c:when test="${purchase.tranCode.equals('000')}">
					<td align="center">구매 취소된 상품입니다.</td>
				</c:when>
				<c:when test="${purchase.tranCode.equals('001')}">
					<td align="center">현재 구매완료 상태입니다.</td>
				</c:when>
				<c:when test="${purchase.tranCode.equals('002')}">
					<td align="center">현재 배송중 상태입니다.</td>
				</c:when>
				<c:otherwise>
					<td align="center">현재 배송완료 상태입니다.</td>
				</c:otherwise>
			</c:choose>
			<td></td>
			
			<c:if test="${purchase.tranCode.equals('002')}">
				<td align="center" class="divy" value1="${purchase.tranNo }" value2="${purchase.tranCode}">물건도착</td>
			</c:if>
			<c:if test="${purchase.tranCode.equals('001')}">
				<td align="center" class="cancel"  value1="${purchase.tranNo }" value2="${purchase.tranCode}">구매취소</a>
			</c:if>
			<c:if test="${purchase.tranCode.equals('000')}">
				<td align="center">구매취소완료</td>
			</c:if>
			
		</tr>
		<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
		</tr>
		<tr>
			<td id="${purchase.tranNo}" colspan="11" bgcolor="#f5f5f5" height="1"></td>
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