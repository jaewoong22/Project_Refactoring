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
body>div.container{
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
	border-radius: 5px;
} 

#image_none {
	width: 250px;
	height:250px;
	filter: blur(2px);
	border-radius: 5px;
}   
    
div.thumbnail {
	height:400px;
	border-radius: 5px;
}
       
div.floatbar{
	position : fixed;
    left: 50%;
    top: 0;
}

div.bar{
    position: absolute;
    right: -910px;
    top: 250px;
    width: 120px;
    height: 300px;
    background-color: #bc8f8f;
}



</style>
	<script type="text/javascript">

	
	
		function fncGetList(currentPage) {
			console.log(currentPage);
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/store/listStore?&menu=${param.menu }").submit();
		}

		/*
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
				 console.log('����ȸ');
				 self.location = "/product/getProduct?prodNo="+prodNo+"&menu="+menu
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
			 
			 
			 var menu = $("#menu").val();
			 console.log(menu);
			 
			 
			 $(document).on('click', 'a.btn-defualt', function(){
				 
				 var prodNo =$(this).attr("value");
				 console.log('����ȸ');
				 self.location = "/product/getProduct?prodNo="+prodNo+"&menu="+menu
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
		 //*/
		
	</script>		
</head>
<title>Home Deco</title>
<body>
	
	
	<!-- ToolBar Start /////////////////////////////////////-->
		<%--<jsp:include page="/layout/toolbar2.jsp" /> --%>
		<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info text-left">
	       <h3  style="color:#bc8f8f">STORE</h3>
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
				  <input type="hidden" id="menu" name = "menu" value="${param.menu }"/>
				  
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
		  <c:forEach var="store" items="${list}">
			
			  <div class="col-sm-6 col-md-3">
			    <div class="thumbnail">
			    
				    
			      <div class="caption">
			        <h3>${store.title}</h3>
			        
			        <p>��ȣ: ${store.storeNo}</p>
			        
			        <p align="right">
			        <a class="btn btn-defualt btn"  role="button" value="${store.storeNo}" style="color:#bc8f8f">����ȸ</a>
			        
			        <c:if test="${param.menu.equals('manage') }">
			        	<a class="btn btn-defualt btn update"  role="button" value="${store.storeNo}">�����ϱ�</a>			        
			        </c:if>
			        <c:if test="${param.menu.equals('search') }">
			        	<a class="btn btn-defualt btn disabled" role="button" >ǰ��</a>	        
			        </c:if>
			        </p>
			        
			      </div>
			    </div>
			  </div>
			
			
			
          </c:forEach>
          
          
          <div  id="scrollList"></div>
          
      </div>
	  <!--  table End /////////////////////////////////////-->
	  
	  
	  <div class="floatbar">
	  	<div class="bar">
	  	<jsp:include page="/history.jsp" />
	  	</div>
	  </div>
	  
	  
	  
	  
	  
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>

</html>