<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
<meta charset="UTF-8">
	
<title>Insert title here</title>
</head>
<body>
 
īī������ ������ ���������� �Ϸ�Ǿ����ϴ�.
 
�����Ͻ�:     ${info.approved_at}<br/>
�ֹ���ȣ:    ${info.partner_order_id}<br/>
��ǰ��:    ${info.item_name}<br/>
��ǰ����:    ${info.quantity}<br/>
�����ݾ�:    ${info.amount.total}<br/>
�������:    ${info.payment_method_type}<br/>
 
 
 
<h2>${info}</h2>
 
</body>
</html>

