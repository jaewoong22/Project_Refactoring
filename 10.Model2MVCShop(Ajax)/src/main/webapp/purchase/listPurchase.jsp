<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta charset="EUC-KR">
<title>���� �����ȸ</title>

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
				console.log('�󼼺���');
				var message = $(this).attr("value");
				console.log(message);
					self.location ="/purchase/getPurchase?tranNo="+message;
			});
			//*/
			$( "td.divy" ).on("click" , function() {
				console.log('���ǵ���');
				var message1 = $(this).attr("value1");
				console.log(message1);
				var message2 = $(this).attr("value2");
				console.log(message2);
				
				self.location ="/purchase/updateTranCode?tranNo="+message1+"&tranCode="+message2;
			});
			
			$( "td.cancel" ).on("click" , function() {
				console.log('�������');
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
		                                          +"��ǰ��ȣ	: "+JSONData.purchaseProd.prodNo+"<br/><br/>&emsp;"
		                                          +"�����ھ��̵�	: "+JSONData.buyer.userId+"<br/><br/>&emsp;"
		                                          +"���Ź��	: "+JSONData.paymentOption+"<br/><br/>&emsp;"
		                                          +"�������̸� 	: "+JSONData.receiverName+"<br/><br/>&emsp;"
		                                          +"�����ڿ���ó	: "+JSONData.receiverPhone+"<br/><br/>&emsp;"
		                                          +"�������ּ�	: "+JSONData.divyAddr+"<br/><br/>&emsp;"
		                                          +"���ſ�û����	: "+JSONData.divyRequest+"<br/><br/>&emsp;"
		                                          +"��������	: "+JSONData.divyDate+"<br/><br/>&emsp;"
		                                          +"�ֹ���	: "+JSONData.orderDate
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
					<td width="93%" class="ct_ttl01">���� �����ȸ</td>
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
			��ü  ${resultPage.totalCount } �Ǽ�,	���� ${resultPage.currentPage} ������
		</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">���ų���</td>		
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����Ȳ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��������</td>
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
			<td align="center" class="view" value="${purchase.tranNo }">�󼼺���</td>		
			<td></td>
			
			<c:choose>
				<c:when test="${purchase.tranCode.equals('000')}">
					<td align="center">���� ��ҵ� ��ǰ�Դϴ�.</td>
				</c:when>
				<c:when test="${purchase.tranCode.equals('001')}">
					<td align="center">���� ���ſϷ� �����Դϴ�.</td>
				</c:when>
				<c:when test="${purchase.tranCode.equals('002')}">
					<td align="center">���� ����� �����Դϴ�.</td>
				</c:when>
				<c:otherwise>
					<td align="center">���� ��ۿϷ� �����Դϴ�.</td>
				</c:otherwise>
			</c:choose>
			<td></td>
			
			<c:if test="${purchase.tranCode.equals('002')}">
				<td align="center" class="divy" value1="${purchase.tranNo }" value2="${purchase.tranCode}">���ǵ���</td>
			</c:if>
			<c:if test="${purchase.tranCode.equals('001')}">
				<td align="center" class="cancel"  value1="${purchase.tranNo }" value2="${purchase.tranCode}">�������</a>
			</c:if>
			<c:if test="${purchase.tranCode.equals('000')}">
				<td align="center">������ҿϷ�</td>
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