<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
<title>Main Page</title>


</head>

<body>
	<img src="/images/white.png"><br/>
	<h1 align="center" style="color:#696969">Model2 MVC Shop</h1><br/>
	<c:if test="${ ! empty user }">
	<h3 align="center"><span style="color:#bc8f8f">${user.userName }</span> <span style="color:#696969">님 환영합니다.</span></h3>
	</c:if>
	
</body>
</html>
