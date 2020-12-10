<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form:form action="updateFormDone.ctrl" method="post" modelAttribute="ap" enctype="multipart/form-data">
		<table>
			<tr>
			<td colspan="2">
			<img src="${pageContext.servletContext.contextPath}/14/getBlobImage/${ap.productId}.ctrl" 
			class="card-img-top" alt="..." width="50" height="200">
			</td>
			</tr>
		
			<tr>
<%-- 				<td><form:label path="productId">商品貨號:</form:label></td> --%>
				<td colspan="2"><form:input type="hidden" path="productId" value="${ap.productId}"/></td>
			</tr>
			<tr>
				<td><form:label path="productTitle">商品標題:</form:label></td>
				<td><form:input path="productTitle" value="${ap.productTitle}"/></td>
			</tr>
			<tr>
				<td><form:label path="productType">商品類型:</form:label></td>
				<td><form:input path="productType" value="${ap.productType}" /></td>
			</tr>
			<tr>
				<td><form:label path="productPrice">商品價格:</form:label></td>
				<td><form:input path="productPrice" value="${ap.productPrice}"  /></td>
			</tr>
			<tr>
				<td><form:label path="productNum">商品數量:</form:label></td>
				<td><form:input type="number" path="productNum" value="${ap.productNum}"/></td>
			</tr>
			
			<tr>
			<td><form:label path="file">商品圖片:</form:label></td>
			<td><form:input path="file" type="file" /><td>
			</tr>
			
			<tr>
			<td><form:label path="productDes">商品描述:</form:label></td>
			<td><form:textarea path="productDes" value="${ap.productDes}" /><td>
			</tr>
			<tr>
				<td colspan="2"><form:button value="Send">送出更新</form:button></td>
			</tr>
			
		</table>
	</form:form>
</body>
</html>