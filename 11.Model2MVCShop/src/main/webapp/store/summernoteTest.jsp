<%@ page language="java" contentType="text/html; charset=EUC_KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<html lang='ko'>

<head>

    	<title>Summer Note</title>
    <meta charset="EUC_KR">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
		
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="/css/style.css">
	
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
  
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
  <script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>

  
</head>

<script type="text/javascript">
//============= "����"  Event ���� =============
$(function() {
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$( ".btn:contains('��')" ).on("click" , function() {
		$("form").attr("method" , "POST").attr("action" , "/store/addProduct").submit();
	});
});	

</script>
<style>
@font-face {
    font-family: 'ChosunGu';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/ChosunGu.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
body{
font-family: ChosunGu;
}
</style>
 <body>
 
 
 
 <div class="wrapper d-flex align-items-stretch" style="background-color:#ECECEC; width:100%;">
 
       <!-- Page Content  -->
       <div id="content" class="p-4 p-md-5">
	      <div class="container-fluid">
	         <!-- ��� ����  -->
	        
				<!-- �Խ��� ��� �ڽ� �κ�-->
				<div style="background-color:white; border:3px solid white; border-radius:10px; position:relative; 
					 padding-top: 30px; padding-right: 30px; padding-left: 30px; padding-bottom: 30px;">
				  <!-- �Խ��� title -->
				  <div class="row" id="titlef">
					  <h3>&nbsp;&nbsp;&nbsp;&nbsp;��ǰ���</h3>
	 			  </div><br>
  
	
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
		
		</form>
		
		
				
		<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      &nbsp;&nbsp;<button type="button" class="btn btn-primary"  >�� &nbsp;��</button>
			  &nbsp;<a class="btn btn-primary" href="#" onClick="history.back()" role="button">��&nbsp;��</a>
		 	</div>
		</div><br>
		
  <div id="summernote"></div>
  </div>
  	
  </div>
  </div>
  <script>
  
    $(document).ready(function() {
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