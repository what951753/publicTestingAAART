<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-tw">
<head>
<meta charset="UTF-8">
<title>查詢訂單</title>
</head>
<body>
<%-- <form name="order" action="<c:url value='/_04_Orderlist/OrIdSearchServlet'/>" method="get" > --%>
<form name="order" action="./OrIdSearchServlet" method="get" >
<div class="container">
<P><P><P><P>
<div class="text-center">

請輸入訂單編號
<input type="text" name="orderid">
<input type="submit" value="送出查詢" name="submit" class="btn btn-outline-info" id="submit">
</form>
</body>
</div>
</div>
</html>