<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>회원 목록 조회</title>
	
	<link rel="stylesheet" href="/css/admin.css" type="text/css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
 	<link rel="stylesheet" href="/resources/demos/style.css">

	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  	<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
	
	<!-- CDN(Content Delivery Network) 호스트 사용 -->
	<!-- <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script> -->
	<script type="text/javascript">


		function fncGetList(currentPage) {
			console.log(currentPage);
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/product/listProduct?&menu=${param.menu }").submit();
		}

		
		
		

		 $(function() {
			 
			 $( "td.ct_btn01:contains('검색')" ).on("click" , function() {
				fncGetList(1);
			});
			
			 $( "td.ct_btn01:contains('조회')" ).on("click" , function() {
					fncGetList(1);
				});
			
			
			 //==================================================================================
				 
			 
			$( "td.manage" ).on("click" , function() {
				console.log('업데이트');
				//var message = $("input:hidden[name='productProdNo']").val();
				var message = $(this).attr("value");
				console.log(message);
					self.location ="/product/updateProduct?menu=${param.menu}&prodNo="+message;
			});
			
		

			$( ".ct_list_pop td:nth-child(3)" ).css("color" , "#f08080");
			$( "td.manage" ).css("color" , "#f08080");
			$( "td.search" ).css("color" , "#f08080");
			$(".ct_list_pop:nth-child(2n+1)" ).css("background-color" , "whitesmoke");
			
			//==================================================================================
				
			 ///*  
	   		$( "td.search" ).on("click" , function() {
	         console.log($(this).attr("value"));
	         
	         var prodNo =$(this).attr("value");
	         $.ajax( 
	               {
	                  url : "/product/json/getProduct/"+prodNo ,
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
	                     					  +"<img src='/images/uploadFiles/"+JSONData.fileName+"' width='150' height='150' />"
	                                          +"</td>"
	                                          +"<td width='300px'>"
	                                          +"<h4>&emsp;"
	                                          +"상품번호	: "+JSONData.prodNo+"<br/><br/>&emsp;"
	                                          +"상품명	: "+JSONData.prodName+"<br/><br/>&emsp;"
	                                          +"상세정보	: "+JSONData.prodDetail+"<br/><br/>&emsp;"
	                                          +"제조일자 	: "+JSONData.manuDate
	                                          +"</h4>"
	                                          +"</td>"
	                                          +"<td></td>"
	                                          +"<td width='975px' class='ct_btn01' align='right' style='color:#ff6347'> <b>구매하기</b>"
	              							  +"</td>"
	                                          +"</tr>"	                                          
	                                          +"</table>";
	                                          
	                     //Debug...                           
	                     //alert(displayValue);
	                     $("table.display").remove();
	                     $( "#"+prodNo+"" ).html(displayValue);
	                     
	                     $( "td.ct_btn01:contains('구매하기')" ).on("click" , function() {
	            			 console.log('구매하기');
	            			self.location = "/purchase/addPurchase?prodNo="+prodNo+"&menu=${param.menu}"
	            		});
	                     
	                  }
	            });
  			 });
				
   		    
	   		var list = [];
	   		<c:forEach var="names" items="${prodNames }" >
	   		list.push("${names.prodName}");
	   		</c:forEach>
	   		
	   		console.log(list);
   		    
	   		$( "#prodname" ).autocomplete({
	   		      source: list,
	   		      
	   		 });
	   		
	   		/*
	   		  select: function(event, ui) {
	               console.log(ui.item);	
	           },
	           focus: function(event, ui) {
	               return false;
				}
	           //*/
	   		
	   		//================================================================	
	   			
	   		var currentpage = $("#cv").val();
	   		console.log(currentpage);


		//================================================================		

/*
	   	 $( "#test" ).on("click" , function() {
	   		var page = $("#cv").val();
	   		console.log(page);
	         $.ajax( 
	               {
	            	  url : "/product/json/listProduct?&menu=${param.menu }" ,
	                  method : "POST" ,
	                  data : JSON.stringify({
	                	  currentPage : page 
	                  }), 
	                  dataType : "json" ,
	                  headers : {
	                     "Accept" : "application/json",
	                     "Content-Type" : "application/json"
	                  },
	                  success : function(JSONData , status) {
	                	  
	                     var displayValue = "<table class='display' height='180'>"
	                     					  +"<tr>"
	                                          +"<td width='300px'>"
	                                          +"<h4>&emsp;"
	                                          +"결과	: "+JSONData.list;
	                                          +"</h4>"
	                                          +"</td>"
	                                          +"</tr>"	                                          
	                                          +"</table>";
	                                          
	                     //Debug...                           
	                     //alert(displayValue);
	                     
	                     $( "#"+page+"" ).html(displayValue);
	                     
	                     
	                  }
	            });
  			 });

//*/


	   //================================================================
			
///*	   		
			var currentpage = $("#cv").val();
	   		console.log(currentpage);

			$(document).ready(function(){
			    start.init();
			});
			var start = {
			        param : {
			            curPage : 1
			        },
			        
			        init : function() {
			           this.testData();
			           this.testEvent();
			        },
			       testData : function() {
			            this.setListItems(""); // 첫 진입시 데이터 셋팅
			        },
			       testEvent : function() {
			            // 무한 스크롤
			            $(window).scroll(function() {
			                // 맨 밑으로 스크롤이 갔을경우 if문을 탑니다.
			                if($(window).scrollTop() == $(document).height() - $(window).height()) { 
			                    start.param.curPage++; // 현재 페이지에서 +1 처리.
			                    
			                    start.testAjax(); //ajax 호출
			                } 
			            }); 
			        },
			        // 무한 스크롤 ajax 요청
			        testAjax : function() {
			            $.ajax({
			                
			                  url : "/product/json/listProduct?&menu=${param.menu }" ,
			                  method : "POST" ,
			                  data : JSON.stringify(start.param), 
			                  dataType : "json" ,
			                  headers : {
			                     "Accept" : "application/json",
			                     "Content-Type" : "application/json"
			                  },
			                success : function(JSONData , status) {
			                	  
			                     //alert(JSONData.list[0].prodName);
			                     start.setListItems(JSONData.list);
			                    			                     
			                  }
			            });
			        },
			        
			        ///*
			        // 테스트 데이터 setting
			        setListItems : function (JSONData) {
			            $.each(JSONData, function(i, product) {
			                
			            	console.log(product.prodName);
			                // 부모 엘리먼트에 append 할 데이터를 셋팅한다.
			               // alert(product.prodName);
			                var $li = $('<li>').append($('<div>').text(product.prodName));
			                                                    
			                
			                // 부모 엘리먼트에 append
			                $('#jj').append($li);
			            })
			        }
			        
			        //*/
			}
//*/
	   		//=================================================================



		});	
		 
		
	</script>		
	
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

<form name="detailForm">

<input type="hidden" id="cv" value="${search.currentPage }"/>

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
					<c:choose>
						<c:when test="${ param.menu.equals('manage')}">
							상품 목록조회
						</c:when>
						<c:when test="${ param.menu.equals('search')}">
							<c:if test="${ !user.role.equals('admin')}">
							상품목록
							</c:if>
							<c:if test="${ user.role.equals('admin')}">
							상품 관리
							</c:if>
						</c:when>
					</c:choose>
					</td>
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
		<td align="right">
		
			<c:if test="${ user.role.equals('admin')}">
				<select name="searchCondition" style="width:80px">
				 	<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>상품번호</option>
					<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품명</option>
					<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>상품가격</option>
				</select>
				<input 	type="text" name="searchKeyword" value="${! empty search.searchKeyword ? search.searchKeyword : ''}"  class="ct_input_g" 
							style="width:200px; height:20px" >
			</c:if>
				
			<c:if test="${ !user.role.equals('admin')}">
				<input type="hidden" name="searchCondition" value="1">
				<label for="prodname">상품명: </label>
				<input id="prodname" name="searchKeyword" value="${! empty search.searchKeyword ? search.searchKeyword : ''}"  class="ct_input_g" 
							style="width:200px; height:20px" >
			</c:if>	

			
		</td>
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						검색
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<table width="180px" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="left">
			<c:if test="${ !user.role.equals('admin')}">
				<select name="orderCondition" class="ct_input_g" style="width:100px">
				 	<option value="0"  ${ ! empty search.orderCondition && search.orderCondition==0 ? "selected" : "" }>--정렬하기--</option>
					<option value="1"  ${ ! empty search.orderCondition && search.orderCondition==1 ? "selected" : "" }>낮은가격순</option>
					<option value="2"  ${ ! empty search.orderCondition && search.orderCondition==2 ? "selected" : "" }>높은가격순</option>
					<!-- <option value="3"  ${ ! empty search.orderCondition && search.orderCondition==3 ? "selected" : "" }>판매중인 상품</option> -->
				</select>
			</c:if>
			<c:if test="${ user.role.equals('admin')}">
				<select name="orderCondition" class="ct_input_g" style="width:100px">
					<option value="0"  ${ ! empty search.orderCondition && search.orderCondition==0 ? "selected" : "" }>--정렬하기--</option>
					<option value="3"  ${ ! empty search.orderCondition && search.orderCondition==3 ? "selected" : "" }>판매중</option>
					<option value="4"  ${ ! empty search.orderCondition && search.orderCondition==4 ? "selected" : "" }>재고없음</option>
				</select>
			</c:if>
			
		</td>
		<td align="left" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						조회
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
				</tr>
			</table>
		</td>
		
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;"  id="scrollTable">
	<tr>
		<td colspan="11" >
			전체   ${resultPage.totalCount } 건수,	현재 ${resultPage.currentPage} 페이지
		</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">상품명</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">가격</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" id="test">등록일</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">현재상태</td>
		<c:if test="${user.role.equals('admin') && param.menu.equals('manage')}">
			<td class="ct_line02"></td>
		<td class="ct_list_b">재고량</td>
		</c:if>	
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>

	 <c:set var="i" value="0" />
	<c:forEach var="product" items="${list}">
				
		<c:set var="i" value="${ i+1 }" />
		<tr class="ct_list_pop">
			<td align="center" class="ct_list_pop_ch">${ i }</td>		
				<td></td>
				
				<c:if test="${param.menu.equals('manage') }">
					<td align="center"  class="manage" value="${product.prodNo}" >${product.prodName }</td>
				</c:if>
				<c:if test="${param.menu.equals('search') }">
					<c:choose>
						<c:when test="${product.prodStock=='0' && !user.role.equals('admin')}">
						
							<td align="center" >${product.prodName }</td>
						</c:when>
						<c:otherwise>
							<td  align="center" class="search" value="${product.prodNo}">${product.prodName }</td>
						</c:otherwise>
					</c:choose>				
				</c:if>
			
			<td></td>
			<td align="center" >${product.price}</td>
			<td></td>
			<td align="center">${product.regDate}
			</td>		
			<td></td>
			<c:choose>
				<c:when test="${product.prodStock!='0'}">
					<td align="center">판매중 </td>
				</c:when>
				<c:otherwise>
					<td align="center" style="color:#f08080">재고없음</td>
				</c:otherwise>
			</c:choose>
			<c:if test="${user.role.equals('admin') && param.menu.equals('manage')}">
			<td></td>
			<td align="center">${product.prodStock}
			</td>
			</c:if>	
		</tr>
		<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
		</tr>
		<tr>
			<td id="${product.prodNo}" colspan="11" bgcolor="#f5f5f5" height="1"></td>
		</tr>
		<tr>
			<td id="kkkkkk" colspan="11" bgcolor="#f5f5f5" height="1"></td>
		</tr>
		<tr>
			<td id="jj" colspan="11" bgcolor="#f5f5f5" height="1"></td>
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