<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
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
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
 <!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&family=Open+Sans:ital,wght@0,300;1,300&display=swap" rel="stylesheet">

<style>
body{
	 padding-top : 50px;
	font-family: 'Nanum Myeongjo', serif;
}

div.row{
	font-family: 'Nanum Myeongjo', serif;
}
 div.page-header{
	font-family: 'Nanum Myeongjo', serif;
}  
table {
	font-family: 'Nanum Myeongjo', serif;
}
.jaewoong th{
 	text-align:center;
}


</style>
	<script type="text/javascript">


		 $(function() {
			 
			 
			 var totalprice = 0;
			 var price = $("td.price").attr("value");
			 console.log(price);
			 console.log('price');

			 var list = [];
		   		<c:forEach var="wishprod" items="${wishlist}" >
		   		totalprice += Number(${wishprod.price});
		   		</c:forEach>
		   		
			 console.log(totalprice);
			
			 $("#totalprice").val(totalprice);
			 
			 
			 
			 
			 
			 
			$( "td:nth-child(3)" ).css("color" , "#ffb6c1");


			
		});	
	</script>		

</head>

<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3 style="color:#bc8f8f">장바구니조회</h3>
	    </div>
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped">
      
        <thead>
          <tr class="jaewoong">
            <th align="center">선택</th>     
            <th align="center">No</th>       
            <th align="center" >상품번호</th>
            <th align="center" >상품이미지</th>
            <th align="center" >상품명</th>
            <th align="center">상품수량</th>
            <th align="center">상품가격</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="wishlist" items="${wishlist}">
			<c:set var="i" value="${ i+1 }" />
			<tr>			  
			  <td align="center"><input type="checkbox" checked/></td>
			  <td align="center">${ i }</td>
			  <td align="center" class="view" value="${wishlist.prodNo }">${wishlist.prodNo }</td>		
			  <td align="center">
			  <c:choose>
				    <c:when test="${wishlist.fileName.contains('&')}">
					    <c:choose>
						<c:when test="${wishlist.fileName.contains('mp4')}">
							<img src="/images/uploadFiles/tumbnail.png" class="image" width="100" height="100">
						</c:when>
						<c:otherwise>
							<c:forEach var="name" items="${wishlist.fileName.split('&')[0]}">
								<img src="/images/uploadFiles/${name}" class="image" width="100" height="100">
							</c:forEach>
						</c:otherwise>
						</c:choose>
				    </c:when>
				    <c:otherwise>
						<img src="/images/uploadFiles/${wishlist.fileName}" class="img-responsive img-rounded" class="image" width="100" height="100">
					</c:otherwise>
				</c:choose>
			  </td>	  
			  <td align="center" class="view" value="${wishlist.prodName }">${wishlist.prodName }</td>			  
			  <td align="center" class="view" value="${wishlist.buyNum }">${wishlist.buyNum }개</td>
			  <td align="center" class="price" value="${wishlist.price }">${wishlist.price }원</td>
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
      
      <hr/>
      
      <div align="right">총 결제금액 : 
      <input type="text" id="totalprice" value=""/> 원
      </div>
	  
	  <div align="right">
	  구매하기
	  </div>
 	</div>
 	

	
</body>
</html>