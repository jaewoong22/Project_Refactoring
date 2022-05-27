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
	
	 $( "#check" ).on("click" , function() {
		 console.log('확인');
		 self.location = "/product/listProduct?menu=manage"
	});
	
});


$(function() {
	
	$("#add").click(function(){
		console.log('추가등록');
		self.location = "/store/summernoteTest.jsp"
		
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
	       <h3 class=" text-info"  style="color:#bc8f8f">상품리뷰</h3>
	    </div>
	
		
	<div class="row">
	
		<div class="col-xs-8 col-md-8">
				<div class="row">
			  		<div class="col-xs-4 col-md-4"><strong>TITLE</strong></div>
					<div class="col-xs-8 col-md-8">${store.title}</div>
				</div>
				
				<hr/>	
						
				<div class="row">
			  		<div class="col-xs-4 col-md-4"><strong>CONTENT</strong></div>
					<div class="col-xs-8 col-md-8">${store.content }</div>
				</div>
				
				<hr/>
		</div>
		
		<div class="col-xs-4 col-md-4">			
				<div class="row">
			  		<div class="col-md-12 text-right ">
			  			<button type="button" class="btn btn-default" id="check">확인</button>
			  			<button type="button" class="btn btn-default" id="add">추가등록</button>
			  		</div>
				</div>
		</div>
		
	</div>
	
	
	
	
		<br/>
	
		
 	</div>
 	<!--  화면구성 div Start /////////////////////////////////////-->

</body>
</html>