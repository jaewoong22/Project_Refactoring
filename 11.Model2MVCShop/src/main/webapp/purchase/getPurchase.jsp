<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
 <!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&family=Open+Sans:ital,wght@0,300;1,300&display=swap" rel="stylesheet">

<style>
body{
	padding-top : 50px;
	font-family: 'Nanum Myeongjo', serif;
	font-family: 'Open Sans', sans-serif;
}
</style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		//==> 추가된부분 : "수정" "확인"  Event 연결 및 처리
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
			 $( "button.btn.btn-default" ).on("click" , function() {
				 self.location = "/purchase/listPurchase"
			});
			
			 $( "#update" ).on("click" , function() {
					self.location = "/purchase/updatePurchase?tranNo=${purchase.tranNo}"
					
			});
			 
		});
		
	</script>
	
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info" style="color:#bc8f8f">상품상세조회</h3>
	    </div>
	
		<div class="row">
		<div class="col-xs-12 col-md-12" align="center">
		
		<c:choose>
		
		<c:when test="${purchase.purchaseProd.fileName.contains('&')}">
		
			<td class="ct_write01">
				<c:choose>
				<c:when test="${purchase.purchaseProd.fileName.contains('mp4')}">
					<c:forEach var="name" items="${purchase.purchaseProd.fileName.split('&')}">
						<video width="400" height="300" controls autoplay src="/images/uploadFiles/${name}" type="video/mp4"></video>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<c:forEach var="name" items="${purchase.purchaseProd.fileName.split('&')}">
						<img src="/images/uploadFiles/${name}" width="300" height="300" align="absmiddle"/>
					</c:forEach>
				</c:otherwise>
				</c:choose>		
		
			</td>
		
		</c:when>
		
		<c:otherwise>
			<img src="/images/uploadFiles/${purchase.purchaseProd.fileName}" width="300" height="300" align="absmiddle"/>
		</c:otherwise>
		</c:choose>

		</div>
		</div>

		<hr/>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>상품번호</strong></div>
			<div class="col-xs-8 col-md-8">${purchase.purchaseProd.prodNo }</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>구매수량</strong></div>
			<div class="col-xs-8 col-md-8">${purchase.buyNum }</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>구매자아이디</strong></div>
			<div class="col-xs-8 col-md-8">${purchase.buyer.userId}</div>
		</div>
		
		<hr/>
		
		
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>구매방법</strong></div>
	  		<c:if test="${purchase.paymentOption.contains('1')}">
	  			<div class="col-xs-8 col-md-8">현금구매</div>
	  		</c:if>
	  		<c:if test="${purchase.paymentOption.contains('2')}">
	  			<div class="col-xs-8 col-md-8">신용구매</div>
	  		</c:if>
		</div>
		
		<hr/>
			
		
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>구매자이름</strong></div>
			<div class="col-xs-8 col-md-8">${purchase.receiverName }</div>
		</div>
		
		<hr/>
		
		
		
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>구매자연락처</strong></div>
			<div class="col-xs-8 col-md-8">${purchase.receiverPhone }</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>구매자주소</strong></div>
			<div class="col-xs-8 col-md-8">${purchase.divyAddr }</div>
		</div>
		
		<hr/>
		
		
		
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>구매요청사항</strong></div>
			<div class="col-xs-8 col-md-8">${purchase.divyRequest }</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>배송희망일</strong></div>
			<div class="col-xs-8 col-md-8">${purchase.divyDate }</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>주문일</strong></div>
			<div class="col-xs-8 col-md-8">${purchase.orderDate }</div>
		</div>
		
		
		
		
		<div class="row">
	  		<div class="col-md-12 text-right ">
	  		
	  			<button type="button" class="btn btn-default" id="check">확인</button>
	  		<c:if test="${purchase.tranCode.equals('001') }">	
	  			<button type="button" class="btn btn-primary" id="update">수정</button>
	  		</c:if>
		</div>
		
		<br/>
		
 	</div>
 	<!--  화면구성 div Start /////////////////////////////////////-->

</body>
</html>