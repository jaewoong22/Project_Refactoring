<%@ page contentType="text/html; charset=euc-kr" %>
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
 <!-- //////////////////////////////////�����ϱ�////////////////////////////// -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script> 
 
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
///*
	Kakao.init('44e9a817fd963e4dff5a1f8cf9c9e807');

	  // SDK �ʱ�ȭ ���θ� �Ǵ��մϴ�.
	  console.log(Kakao.isInitialized());

	  
	  function kakaoShare() {
		  
		  var image = $("input:hidden[name='image']").val();
		  console.log(image);
		  var name = $("input:hidden[name='prodName']").val();
		  console.log(name);
		  var detail = $("input:hidden[name='detail']").val();
		  console.log(detail);
		  var prodNo = $("input:hidden[name='prodNo']").val();
		  console.log(prodNo);
		  
	    Kakao.Link.sendDefault({
	      objectType: 'feed',
	      content: {
	        title: name,
	        description: detail,
	        imageUrl: 'http://192.168.0.65:8080/images/uploadFiles/'+image ,
	        link: {
	          mobileWebUrl: 'http://192.168.0.65:8080/product/getProduct?prodNo='+prodNo,
	          webUrl: 'http://192.168.0.65:8080/product/getProduct?prodNo='+prodNo,
	        },
	      },
	      buttons: [
	        {
	          title: '������ ����',
	          link: {
	            mobileWebUrl: 'http://192.168.0.65:8080/product/getProduct?prodNo='+prodNo,
	            webUrl: 'http://192.168.0.65:8080/product/getProduct?prodNo='+prodNo,
	          },
	        },
	      ],
	      // īī���� �̼�ġ �� īī���� ��ġ ����̵�
	      installTalk: true,
	    })
	  }
//*/	
	//=====================�����ϱ�====================================
	
	
	
	$(function() {	
		
		
		 $( "#check" ).on("click" , function() {
			 self.location = "/product/listProduct?menu=manage"
		});
		 
		 $( "#cancel" ).on("click" , function() {
			 self.location = "/product/listProduct?menu=search"
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
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header">
			<c:if test="${empty param.menu }">
	       <h3 class=" text-info"  style="color:#bc8f8f">��ǰ����ȸ</h3>
	       </c:if>
	       <c:if test="${!empty param.menu }">
	       	<h3 class=" text-info" style="color:#bc8f8f">��ǰ�����ϱ�</h3>
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
						<video width="400" height="300" controls autoplay src="/images/uploadFiles/${name}" type="video/mp4"  value="${name}"></video>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<c:forEach var="name" items="${product.fileName.split('&')}">
						<img src="/images/uploadFiles/${name}" width="300" height="300" align="absmiddle"/>
						<input type="hidden" name="image" value="${name }"/>
					</c:forEach>
				</c:otherwise>
				</c:choose>		
		
			</td>
		
		</c:when>
		
		<c:otherwise>
			<img src="/images/uploadFiles/${product.fileName}" width="300" height="300" align="absmiddle" class="image" value="${fileName}"/>
		</c:otherwise>
		</c:choose>

		</div>
		</div>


	
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>��ǰ��ȣ</strong></div>
			<div class="col-xs-8 col-md-8">${product.prodNo}</div>
			<input type="hidden" name="prodNo" value="${product.prodNo }"/>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>��ǰ��</strong></div>
			<div class="col-xs-8 col-md-8">${product.prodName}</div>
			<input type="hidden" name="prodName" value="${product.prodName}"/>
		</div>
		
		<hr/>
		
		
		<c:if test="${ user.role.equals('admin')}">
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>���</strong></div>
			<div class="col-xs-8 col-md-8">${product.prodStock }</div>
		</div>
		
		<hr/>
		</c:if>
			
		
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>��ǰ������</strong></div>
			<div class="col-xs-8 col-md-8">${product.prodDetail }</div>
			<input type="hidden" name="detail" value="${product.prodDetail }"/>
		</div>
		
		<hr/>
		
		
		
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>����</strong></div>
			<div class="col-xs-8 col-md-8">${product.price }</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>��������</strong></div>
			<div class="col-xs-8 col-md-8">${product.manuDate }</div>
		</div>
		
		<hr/>
	
		
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>�������</strong></div>
			<div class="col-xs-8 col-md-8">${product.regDate }</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>�����ϱ�</strong></div>
			<div class="col-xs-8 col-md-8">
				<a id="kakao-link-btn" href="javascript:kakaoShare()">
			    	<img src="https://developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png" width="30" height="30"/>
			    </a>
			</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-12 text-right ">
	  			<c:if test="${empty param.menu }">
	  			<button type="button" class="btn btn-default" id="check">Ȯ��</button>
	  			</c:if>
	  			<c:if test="${!empty param.menu }">
	  				<button type="button" class="btn btn-default" id="cancel">���</button>
	  				<button type="button" class="btn btn-primary" id="buy" value1="${product.prodNo }" value2="${param.menu }">����</button>
	  			</c:if>
	  		</div>
		</div>
		
		<br/>
		
 	</div>
 	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->

</body>
</html>