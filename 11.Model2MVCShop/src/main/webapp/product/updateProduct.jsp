<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="ko">
<head>
<meta charset="EUC-KR">

<link rel="stylesheet" href="/css/admin.css" type="text/css">


<link rel="stylesheet"
	href="resources/css/plugin/datepicker/bootstrap-datepicker.css">


<script src="resources/js/plugin/datepicker/bootstrap-datepicker.js"></script>
<script
	src="resources/js/plugin/datepicker/bootstrap-datepicker.ko.min.js"></script>

<link rel="stylesheet"
	href="resources/css/plugin/datepicker/bootstrap-datepicker.css">



<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>


<!-- jQuery UI toolTip ???? CSS-->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- jQuery UI toolTip ???? JS-->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 <!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&family=Open+Sans:ital,wght@0,300;1,300&display=swap" rel="stylesheet">

<style>
body{
	font-family: 'Nanum Myeongjo', serif;
}
body>div.container {
	border: 3px solid #D6CDB7;
	margin-top: 150px;
	font-family: 'Nanum Myeongjo', serif;
}
h1.text-center {
	font-family: 'Nanum Myeongjo', serif;
}
#prodDetail {
	font-family: 'Nanum Myeongjo', serif;
}
div.form-group{
	font-family: 'Nanum Myeongjo', serif;
}
</style>
</style>

<script type="text/javascript">
	function fncUpdateProduct() {
		//Form ??ȿ?? ????
		var name = $("input[name='prodName']").val();
		var detail = $("input[name='prodDetail']").val();
		var manuDate = $("input[name='manuDate']").val();
		var price = $("input[name='prodName']").val();

		if (name == null || name.length < 1) {
			alert("??ǰ???? ?ݵ??? ?Է??Ͽ??? ?մϴ?.");
			return;
		}
		if (detail == null || detail.length < 1) {
			alert("??ǰ?????????? ?ݵ??? ?Է??Ͽ??? ?մϴ?.");
			return;
		}
		if (manuDate == null || manuDate.length < 1) {
			alert("???????ڴ? ?ݵ??? ?Է??ϼž? ?մϴ?.");
			return;
		}
		if (price == null || price.length < 1) {
			alert("?????? ?ݵ??? ?Է??ϼž? ?մϴ?.");
			return;
		}

		$("form").attr("method", "POST").attr("enctype","multipart/form-data").attr("action", "/product/updateProduct").submit();
		//document.detailForm.action='/product/addProduct';
		//document.detailForm.submit();
	}

	$(function() {
		$('#manuDate').datepicker({
			format : "yyyy-mm-dd"

		});

	});

	$(function() {
		$("button.btn.btn-primary").on("click", function() {
			alert($("button.btn.btn-primary").text());
			fncUpdateProduct();
		})
	})

	$(function() {
		$("button.btn-default").on("click", function() {
			// resetData();
			var prodNo = $("#prodNo").val();
			self.location = "/product/getProduct?prodNo="+prodNo
		})
	})

	//function resetData(){
	//	document.detailForm.reset();
	//}
</script>
</head>

<body>

	<jsp:include page="/layout/toolbar.jsp" />


	<div class="container">

		<h1 class="bg-default text-center" style="color:#bc8f8f">??ǰ????????</h1>

		<form class="form-horizontal" enctype="multipart/form-data">
		
			<input type="hidden" id="prodNo" name="prodNo" value="${product.prodNo }">
			
			<div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">??ǰ??</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodName" name="prodName" value="${product.prodName }">
		    </div>
		  </div>

			<div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">??ǰ????????</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodDetail" name="prodDetail" value="${product.prodDetail }">
		    </div>
		  </div>

			<div class="form-group">
			    <label for="prodStock" class="col-sm-offset-1 col-sm-3 control-label">??ǰ??????</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="prodStock" name="prodStock" value="${product.prodStock }">
			    </div>
			  </div>

			<div class="form-group">
				<label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">????????</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="manuDate" name="manuDate" value="${product.manuDate }">
				</div>
			</div>

			<div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">????</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="price" name="price" value="${product.price }">
		    </div>
		  </div>
		  
		  

			<div class="form-group">
		    <label for="fileName" class="col-sm-offset-1 col-sm-3 control-label">??ǰ?̹???</label>
		    <div class="col-sm-4">
		    	<c:choose>
		    	<c:when test="${product.fileName.contains('&')}">
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
				</c:when>
				<c:otherwise>
					<img src="/images/uploadFiles/${product.fileName}" width="300" height="300" align="absmiddle" class="image" value="${fileName}"/>
				</c:otherwise>
		    	</c:choose>
		    	
		      <input type="file" id="fileName" name="uploadfiles[]" multiple="multiple" >
		    </div>
		  </div>
		  
		  <hr/>
		  
		  <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">?Ǹſ???</label>
		    <div class="col-sm-4">
		       <div class="btn-group" data-toggle="buttons">
				    <input type="radio" name="onSale" id="option1" value="1" checked> ?Ǹ???
				    <input type="radio" name="onSale" id="option2" value="0"> ?Ǹ?????
				</div>
		    </div>
		  </div>
		  
		  <hr/>
		  
			<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >????</button>
			  <button type="button" class="btn btn-default" href="#" >????</button>
		    </div>
		  </div>

		</form>


	</div>


</body>
</html>
