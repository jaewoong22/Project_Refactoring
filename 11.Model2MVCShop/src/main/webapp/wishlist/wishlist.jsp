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
 div{
	font-family: 'Nanum Myeongjo', serif;
}  

 input[type="checkbox"]:checked{
 	background: #bc8f8f;
 }

</style>
	<script type="text/javascript">


	$(document).ready(function() {
			 
			///* 
			<!-- ------------- 총 결제금액 초기값 --------------- -->
			 
			 var totalprice = 0;
			 var price = $("div.price").attr("value");
			 var buyNum = $("div.buyNum").attr("value");
			 console.log(price);
			 console.log(buyNum);
		
			 
			 var list = [];
		   		<c:forEach var="wishprod" items="${wishlist}" >
		   		totalprice += (Number(${wishprod.price})*Number(${wishprod.buyNum}));
		   		</c:forEach>
		   		
			 console.log(totalprice);
			
			 $("#totalprice").val(totalprice);
			 
			 
			 <!-- ------------- 장바구니 삭제 --------------- -->
			 
			 $( "button.delete" ).on("click" , function() {
				 var wishNo = $(this).val();
					console.log('delete');
					console.log(wishNo);
					self.location = "/wishList/deleteWishlist?wishNo="+wishNo;
			  });

	
			 <!-- ------------- 상품수량 수정 --------------- -->

			 
			 
			 $( "button.plus" ).on("click" , function() {
		         
				 var wishNo = $(this).val();
				 var quantity = $(this).parent().children().eq(1).val();
				 quantity = Number(quantity)+1;
				console.log('plus');
				console.log(wishNo);
				console.log(quantity);
				
		         $.ajax( 
		               {
		                  url : "/wishList/json/updateWishlist?wishNo="+wishNo+"&buyNum="+quantity ,
		                  method : "GET" ,
		                  dataType : "json" ,
		                  headers : {
		                     "Accept" : "application/json",
		                     "Content-Type" : "application/json"
		                  },
		                  success : function(JSONData , status) {

		                	 //$('input[name=buyNum]').val(JSONData)
		                	 
		                  }
		            });
	  			 });
			 
			 $( "button.minus" ).on("click" , function() {
		         
				 var wishNo = $(this).val();
				 var quantity = $(this).parent().children().eq(1).val();
				 quantity = Number(quantity)-1;
					console.log('minus');
					console.log(wishNo);
					console.log(quantity);
				
		         $.ajax( 
		               {
		                  url : "/wishList/json/updateWishlist?wishNo="+wishNo+"&buyNum="+quantity ,
		                  method : "GET" ,
		                  dataType : "json" ,
		                  headers : {
		                     "Accept" : "application/json",
		                     "Content-Type" : "application/json"
		                  },
		                  success : function(JSONData , status) {
		                	  
		                	  //$('input[name=buyNum]').val(JSONData)
		                	 
		                  }
		            });
	  			 });
			 
		 
			 
			 
			 $( "button:contains('구매')" ).on("click" , function() {
				 console.log('구매');
				 
				 $("form").attr("method" , "GET").attr("action" , "/purchase/addPurchaseByWishlist").submit();
				 
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
	
		<div class="page-header text-info">
	       <h3 style="color:#bc8f8f">장바구니조회</h3>
	    </div>
		
		
      
        <div class="row">
            <div class="col-md-1 text-center"><input type="checkbox" id="cbx_chkAll" checked/></div>
            <div class="col-md-6 text-center">상품정보</div>
            <div class="col-md-2 text-center">상품수량</div>
            <div class="col-md-2 text-center">소 계</div>
            <div class="col-md-1 text-center"></div>
        </div>
       
		<hr/>
		<form class="form-horizontal">
		  <c:set var="i" value="0" />
		  <c:forEach var="wishlist" items="${wishlist}">
		  <div class="row">
			<c:set var="i" value="${ i+1 }" />
			  
			  <div class="col-md-1 text-center">
			  	<input type="checkbox" name="wishNo" value="${wishlist.wishNo}"/>		  	
			  </div>
			  
			  <div class="col-md-6 text-left">
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
				&emsp;&emsp;${wishlist.prodName }
			  </div>	 
			    	  
			    	  
			    	  
			  <div align="center" class="col-md-2 text-center buyNum" value="${wishlist.buyNum }">
			  	<c:choose>
			  		<c:when test="${wishlist.buyNum == 1 }">
			  			<a href="#" class="btn btn-default btn-xs disabled" role="button" value="${wishlist.wishNo}">-</a>
			  		</c:when>
			  		<c:otherwise>
			  			<button class="btn btn-default btn-xs minus" value="${wishlist.wishNo}">-</button>
			  		</c:otherwise>
			  	</c:choose>
			  	<input type="text" name="buyNum" value=" ${wishlist.buyNum }" style="width:30px;" readonly/>
			  	<button class="btn btn-default btn-xs plus" value="${wishlist.wishNo}">+</button>
			  </div>
			  
			  
			  
			  <div align="center" class="col-md-2 text-center price" value="${wishlist.price*wishlist.buyNum }" >${wishlist.price*wishlist.buyNum } 원</div>
			  
			  
			  
			  <div class="col-md-1 text-center">
			  	<button class="btn btn-default btn-sm delete" value="${wishlist.wishNo}">삭제</button>
			  </div>
			  
			  
			  
           </div>
           <hr/>
          </c:forEach>
        
	      </form>
	      <div align="right">
	        총 결제금액 : <input type="text" id="totalprice" value="" style="border:none;width:100px;text-align:right;" min="0" readonly/> 원
	      </div>
     
      
	  <hr/>
	  
	  <div align="right">
	 	 <button class="btn btn-default btn-sm test">TEST</button>
	  	<button class="btn btn-default btn-sm">구매하기</button>
	  </div>
	  
 	</div>
 	

	
</body>
</html>