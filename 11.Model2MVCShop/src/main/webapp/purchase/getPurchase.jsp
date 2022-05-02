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
body{
	padding-top : 50px;
	font-family: 'Nanum Myeongjo', serif;
	font-family: 'Open Sans', sans-serif;
}
</style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		//==> �߰��Ⱥκ� : "����" "Ȯ��"  Event ���� �� ó��
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
			 $( "button.btn.btn-default" ).on("click" , function() {
				 self.location = "/purchase/listPurchase"
			});
			
			 $( "#update" ).on("click" , function() {
					self.location = "/purchase/updatePurchase?tranNo=${purchase.tranNo}"
					
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
	       <h3 class=" text-info" style="color:#bc8f8f">��ǰ����ȸ</h3>
	    </div>
	
		<div class="row">
		<div class="col-xs-12 col-md-12" align="center">
		
		<c:choose>
		
		<c:when test="${purchase.purchaseProd.fileName.contains('&')}">
		
			<td class="ct_write01">
				<c:choose>
				<c:when test="${purchase.purchaseProd.fileName.contains('mp4')}">
					<c:forEach var="name" items="${purchase.purchaseProd.fileName.split('&')}">
						<video width="400" height="300" controls autoplay src="/images/uploadFiles/${name}" type="video/mp4"></video>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<c:forEach var="name" items="${purchase.purchaseProd.fileName.split('&')}">
						<img src="/images/uploadFiles/${name}" width="300" height="300" align="absmiddle"/>
					</c:forEach>
				</c:otherwise>
				</c:choose>		
		
			</td>
		
		</c:when>
		
		<c:otherwise>
			<img src="/images/uploadFiles/${purchase.purchaseProd.fileName}" width="300" height="300" align="absmiddle"/>
		</c:otherwise>
		</c:choose>

		</div>
		</div>

		<hr/>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>��ǰ��ȣ</strong></div>
			<div class="col-xs-8 col-md-8">${purchase.purchaseProd.prodNo }</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>���ż���</strong></div>
			<div class="col-xs-8 col-md-8">${purchase.buyNum }</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>�����ھ��̵�</strong></div>
			<div class="col-xs-8 col-md-8">${purchase.buyer.userId}</div>
		</div>
		
		<hr/>
		
		
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>���Ź��</strong></div>
	  		<c:if test="${purchase.paymentOption.contains('1')}">
	  			<div class="col-xs-8 col-md-8">���ݱ���</div>
	  		</c:if>
	  		<c:if test="${purchase.paymentOption.contains('2')}">
	  			<div class="col-xs-8 col-md-8">�ſ뱸��</div>
	  		</c:if>
		</div>
		
		<hr/>
			
		
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>�������̸�</strong></div>
			<div class="col-xs-8 col-md-8">${purchase.receiverName }</div>
		</div>
		
		<hr/>
		
		
		
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>�����ڿ���ó</strong></div>
			<div class="col-xs-8 col-md-8">${purchase.receiverPhone }</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>�������ּ�</strong></div>
			<div class="col-xs-8 col-md-8">${purchase.divyAddr }</div>
		</div>
		
		<hr/>
		
		
		
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>���ſ�û����</strong></div>
			<div class="col-xs-8 col-md-8">${purchase.divyRequest }</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>��������</strong></div>
			<div class="col-xs-8 col-md-8">${purchase.divyDate }</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>�ֹ���</strong></div>
			<div class="col-xs-8 col-md-8">${purchase.orderDate }</div>
		</div>
		
		
		
		
		<div class="row">
	  		<div class="col-md-12 text-right ">
	  		
	  			<button type="button" class="btn btn-default" id="check">Ȯ��</button>
	  		<c:if test="${purchase.tranCode.equals('001') }">	
	  			<button type="button" class="btn btn-primary" id="update">����</button>
	  		</c:if>
		</div>
		
		<br/>
		
 	</div>
 	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->

</body>
</html>