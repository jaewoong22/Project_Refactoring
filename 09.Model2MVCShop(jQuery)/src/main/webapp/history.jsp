<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>��� ��ǰ ����</title>
</head>

<body align="center">
	�ֱ� �� ��ǰ���
<br><hr>
<br>
<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");
	
	String history = null;
	
	Cookie[] cookies = request.getCookies();
	
	if (cookies!=null && cookies.length > 0) {
		System.out.println("����");
		for (int i = 0; i < cookies.length; i++) {
			Cookie cookie = cookies[i];
			System.out.println("��Ű�̸�"+cookie.getName());
			if (cookie.getName().equals("history")) { 
				System.out.println("����2");
				history = cookie.getValue();
				System.out.println(history);
			}
		}
		
		System.out.println(history);
		
		if (history != null ) {
			String[] h = history.split("/");
			for (int i = 0; i < h.length; i++) {
				if (!h[i].equals("null")) {
					String[] t = h[i].split("&");
					%>
						<%= t[2] %><br/>
						<a href="/product/getProduct?prodNo=<%=t[0]%>&menu=search"	target="rightFrame" >
						<img src="/images/uploadFiles/<%=t[1] %>" width="100" height="100" align="absmiddle"/>
						</a>
					<br> 
					
<%
				
				}
			}
		}
	}
%>
</body>
</html>