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

<!--  ///////////////////////// SummerNote ////////////////////////// -->
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
  <script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>


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
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$( ".btn:contains('��')" ).on("click" , function() {
			$("form").attr("method" , "POST").attr("action" , "/store/addProduct").submit();
		});
		
		$( ".btn:contains('��')" ).on("click" , function() {
			history.go(-1);
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
	       <h3 class=" text-info"  style="color:#bc8f8f">��ǰ����</h3>
	    </div>
	
	
		<form class="form-horizontal">
		
	 	<div id="addbrdview" class="form-group">
		    <label for="boardTitle" class="col-sm-offset-1 col-sm-1 control-label"></label>
		    <div class="col-sm-12">
		      <input type="text" class="form-control" id="boardTitle" name="title" placeholder="������ �Է����ּ���.">
		    </div>
		</div>
		
	 	<div class="form-group">
		    <label for="boardContent" height=100px class="col-sm-offset-1 col-sm-1 control-label"></label>
		    <div class="col-sm-12" height=100px>
		      <textarea id="summernote" class="form-control col-sm-5" rows="5" name="content"
						placeholder="����" style="resize: none"></textarea>
		    </div>
		</div>
		
		<input type="hidden" id="user" value="${user.userId }"/>
		
		</form>
		
		
		    <div class="text-right">
		      &nbsp;&nbsp;<button type="button" class="btn btn-warning"  >�� &nbsp;��</button>
			  &nbsp;<a class="btn btn-default" href="#" role="button">��&nbsp;��</a>
		 	</div>
		
		<br>
		
  <div id="summernote"></div>
		
</div>
 	
 	 <script>
  
    $(document).ready(function() {
    	
    	var user = $('#user').val();
    	console.log(user);
    	
    	 $('#summernote').summernote({
    	        placeholder: '������ �Է����ּ���.',
    	        tabsize: 2,
    	        height: 500,
    	        lang : 'ko-KR',
    	        maximumImageFileSize : 20 * 1024 * 1024,
    	  	  // �����Ϳ� Ŀ�� �̵� (inputâ�� autofocus��� �����Ͻø� �˴ϴ�.)
    	  	  focus : true,
    	  	  ///*
    	  	  toolbar: [
    	  		    // �۲� ����
    	  		    ['fontname', ['fontname']],
    	  		    // ���� ũ�� ����
    	  		    ['fontsize', ['fontsize']],
    	  		    // ����, ����Ӳ�, ����,��� ��, ���������
    	  		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
    	  		    // ���ڻ�
    	  		    ['color', ['forecolor','color']],
    	  		    // ǥ�����
    	  		    ['table', ['table']],
    	  		    // �۸Ӹ� ��ȣ, ��ȣ�ű��, ��������
    	  		    ['para', ['ul', 'ol', 'paragraph']],
    	  		    // �ٰ���
    	  		    ['height', ['height']],
    	  		    // �׸�÷��, ��ũ�����, ������÷��
    	  		    ['insert',['picture','link','video']],
    	  		    // �ڵ庸��, Ȯ���ؼ�����, ����
    	  		    ['view', ['codeview','fullscreen', 'help']]
    	  		  ],
    	  		  // �߰��� �۲�
    	  		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','���� ���','�ü�','����ü','����','����ü','����ü'],
    	  		 // �߰��� ��Ʈ������
    	  		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
    	  		//*/
    	  		callbacks: {	//�̹��� ÷���ϴ� �κ�
    	               onImageUpload : function(files) {
    	                    uploadSummernoteImageFile(files[0],this);
    	                },
    	                onPaste: function (e) {
    						var clipboardData = e.originalEvent.clipboardData;
    						if (clipboardData && clipboardData.items && clipboardData.items.length) {
    							var item = clipboardData.items[0];
    							if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
    								e.preventDefault();
    							}
    						}
    					}
    	  	  
    	            }
    	  	  
           });
    });	 
    
    function uploadSummernoteImageFile(file, editor) {
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST",
			url : "/store/uploadSummernoteImageFile",
			contentType : false,
			processData : false,
			success : function(data) {
				console.log('��ӳ�Ʈ');
				console.log(data.url);
            	//�׻� ���ε�� ������ url�� �־�� �Ѵ�.
				$(editor).summernote('insertImage', data.url);
			}
		});
	}
      
    	 </script>

</body>
</html>