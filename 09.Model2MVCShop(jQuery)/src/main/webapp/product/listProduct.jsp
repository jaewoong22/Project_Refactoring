<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="EUC-KR">
	<title>ȸ�� ��� ��ȸ</title>
	
	<link rel="stylesheet" href="/css/admin.css" type="text/css">
	
	<!-- CDN(Content Delivery Network) ȣ��Ʈ ��� -->
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">


		function fncGetList(currentPage) {
			console.log(currentPage);
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/product/listProduct?&menu=${param.menu }").submit();
		}

		
		
		

		 $(function() {
			 
			 $( "td.ct_btn01:contains('�˻�')" ).on("click" , function() {
				fncGetList(1);
			});
			
			 $( "td.ct_btn01:contains('��ȸ')" ).on("click" , function() {
					fncGetList(1);
				});
			
			
			 //==================================================================================
				 
			 
			$( "td.manage" ).on("click" , function() {
				console.log('������Ʈ');
				//var message = $("input:hidden[name='productProdNo']").val();
				var message = $(this).attr("value");
				console.log(message);
					self.location ="/product/updateProduct?menu=${param.menu}&prodNo="+message;
			});
			
			$( "td.search" ).on("click" , function() {
				console.log('�����ϱ�');
				var message = $(this).attr("value");
				console.log(message);
				self.location ="/product/getProduct?menu=${param.menu}&prodNo="+message;
			});


			$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
			$( "td.manage" ).css("color" , "red");
			$( "td.search" ).css("color" , "red");
			
			//==================================================================================
			
			//==> �Ʒ��� ���� ������ ������ ??
			//==> �Ʒ��� �ּ��� �ϳ��� Ǯ�� ���� �����ϼ���.					
			$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
			//console.log ( $(".ct_list_pop:nth-child(1)" ).html() );
			//console.log ( $(".ct_list_pop:nth-child(2)" ).html() );
			//console.log ( $(".ct_list_pop:nth-child(3)" ).html() );
			//console.log ( $(".ct_list_pop:nth-child(4)" ).html() ); //==> ok
			//console.log ( $(".ct_list_pop:nth-child(5)" ).html() ); 
			//console.log ( $(".ct_list_pop:nth-child(6)" ).html() ); //==> ok
			//console.log ( $(".ct_list_pop:nth-child(7)" ).html() ); 
		});	
	</script>		
	
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

<form name="detailForm">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
					<c:choose>
						<c:when test="${ param.menu.equals('manage')}">
							��ǰ �����ȸ
						</c:when>
						<c:when test="${ param.menu.equals('search')}">
							<c:if test="${ !user.role.equals('admin')}">
							��ǰ���
							</c:if>
							<c:if test="${ user.role.equals('admin')}">
							��ǰ ����
							</c:if>
						</c:when>
					</c:choose>
					</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37">
		</td>
	</tr>
</table>



<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="right">
		
			<c:if test="${ user.role.equals('admin')}">
				<select name="searchCondition" class="ct_input_g" style="width:80px">
				 	<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option>
					<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
					<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>��ǰ����</option>
				</select>
			</c:if>
				
			<c:if test="${ !user.role.equals('admin')}">
				<input type="hidden" name="searchCondition" value="1">
			</c:if>	

			
			<input 	type="text" name="searchKeyword" value="${! empty search.searchKeyword ? search.searchKeyword : ""}"  class="ct_input_g" 
							style="width:200px; height:20px" >
		</td>
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						�˻�
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<table width="180px" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="left">
			<c:if test="${ !user.role.equals('admin')}">
				<select name="orderCondition" class="ct_input_g" style="width:100px">
				 	<option value="0"  ${ ! empty search.orderCondition && search.orderCondition==0 ? "selected" : "" }>--�����ϱ�--</option>
					<option value="1"  ${ ! empty search.orderCondition && search.orderCondition==1 ? "selected" : "" }>�������ݼ�</option>
					<option value="2"  ${ ! empty search.orderCondition && search.orderCondition==2 ? "selected" : "" }>�������ݼ�</option>
					<!-- <option value="3"  ${ ! empty search.orderCondition && search.orderCondition==3 ? "selected" : "" }>�Ǹ����� ��ǰ</option> -->
				</select>
			</c:if>
			<c:if test="${ user.role.equals('admin')}">
				<select name="orderCondition" class="ct_input_g" style="width:100px">
					<option value="0"  ${ ! empty search.orderCondition && search.orderCondition==0 ? "selected" : "" }>--�����ϱ�--</option>
					<option value="3"  ${ ! empty search.orderCondition && search.orderCondition==3 ? "selected" : "" }>�Ǹ���</option>
					<option value="4"  ${ ! empty search.orderCondition && search.orderCondition==4 ? "selected" : "" }>������</option>
				</select>
			</c:if>
			
		</td>
		<td align="left" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						��ȸ
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
				</tr>
			</table>
		</td>
		
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="11" >
			��ü   ${resultPage.totalCount } �Ǽ�,	���� ${resultPage.currentPage} ������
		</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">��ǰ��</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�������</td>
		<c:if test="${user.role.equals('admin') && param.menu.equals('manage')}">
			<td class="ct_line02"></td>
		<td class="ct_list_b">���</td>
		</c:if>	
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
 
	 <c:set var="i" value="0" />
	<c:forEach var="product" items="${list}">
		
		<c:set var="i" value="${ i+1 }" />
		<tr class="ct_list_pop">
			<td align="center">${ i }</td>		
				<td></td>
				<c:if test="${param.menu.equals('manage') }">
					<td align="left"  class="manage" value="${product.prodNo}" >${product.prodName }</td>
				</c:if>
				<c:if test="${param.menu.equals('search') }">
					<c:choose>
						<c:when test="${product.prodStock=='0' && !user.role.equals('admin')}">
							${product.prodName }
						</c:when>
						<c:otherwise>
							<td  align="left" class="search" value="${product.prodNo}">${product.prodName }</td>
						</c:otherwise>
					</c:choose>				
				</c:if>
			
			<td></td>
			<td align="left">${product.price}</td>
			<td></td>
			<td align="left">${product.regDate}
			</td>		
			<td></td>
			<c:choose>
				<c:when test="${product.prodStock!='0'}">
					<td align="center">�Ǹ��� </td>
				</c:when>
				<c:otherwise>
					<td align="center" style="color:red">������</td>
				</c:otherwise>
			</c:choose>
			<c:if test="${user.role.equals('admin') && param.menu.equals('manage')}">
			<td></td>
			<td align="center">${product.prodStock}
			</td>
			</c:if>	
		</tr>
		<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
		</tr>
	</c:forEach>
</table>

<!-- PageNavigation Start... -->
<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top:10px;">
	<tr>
		<td align="center">
		   <input type="hidden" id="currentPage" name="currentPage" value=""/>

			<jsp:include page="../common/pageNavigator.jsp"/>	
    	</td>
	</tr>
</table>
<!-- PageNavigation End... -->

</form>
</div>

</body>
</html>