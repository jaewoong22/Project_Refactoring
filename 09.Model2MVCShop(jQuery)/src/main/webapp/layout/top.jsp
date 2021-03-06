<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="EUC-KR">
	
	<title>Model2 MVC Shop</title>
	
	<link href="/css/left.css" rel="stylesheet" type="text/css">
	
	<!-- CDN(Content Delivery Network) 호스트 사용 -->
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
	
		//==> jQuery 적용 추가된 부분
		 $(function() {
			 
			//==> login Event 연결처리부분
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$( "td.log:contains('login')" ).on("click" , function() {
				//Debug..
				//alert(  $( "td[width='115']:contains('login')" ).html() );
				$(window.parent.frames["rightFrame"].document.location).attr("href","/user/login");
			});
			
			
			//==> login Event 연결처리부분
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$( "td.log:contains('logout')" ).on("click" , function() {
				//Debug..
				//alert(  $( "td[width='56']:contains('logout')" ).html() );
				$(window.parent.document.location).attr("href","/user/logout");
			}); 
		});	
		 
	</script>		
	
</head>

<body topmargin="0" leftmargin="0">
 
<table width="100%" height="50" border="0" cellpadding="0" cellspacing="0">
  <tr>
	<td height="10"></td>
	<td height="10" >&nbsp;</td>
  </tr>
  <tr>
    <td width="90%" height="30"><h2><a href="../main.jsp" target="rightFrame" style="text-decoration-line : none; color:black">&nbsp;Model2 MVC Shop </a></h2></td>
  </tr>
  <tr>
    <td height="20" align="right" background="/images/img_bg.gif" colspan="1">
	    <table align="right" width="200" border="0" cellspacing="0" cellpadding="0">
	        <tr> 
	          <td width="150" align="right" class="log">
		          <c:if test="${ empty user }">
		              login
		           </c:if>
		          <c:if test="${ ! empty user }">
		          	<c:choose>
			          	<c:when test="${user.role.equals('admin') }">
			          	<b>관리자</b> 님 | logout
			          	</c:when>
		          		<c:otherwise>
		          		<b> ${user.userName }</b> 님 | logout
		          		 </c:otherwise>
		          	</c:choose>
		           </c:if>
	          </td>
	        </tr>
	      </table>
      </td>
    <td height="20" background="/images/img_bg.gif">&nbsp;</td>
  </tr>
</table>

</body>

</html>