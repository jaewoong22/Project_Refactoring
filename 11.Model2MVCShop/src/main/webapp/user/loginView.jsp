<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
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

    	 body >  div.container{ 
            margin-top: 100px;
            font-family: 'Nanum Myeongjo', serif;
        }
    </style>
    
    <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

		//============= "로그인"  Event 연결 =============
		$( function() {
			
			$("#userId").focus();
			
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("button").on("click" , function() {
				var id=$("input:text").val();
				var pw=$("input:password").val();
				
				if(id == null || id.length <1) {
					alert('ID 를 입력하지 않으셨습니다.');
					$("#userId").focus();
					return;
				}
				
				if(pw == null || pw.length <1) {
					alert('패스워드를 입력하지 않으셨습니다.');
					$("#password").focus();
					return;
				}
				
				$("form").attr("method","POST").attr("action","/user/login").attr("target","_parent").submit();
			});
		});	
		
		
		//============= 회원원가입화면이동 =============
		$( function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				self.location = "/user/addUser"
			});
		});
		
	</script>		
	

	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
	/*
		Kakao.init('44e9a817fd963e4dff5a1f8cf9c9e807'); //발급받은 키 중 javascript키를 사용해준다.
		console.log(Kakao.isInitialized()); // sdk초기화여부판단
		//카카오로그인
		function kakaoLogin() {
		    Kakao.Auth.login({
		      scope: 'account_email',
		      success: function (response) {
		        Kakao.API.request({
		          url: '/v2/user/me',
		          success: function (response) {
		        	  console.log(response);
		        	  const email = response.kakao_account.email;
		        	  console.log(email);
		        	  
		        	  
		        	  
		        	  $("#kakaoemail").val(email);
		        	  var check = $("#kakaoemail").val();
		        	  console.log(check);
		        	  
		        	  $("form[name='kakaoform']").attr("method","POST").attr("action","/user/kakaologin").submit;
		        	  
		        	  
		        	  
		          },
		          fail: function (error) {
		            console.log(error)
		          },
		        })
		      },
		      fail: function (error) {
		        console.log(error)
		      },
		    })
		  }
		*/
</script>	
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/index.jsp">Home Deco</a>
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->	
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
		<!--  row Start /////////////////////////////////////-->
		
		
			<div class="col-md-5" style="float: none; margin: 0 auto;">
			
					<img src="/images/homedeco/login.jpg"  width="100%" /><hr/>
			
			        <form class="form-horizontal">
		  
					  <div class="form-group">
						 <div class="input-group">
						  <span class="input-group-addon" id="basic-addon1">&nbsp;ID&nbsp;</span>
						  <input type="text" class="form-control" name="userId" id="userId"  placeholder="Id" >
						</div>
					  </div>
					  
					  <div class="form-group">
					  	<div class="input-group">
						  <span class="input-group-addon" id="basic-addon1">PW</span>
						  <input type="password" class="form-control" name="password" id="password" placeholder="Password" >
						</div>
					  </div>
					  
					  <div class="form-group">
					    <div class="text-center">
					      <button type="button" class="btn btn-default btn-sm btn-block"  >Login</button>
					      <a class="btn btn-default btn-sm btn-block" href="#" role="button">Join</a>
					      </div>
					      
					  </div>
					  
					  <%--
					   <div class="form-group" id="kakaologin">
					    <div class="text-center">
					      
					      <img src="/images/kakao_login_medium_narrow.png" onclick="kakaoLogin();" />
					     </div>
					  </div>
					  
					   --%>
			
					</form>
			   	 </div>
			<%-- 
			<form name="kakaoform" class="kakaoform">
				<input type="hidden" name="kakaoemail" id="kakaoemail" value=""/>
			</form>
			--%>
  	 	
  	 	<!--  row Start /////////////////////////////////////-->
  	 	
 	</div>
 	<!--  화면구성 div end /////////////////////////////////////-->

</body>

</html>