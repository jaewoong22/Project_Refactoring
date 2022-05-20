<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


 <!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&family=Open+Sans:ital,wght@0,300;1,300&display=swap" rel="stylesheet">

<style>
body>div.container{
	font-family: 'Nanum Myeongjo', serif;
	font-family: 'Open Sans', sans-serif;
}
</style>

<!-- ToolBar Start /////////////////////////////////////-->
<div class="navbar  navbar-default navbar-fixed-top" >
	
	<div class="container">
	       
		<a class="navbar-brand" href="/index.jsp">Home Deco</a>
		
		<!-- toolBar Button Start //////////////////////// -->
		<div class="navbar-header">
		    <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#target">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		    </button>
		</div>
		<!-- toolBar Button End //////////////////////// -->
		
	    <!--  dropdown hover Start -->
		<div 	class="collapse navbar-collapse" id="target" 
	       			data-hover="dropdown" data-animations="fadeInDownNew fadeInRightNew fadeInUpNew fadeInLeftNew">
	         
	         	<!-- Tool Bar 를 다양하게 사용하면.... -->
	             <ul class="nav navbar-nav">
	             
	              <!--  회원관리 DrowDown -->
	              <c:if test="${sessionScope.user.role == 'admin'}">
	              <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >회원관리</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li><a href="#">개인정보조회</a></li>
	                         
	                         <li><a href="#">회원정보조회</a></li>
	                         
	                         <li class="divider"></li>
	                         <li><a href="#">etc...</a></li>
	                     </ul>
	                 </li>
	                 </c:if>
	              <!-- 판매상품관리 DrowDown  -->
	               <c:if test="${sessionScope.user.role == 'admin'}">
		              <li class="dropdown">
		                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                         <span >판매상품관리</span>
		                         <span class="caret"></span>
		                     </a>
		                     <ul class="dropdown-menu">
		                         <li><a href="#">상품등록</a></li>
		                         <li><a href="#">상품관리</a></li>
		                         <li class="divider"></li>
		                         <li><a href="#">판매리스트조회</a></li>
		                     </ul>
		                </li>
	                 </c:if>
	                 
	              <!-- 구매관리 DrowDown -->
	              <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >상품구매</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li><a href="#">상품검색</a></li>
	                         <li class="divider"></li>
	                         <li><a href="#">최근 본 상품</a></li>
	                         <c:if test="${sessionScope.user.role == 'user'}">
	                         <li class="divider"></li>
	                           <li><a href="#">구매이력조회</a></li>
	                         </c:if>
	                     </ul>
	                 </li>
	             </ul>
	             
				<c:if test="${! empty sessionScope.user.role}">
				<ul class="nav navbar-nav navbar-right">
	                 <li><a href="#"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"/> Cart</a></li>
	                 <li><a href="#"><span class="glyphicon glyphicon-user" aria-hidden="true"/> MyPage</a></li>
	                <li><a href="#"> <span class="glyphicon glyphicon-log-out" aria-hidden="true"/> LOGOUT</a></li>
				</ul>
				</c:if>
				
				<c:if test="${empty sessionScope.user.role}">
				<ul class="nav navbar-nav navbar-right">
	                 <li><a href="#"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"/> Cart</a></li>
				</ul>
				</c:if>
				
		</div>
		<!-- dropdown hover END -->	       
	    
	</div>
</div>
		<!-- ToolBar End /////////////////////////////////////-->
 	
   	
   	
   	<script type="text/javascript">
	
		//============= logout Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains(' LOGOUT')").on("click" , function() {
				$(self.location).attr("href","/user/logout");
				//self.location = "/user/logout"
			}); 
		 });
		
		//============= 회원정보조회 Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('회원정보조회')").on("click" , function() {
				//$(self.location).attr("href","/user/logout");
				self.location = "/user/listUser"
			}); 
		 });
		
		//=============  개인정보조회회 Event  처리 =============	
	 	$( "a:contains('개인정보조회')" ).on("click" , function() {
	 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/user/getUser?userId=${sessionScope.user.userId}");
		});
		
	 	$( "a:contains(' MyPage')" ).on("click" , function() {
	 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/user/getUser?userId=${sessionScope.user.userId}");
		});
	 	
	 	//=============  장바구니 Event  처리 =============	
	 	$( "a:contains(' Cart')" ).on("click" , function() {
	 		
			$(self.location).attr("href","/wishList/getWishlist?userId=${sessionScope.user.userId}");
		});
	 	
	 	//=============  판매상품등록 Event  처리 =============	
	 	$( "a:contains('상품등록')" ).on("click" , function() {
	 		
			//$(self.location).attr("href","/product/addProductView.jsp");
			$(self.location).attr("href","/store/summernoteTest.jsp");
		});
	 	
	 	//=============  판매상품관리 Event  처리 =============	
	 	$( "a:contains('상품관리')" ).on("click" , function() {
	 		
			$(self.location).attr("href","/product/listProduct?menu=manage");
		});
	 	
	 	//=============  판매리스트조회 Event  처리 =============	
	 	$( "a:contains('판매리스트조회')" ).on("click" , function() {
	 		
			$(self.location).attr("href","/purchase/listSales?menu=manage");
		});
	 	
	 	//=============  상 품 검 색 Event  처리 =============	
	 	$( "a:contains('상품검색')" ).on("click" , function() {
	 		
			$(self.location).attr("href","/product/listProduct?menu=search");
		});
	 	
	 	//=============  구매이력조회 Event  처리 =============	
	 	$( "a:contains('구매이력조회')" ).on("click" , function() {
	 		
			$(self.location).attr("href","/purchase/listPurchase");
		});
	 	
		
	 	//=============  최근 본 상품 Event  처리 =============	
	 	$( "a:contains('최근 본 상품')" ).on("click" , function() {
	 		popWin = window.open("/history.jsp","popWin","left=300, top=200, width=300, height=400, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
		});
	</script>  