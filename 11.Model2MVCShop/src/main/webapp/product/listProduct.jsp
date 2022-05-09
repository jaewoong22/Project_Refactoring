<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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
	width: 350px;
	height:350px;
	border-radius: 5px;
} 

#image_none {
	width: 350px;
	height:350px;
	filter: blur(2px);
	border-radius: 5px;
}   
    
div.thumbnail {
	height:520px;
	border-radius: 5px;
}
       

</style>
	<script type="text/javascript">

		
	
		function fncGetList(currentPage) {
			console.log(currentPage);
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/product/listProduct?&menu=${param.menu }").submit();
		}


		 $(function() {
			 
			
			 
			

			 //=========autoComplete=================================================
			 
			 var list = [];
		   		<c:forEach var="names" items="${prodNames }" >
		   		list.push("${names.prodName}");
		   		</c:forEach>
		   		
	   		    
		   		$( "#prodname" ).autocomplete({
		   		      source: list,
		   		      
		   		});
		   	//====================================================================
		///*
		
			
            $(window).scroll(function() {
                if($(window).scrollTop() == $(document).height() - $(window).height()) { 
                	
                	var cpage = $("#currentPage").val();
                	cpage = Number(cpage)+1;
                	console.log(cpage);
        	   		
        	   		
			            $.ajax({
			                
			                  url : "/product/json/listProduct?&menu=${param.menu }" ,
			                  method : "POST" ,
			                  data : JSON.stringify({
			                	  currentPage : cpage
			                  }), 
			                  dataType : "json" ,
			                  headers : {
			                     "Accept" : "application/json",
			                     "Content-Type" : "application/json"
			                  },
			                success : function(JSONData , status) {
			                	 
			                	$("#currentPage").val(cpage)
			                	console.log(cpage); 
			                	//alert(JSONData.list[0].prodName);
			                	//alert(JSONData.list.length);
			                	console.log(JSONData.list[0].prodName);
				                	 
			                	for(var i=0; i<JSONData.list.length-1; i++){
			                		///*
			                		var image;
			                		var message;
			                		var onSale;
			                		var button;
			                		/*
			                		if(JSONData.list[i].onSale == '1'){
			                			if(JSONData.list[i].fileName.indexOf('&',0) != -1){
			                				if(JSONData.list[i].fileName.indexOf('mp4',0) != -1){
			                					image = "tumbnail.png";
			                				}else{
			                					image = JSONData.list[i].fileName.split('&')[0];
			                				}
			                			}else{
			                				image = JSONData.list[i].fileName;
			                			}
			                		}else{
			                			if(JSONData.list[i].fileName.indexOf('&',0) != -1){
			                				if(JSONData.list[i].fileName.contains('mp4')){
			                					image = "tumbnail.png";
			                				}else{
			                					image = JSONData.list[i].fileName.split('&')[0];
			                				}
			                			}else{
			                				image = JSONData.list[i].fileName;
			                			}
			                		}
			                		*/
			                		
			                	
			                		
			                		if(JSONData.list[i].onSale == '1'){
		                				if(JSONData.list[i].fileName.indexOf('mp4',0) != -1){
		                					image="<img src='/images/uploadFiles/tumbnail.png' id='image'>";
		                				}else{
		                					image = "<img src='/images/uploadFiles/"+JSONData.list[i].fileName.split('&')[0]+"' id='image'>";
		                				}
			                			
			                		}else if(JSONData.list[i].onSale == '0'){
			                			if(JSONData.list[i].fileName.indexOf('mp4',0) != -1){
		                					image="<img src='/images/uploadFiles/tumbnail.png' id='image_none'>";
		                				}else{
		                					image = "<img src='/images/uploadFiles/"+JSONData.list[i].fileName.split('&')[0]+"' id='image_none'>";
		                				}
			                		}
			                		
			                		
			                		if(${user.role.equals('admin') && param.menu.equals('manage')}){
			                			message="<p>���� ��� : "+JSONData.list[i].prodStock+"</p>";
			                		}else{
			                			message="<p></p>";
			                		}
			                		
			                		
			                		if(JSONData.list[i].onSale == '0' && param.menu.equals('search')){
			                			onSale = "<p style='color:#DB4455'>�Ǹ�����</p>";
			                		}else if(JSONData.list[i].onSale == '0' && param.menu.equals('manage')){
			                			onSale = "<p style='color:#DB4455'>*�Ǹ������� ��ǰ�Դϴ�.</p>";
			                		}else if(JSONData.list[i].onSale == '1'){
			                			onSale = "<p></p>";
			                		}
			                		
			                		if(${param.menu=='manage' }){
			                			button = "<a class='btn btn-defualt btn update'  role='button' value='"+JSONData.list[i].prodNo+"'>�����ϱ�</a>" ;
			                		}else{
			                			if(JSONData.list[i].prodStock == "0"){
			                				button = "<a class='btn btn-defualt btn disabled' role='button' >������</a>";
			                			}else{
			                				if(JSONData.list[i].onSale=='1'){
			                					button = "<a class='btn btn-default btn buy' role='button' value='"+JSONData.list[i].prodNo+"'>�����ϱ�</a>";
			                				}else{
			                					button = "<a class='btn btn-default btn disabled' role='button' value='"+JSONData.list[i].prodNo+"'>�����ϱ�</a>";
			                				}
			                			}
			                		}
			                		
				                     var displayValue = "<div class='col-sm-6 col-md-4'>"
				                     					+"<div class='thumbnail'>"
				                     					+image
			                     						+"<div class='caption'>"
			                     						+"<h3>"+JSONData.list[i].prodName+"</h3>"
			                     						+message
			                     						+onSale
			                     						+"<p>"+JSONData.list[i].price+" ��</p>"
			                     						+"<p align='right'>"
			                     						+"<a class='btn btn-defualt btn'  role='button' value='"+JSONData.list[i].prodNo+"' style='color:#bc8f8f'>����ȸ</a>"
			                     						+button
			                     						+"</p>"
			                     						+"</div></div></div>"
			                     						
			                     		//*/				
				               	$( '#scrollList' ).append(displayValue);	
			                     						
			                     						 		
			                    						
			                     						
			                	}//for 
			                 }
			            });//ajax
			           
                }//if
            });//function
		   		
		   		
		   		//*/

		   		

		   	//====================================================================	
		   		
		   		
            $( "#search" ).on("click" , function() {
				fncGetList(1);
			});
			
			 $( "#sorting" ).on("click" , function() {
					fncGetList(1);
			});
			
			///*
			 
			 $( "a.btn-defualt" ).on("click" , function() {
				 var prodNo =$(this).attr("value");
				 console.log('����ȸ');
				 self.location = "/product/getProduct?prodNo="+prodNo
			});
			 
			
			 $( "a.update" ).on("click" , function() {
				 var prodNo =$(this).attr("value");
				 console.log('�����ϱ�');
				 self.location = "/product/updateProduct?prodNo="+prodNo
			});
			 
			 $( "a.buy" ).on("click" , function() {
				 var prodNo =$(this).attr("value");
				 console.log('�����ϱ�');
				 self.location = "/product/getProduct?menu=search&prodNo="+prodNo
			});
			 
			 
			 $(document).on('click', 'a.btn-defualt', function(){
				 var prodNo =$(this).attr("value");
				 console.log('����ȸ');
				 self.location = "/product/getProduct?prodNo="+prodNo
			});
			 
			
			 $(document).on('click', 'a.update', function(){
				 var prodNo =$(this).attr("value");
				 console.log('�����ϱ�');
				 self.location = "/product/updateProduct?prodNo="+prodNo
			});
			 
			 $(document).on('click', 'a.buy', function(){
				 var prodNo =$(this).attr("value");
				 console.log('�����ϱ�');
				 self.location = "/product/getProduct?menu=search&prodNo="+prodNo
			});
			 
	   	
			//====================================================================	
			 
		});	
		 
		
	</script>		
</head>

<body>
	
	
	<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3  style="color:#bc8f8f">��ǰ�����ȸ</h3>
	    </div>
	    
	    <!-- table ���� �˻� Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary" style="color:gray">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>
		    
		    
			    <form class="form-inline" name="detailForm">
			    <div class="col-md-6 text-right">
				  <div class="form-group">
				    <c:if test="${ user.role.equals('admin')}">
						<select name="searchCondition" class="form-control" style="width:125px">
						 	<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option>
							<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
							<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>��ǰ����</option>
						</select>
					</c:if>
					<c:if test="${ !user.role.equals('admin')}">
						<input type="hidden" name="searchCondition" value="1">
					</c:if>	
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">�˻�</label>
				    <input type="text" class="form-control" id="prodname" name="searchKeyword"  placeholder="�˻�"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default" id="search">�˻�</button>
				</div>  
				 
				 <div class="col-md-6 text-left"> 
				  <div class="form-group" align="left">
				    <c:if test="${ !user.role.equals('admin')}">
						<select name="orderCondition" class="form-control" style="width:125px">
						 	<option value="0"  ${ ! empty search.orderCondition && search.orderCondition==0 ? "selected" : "" }>--�����ϱ�--</option>
							<option value="1"  ${ ! empty search.orderCondition && search.orderCondition==1 ? "selected" : "" }>�������ݼ�</option>
							<option value="2"  ${ ! empty search.orderCondition && search.orderCondition==2 ? "selected" : "" }>�������ݼ�</option>
							<!-- <option value="3"  ${ ! empty search.orderCondition && search.orderCondition==3 ? "selected" : "" }>�Ǹ����� ��ǰ</option> -->
						</select>
					</c:if>
					<c:if test="${ user.role.equals('admin')}">
						<select name="orderCondition" class="form-control" style="width:125px">
							<option value="0"  ${ ! empty search.orderCondition && search.orderCondition==0 ? "selected" : "" }>--�����ϱ�--</option>
							<option value="3"  ${ ! empty search.orderCondition && search.orderCondition==3 ? "selected" : "" }>�Ǹ���</option>
							<option value="4"  ${ ! empty search.orderCondition && search.orderCondition==4 ? "selected" : "" }>�Ǹ�����</option>
							<option value="5"  ${ ! empty search.orderCondition && search.orderCondition==4 ? "selected" : "" }>������</option>
						</select>
					</c:if>
				  </div>
				  <button type="button" class="btn btn-default" id="sorting">��ȸ</button>
				  </div>
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value="1"/>
				  
				</form>
	    	</div>
	    	
		
		
		<!-- table ���� �˻� Start /////////////////////////////////////-->
	<br/>
		<div>
		<%--<br/><jsp:include page="../common/pageNavigator_new.jsp"/><br/> --%>
		</div>
		
      <!--  table Start /////////////////////////////////////-->
      
		<div class="row" id="target">
		  <c:set var="i" value="0" />
		  <c:forEach var="product" items="${list}">
			
			  <div class="col-sm-6 col-md-4">
			    <div class="thumbnail">
			    
			    <c:if test="${product.onSale.contains('1') }">
				    <c:choose>
				    <c:when test="${product.fileName.contains('&')}">
					    <c:choose>
						<c:when test="${product.fileName.contains('mp4')}">
							<img src="/images/uploadFiles/tumbnail.png" id="image">
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
			    </c:if>
			    
			    <c:if test="${product.onSale.contains('0') }">
				    <c:choose>
				    <c:when test="${product.fileName.contains('&')}">
					    <c:choose>
						<c:when test="${product.fileName.contains('mp4')}">
							<img src="/images/noimage.jpg" id="image_none">
						</c:when>
						<c:otherwise>
							<c:forEach var="name" items="${product.fileName.split('&')[0]}">
								<img src="/images/uploadFiles/${name}" id="image_none">
							</c:forEach>
						</c:otherwise>
						</c:choose>
				    </c:when>
				    <c:otherwise>
						<img src="/images/uploadFiles/${product.fileName}" class="img-responsive img-rounded" id="image_none">
					</c:otherwise>
					</c:choose>
			    </c:if>
		    
			    
			      <div class="caption">
			        <h3>${product.prodName}</h3>
			        <c:choose>
			        	<c:when test="${user.role.equals('admin') && param.menu.equals('manage')}">
			        		<p>���� ��� : ${product.prodStock}</p>
			        		<c:if test="${product.onSale.contains('0') }">
			        			<p style="color:#DB4455">�Ǹ�����</p>
			        		</c:if>
			        	</c:when>
			        	<c:otherwise>
			        		<p>${product.price} ��</p>
			        		<c:if test="${product.onSale.contains('0') }">
			        			<p style="color:#DB4455">*�Ǹ������� ��ǰ�Դϴ�.</p>
			        		</c:if>
			        	</c:otherwise>
			        </c:choose>
			        <p align="right">
			        <a class="btn btn-defualt btn"  role="button" value="${product.prodNo}" style="color:#bc8f8f">����ȸ</a>
			        
			        
			        
			        <c:if test="${param.menu.equals('manage') }">
			        <a class="btn btn-defualt btn update"  role="button" value="${product.prodNo}">�����ϱ�</a>			        
			        </c:if>
			        <c:if test="${param.menu.equals('search') }">
			        	<c:choose>
			        		<c:when test="${product.prodStock == '0' }">
			        			<a class="btn btn-defualt btn disabled" role="button" >ǰ��</a>
			        		</c:when>
			        		<c:otherwise>
			        			<c:if test="${product.onSale.contains('1') }">
			        				<a class="btn btn-default btn buy" role="button" value="${product.prodNo}">�����ϱ�</a>
			        			</c:if>
			        			<c:if test="${product.onSale.contains('0') }">
			        				<a class="btn btn-default btn disabled" role="button" value="${product.prodNo}">�����ϱ�</a>
			        			</c:if>
			        		</c:otherwise>
			        	</c:choose>			        
			        </c:if>
			        </p>
			      </div>
			    </div>
			  </div>
			
			
          </c:forEach>
          
          
          <div  id="scrollList"></div>
          
          </div>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	

	
</body>

</html>