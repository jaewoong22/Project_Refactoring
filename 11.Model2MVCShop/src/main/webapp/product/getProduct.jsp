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
body>div.container{
	padding-top : 50px;
	font-family: 'Nanum Myeongjo', serif;
}
div.row{
	font-family: 'Nanum Myeongjo', serif;
}
div.page-header{
	font-family: 'Nanum Myeongjo', serif;
}
</style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	$(function() {	
		
		 $( "button.btn-default" ).on("click" , function() {
			 history.go(-1);
		});
		 
		 $( "button.btn-primary" ).on("click" , function() {
			 self.location = "/purchase/addPurchase?prodNo=${product.prodNo}&menu=${param.menu}"
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
			<c:if test="${empty param.menu }">
	       <h3 class=" text-info"  style="color:#bc8f8f">상품상세조회</h3>
	       </c:if>
	       <c:if test="${!empty param.menu }">
	       	<h3 class=" text-info" style="color:#bc8f8f">상품구매하기</h3>
	       </c:if>
	    </div>
	
		<div class="row">
		<div class="col-xs-12 col-md-12" align="center">
		
		<c:choose>
		
		<c:when test="${product.fileName.contains('&')}">
		
			<td class="ct_write01">
				<c:choose>
				<c:when test="${product.fileName.contains('mp4')}">
					<c:forEach var="name" items="${product.fileName.split('&')}">
						<video width="400" height="300" controls autoplay src="/images/uploadFiles/${name}" type="video/mp4"></video>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<c:forEach var="name" items="${product.fileName.split('&')}">
						<img src="/images/uploadFiles/${name}" width="300" height="300" align="absmiddle"/>
					</c:forEach>
				</c:otherwise>
				</c:choose>		
		
			</td>
		
		</c:when>
		
		<c:otherwise>
			<img src="/images/uploadFiles/${product.fileName}" width="300" height="300" align="absmiddle"/>
		</c:otherwise>
		</c:choose>

		</div>
		</div>

		<hr/>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>상품번호</strong></div>
			<div class="col-xs-8 col-md-8">${product.prodNo}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>상품명</strong></div>
			<div class="col-xs-8 col-md-8">${product.prodName}</div>
		</div>
		
		<hr/>
		
		
		<c:if test="${ user.role.equals('admin')}">
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>재고량</strong></div>
			<div class="col-xs-8 col-md-8">${product.prodStock }</div>
		</div>
		
		<hr/>
		</c:if>
			
		
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>상품상세정보</strong></div>
			<div class="col-xs-8 col-md-8">${product.prodDetail }</div>
		</div>
		
		<hr/>
		
		
		
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>가격</strong></div>
			<div class="col-xs-8 col-md-8">${product.price }</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>제조일자</strong></div>
			<div class="col-xs-8 col-md-8">${product.manuDate }</div>
		</div>
		
		<hr/>
		
		
		
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>등록일자</strong></div>
			<div class="col-xs-8 col-md-8">${product.regDate }</div>
		</div>
		
		<hr/>
		
		
		
		<div class="row">
	  		<div class="col-md-12 text-right ">
	  			<c:if test="${empty param.menu }">
	  			<button type="button" class="btn btn-default" id="check">확인</button>
	  			</c:if>
	  			<c:if test="${!empty param.menu }">
	  				<button type="button" class="btn btn-default" id="check">취소</button>
	  				<button type="button" class="btn btn-primary" id="buy" value1="${product.prodNo }" value2="${param.menu }">구매</button>
	  			</c:if>
	  		</div>
		</div>
		
		<br/>
		
 	</div>
 	<!--  화면구성 div Start /////////////////////////////////////-->

</body>
</html>