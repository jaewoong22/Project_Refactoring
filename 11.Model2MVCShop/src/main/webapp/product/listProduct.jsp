<%@ page contentType="text/html; charset=EUC-KR" %>
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
   <!-- font -->
   <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;1,300&display=swap" rel="stylesheet">
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript">


		function fncGetList(currentPage) {
			console.log(currentPage);
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/product/listProduct?&menu=${param.menu }").submit();
		}


		 $(function() {
			 
			 $( "#search" ).on("click" , function() {
				fncGetList(1);
			});
			
			 $( "#sorting" ).on("click" , function() {
					fncGetList(1);
			});
			
			///*
			 
			 $( "a.btn-defualt" ).on("click" , function() {
				 var prodNo =$(this).attr("value");
				 console.log('상세조회');
				 self.location = "/product/getProduct?prodNo="+prodNo
			});
			 
			
			 $( "a.update" ).on("click" , function() {
				 var prodNo =$(this).attr("value");
				 console.log('수정하기');
				 self.location = "/product/updateProduct?prodNo="+prodNo
			});
			 
			 $( "a.buy" ).on("click" , function() {
				 var prodNo =$(this).attr("value");
				 console.log('구매하기');
				 self.location = "/product/getProduct?menu=search&prodNo="+prodNo
			});
			

			 //=========autoComplete=================================================
			 
			 var list = [];
		   		<c:forEach var="names" items="${prodNames }" >
		   		list.push("${names.prodName}");
		   		</c:forEach>
		   		
		   		console.log(list);
	   		    
		   		$( "#prodname" ).autocomplete({
		   		      source: list,
		   		      
		   		});
		   	//====================================================================
			 
		});	
		 
		
	</script>	
	 <!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&family=Open+Sans:ital,wght@0,300;1,300&display=swap" rel="stylesheet">

<style>
body{
	padding-top : 50px;
	
}

div.row{
	font-family: 'Nanum Myeongjo', serif;
}
 div.page-header{
	font-family: 'Nanum Myeongjo', serif;
}       
       #image {
			width: 250px;
		 	height:250px;
       }   
       
       div.thumbnail {
       		height:400px;
       }
    </style>
	
</head>

<body>
	<input type="hidden" id="cv" value="${search.currentPage }"/>
	
	<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3  style="color:#bc8f8f">상품목록조회</h3>
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary" style="color:gray">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    
			    <form class="form-inline" name="detailForm">
			    <div class="col-md-6 text-right">
				  <div class="form-group">
				    <c:if test="${ user.role.equals('admin')}">
						<select name="searchCondition" class="form-control" style="width:125px">
						 	<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>상품번호</option>
							<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품명</option>
							<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>상품가격</option>
						</select>
					</c:if>
					<c:if test="${ !user.role.equals('admin')}">
						<input type="hidden" name="searchCondition" value="1">
					</c:if>	
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색</label>
				    <input type="text" class="form-control" id="prodname" name="searchKeyword"  placeholder="검색"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default" id="search">검색</button>
				</div>  
				 
				 <div class="col-md-6 text-left"> 
				  <div class="form-group" align="left">
				    <c:if test="${ !user.role.equals('admin')}">
						<select name="orderCondition" class="form-control" style="width:125px">
						 	<option value="0"  ${ ! empty search.orderCondition && search.orderCondition==0 ? "selected" : "" }>--정렬하기--</option>
							<option value="1"  ${ ! empty search.orderCondition && search.orderCondition==1 ? "selected" : "" }>낮은가격순</option>
							<option value="2"  ${ ! empty search.orderCondition && search.orderCondition==2 ? "selected" : "" }>높은가격순</option>
							<!-- <option value="3"  ${ ! empty search.orderCondition && search.orderCondition==3 ? "selected" : "" }>판매중인 상품</option> -->
						</select>
					</c:if>
					<c:if test="${ user.role.equals('admin')}">
						<select name="orderCondition" class="form-control" style="width:125px">
							<option value="0"  ${ ! empty search.orderCondition && search.orderCondition==0 ? "selected" : "" }>--정렬하기--</option>
							<option value="3"  ${ ! empty search.orderCondition && search.orderCondition==3 ? "selected" : "" }>판매중</option>
							<option value="4"  ${ ! empty search.orderCondition && search.orderCondition==4 ? "selected" : "" }>재고없음</option>
						</select>
					</c:if>
				  </div>
				  <button type="button" class="btn btn-default" id="sorting">조회</button>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		<div><br/><br/>
		</div>
		
      <!--  table Start /////////////////////////////////////-->
      
		<div class="row" id="target">
		  <c:set var="i" value="0" />
		  <c:forEach var="product" items="${list}">
			
			  <div class="col-sm-6 col-md-4">
			    <div class="thumbnail">
			    <c:choose>
			    <c:when test="${product.fileName.contains('&')}">
				    <c:choose>
					<c:when test="${product.fileName.contains('mp4')}">
						<img src="/images/noimage.jpg" id="image">
					</c:when>
					<c:otherwise>
						<c:forEach var="name" items="${product.fileName.split('&')[0]}">
							<img src="/images/uploadFiles/${name}" id="image">
						</c:forEach>
					</c:otherwise>
					</c:choose>
			    </c:when>
			    <c:otherwise>
					<img src="/images/uploadFiles/${product.fileName}" class="img-responsive img-rounded" id="image">
				</c:otherwise>
				</c:choose>
			    
			      <div class="caption">
			        <h3>${product.prodName}</h3>
			        <c:choose>
			        	<c:when test="${user.role.equals('admin') && param.menu.equals('manage')}">
			        		<p>남은 재고량 : ${product.prodStock}</p>
			        	</c:when>
			        	<c:otherwise>
			        		<p>${product.price} 원</p>
			        	</c:otherwise>
			        </c:choose>
			        <p align="right">
			        <a class="btn btn-defualt btn"  role="button" value="${product.prodNo}" style="color:#bc8f8f">상세조회</a>
			        
			        
			        
			        <c:if test="${param.menu.equals('manage') }">
			        <a class="btn btn-defualt btn update"  role="button" value="${product.prodNo}">수정하기</a>			        
			        </c:if>
			        <c:if test="${param.menu.equals('search') }">
			        	<c:choose>
			        		<c:when test="${product.prodStock == '0' }">
			        			<a class="btn btn-defualt btn disabled" role="button" >재고없음</a>
			        		</c:when>
			        		<c:otherwise>
			        			<a class="btn btn-default btn buy" role="button" value="${product.prodNo}">구매하기</a>
			        		</c:otherwise>
			        	</c:choose>			        
			        </c:if>
			        </p>
			      </div>
			    </div>
			  </div>
			
			
          </c:forEach>
          </div>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>
</html>