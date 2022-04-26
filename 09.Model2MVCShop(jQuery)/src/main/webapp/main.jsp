<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
<title>Main Page</title>


</head>

<body>
	<h1 align="center">Model2 MVC Shop</h1><br/>
	<c:if test="${ ! empty user }">
	<h3 align="center"><u>${user.userName }</u> 님 환영합니다.</h3>
	</c:if>
	
</body>
</html>
