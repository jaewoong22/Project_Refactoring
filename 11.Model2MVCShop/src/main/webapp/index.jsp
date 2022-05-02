<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

	
	
<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- ///////////////////////////// �α��ν� Forward  /////////////////////////////////////// -->
 <c:if test="${ ! empty user }">
 	<jsp:forward page="main.jsp"/>
 </c:if>
 <!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
 <!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&family=Open+Sans:ital,wght@0,300;1,300&display=swap" rel="stylesheet">

<style>
body>div.container{
	font-family: 'Nanum Myeongjo', serif;
}

</style>
   	
   	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		//============= ȸ�������� ȭ���̵� =============
		$( function() {
			//==> �߰��Ⱥκ� : "addUser"  Event ����
			$("a[href='#' ]:contains('JOIN')").on("click" , function() {
				self.location = "/user/addUser"
			});
		});
		
		//============= �α��� ȭ���̵� =============
		$( function() {
			//==> �߰��Ⱥκ� : "addUser"  Event ����
			$("a[href='#' ]:contains('LOGIN')").on("click" , function() {
				self.location = "/user/login"
			});
			$("a[href='#' ]:contains(' LOGIN')").on("click" , function() {
				self.location = "/user/login"
			});
		});
		
	</script>	
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
		
        <div class="container">
        
        	<a class="navbar-brand" href="#">Home Deco</a>
        	
        	<ul class="nav navbar-nav">
        	<li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >��ǰ����</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li><a href="#">��ǰ�˻�</a></li>
	                         <li class="divider"></li>
	                         <li><a href="#">�ֱ� �� ��ǰ</a></li>
	                     </ul>
	                 </li>
			</ul>
			<!-- toolBar Button Start //////////////////////// -->
			<div class="navbar-header">
			    <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#target">
			        <span class="sr-only">Toggle navigation</span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			    </button>
			</div>
			<!-- toolBar Button End //////////////////////// -->
			
			<div class="collapse navbar-collapse"  id="target">
	             <ul class="nav navbar-nav navbar-right">
	                 <li><a href="#"><span class="glyphicon glyphicon-log-in" aria-hidden="true"/> LOGIN</a></li>
	                 <li><a href="#" class="disabled">|</a></li>
	                 <li><a href="#">JOIN</a></li>
	           	</ul>
	       </div>
   		
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->
   	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
<div class="container">
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
        <li data-target="#myCarousel" data-slide-to="3"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <div class="item active">
          <img class="first-slide" src="/images/homedeco/main04.jpg"  alt="First slide">
          <div class="container">
            <div class="carousel-caption">
              <h2 align="left">�� �� �ȿ�<br/>���� ������</h2>
              <h4 align="left">LAMP</h4>
            </div>
          </div>
        </div>
        <div class="item">
          <img class="second-slide" src="/images/homedeco/main08.jpg" alt="Second slide">
          <div class="container">
            <div class="carousel-caption">
              <h2 align="left" style="color:black;">����ϰ�<br/>�ǿ�����<br/>����</h2>
              <h4 align="left" style="color:black;">RITTEN</h4>
            </div>
          </div>
        </div>
        <div class="item">
          <img class="third-slide" src="/images/homedeco/main09.jpg" alt="Third slide">
          <div class="container">
            <div class="carousel-caption">
             <h2 align="left" style="color:black;">��ä��<br/>Ȯ��� �帧</h2>
              <h4 align="left" style="color:black;">POTTERY</h4>
            </div>
          </div>
        </div>
        <div class="item">
          <img class="fourth-slide" src="/images/homedeco/main11.jpg" alt="fourth slide">
          <div class="container">
            <div class="carousel-caption">
              <h2 align="left" style="color:black;">��ġ ����� ����<br/>�����̾� Ȩ�ɾ�</h2>
              <h4 align="left" style="color:black;">DIFUSER</h4>
            </div>
          </div>
        </div>
        
        
        
      </div>
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div><!-- /.carousel -->
</div>
</body>

</html>