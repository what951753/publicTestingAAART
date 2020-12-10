<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">
<head>
<script>
$(document).ready( function () {
    $('#table_id').DataTable();
} );
</script>
</head>
<div>
	<span> 
		<a href="GoCreate.ctrl">新增</a>&nbsp;&nbsp; 
		<a href="GoDel.ctrl">刪除</a>&nbsp;&nbsp;
		<a href="GoSearch.ctrl">查詢</a>&nbsp;&nbsp; 
		<a href="myStreetArtistPage.ctrl">總覽</a>
	</span>
</div>
<h1 align="center">查詢結果</h1>
<table id="table_id" class="display">
		<thead>
			<tr>
				<th>編號</th>
				<th>藝名</th>
				<th>來自</th>
				<th>表演項目</th>
				<th>分類</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="reSearchSA" varStatus="stat" items="${reBeanList_SA}">
			<tr>
				<td>${reSearchSA.id_SA }</td>
				<td>${reSearchSA.name_SA }</td>
				<td>${reSearchSA.country_SA }</td>
				<td>${reSearchSA.theme_SA }</td>
				<td>${reSearchSA.classification_SA }</td>
				<td>
					<form action="delSearch.ctrl" method="POST">
						<input type="hidden" value="${reSearchSA.id_SA}"  name="id_SA"/>
						<input type="submit" value="刪除" id="button-1"/>
					</form>
					<form action="fixSA.ctrl" method="POST">
						<input type="hidden" value="${reSearchSA.id_SA}"  name="id_SA"/>
						<input type="submit" value="修改" id="button-2"/>
					</form>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>