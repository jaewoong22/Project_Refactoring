<%@ page contentType="text/html; charset=EUC-KR" %>

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
		for (int i = 0; i < cookies.length; i++) {
			Cookie cookie = cookies[i];
			
			if (cookie.getName().equals("history")) { 
				history = cookie.getValue();
			}
			
			
			
			
			
		}
		if (history != null ) {
			String[] h = history.split("/");
			for (int i = 0; i < h.length; i++) {
				if (!h[i].equals("null")) {
					String[] t = h[i].split("&");
					%>
						<a href="/product/getProduct?prodNo=<%=t[0]%>&menu=search"	target="rightFrame"><img src="/images/uploadFiles/<%=t[1] %>" width="100" height="100" align="absmiddle"/></a>
					<br> 
					
<%
				
				}
			}
		}
	}
%>

</body>
</html>