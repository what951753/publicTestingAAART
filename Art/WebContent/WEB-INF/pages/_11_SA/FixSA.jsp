<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$(document).ready( function () {
    $('#table_11').DataTable();
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
	<table id="table_11" class="display">
		<thead>
			<tr>
				<th>欲修改欄位</th>
			</tr>
		</thead>
		
		<tbody>
			<tr class="title">
				<th class="column1">編號</th>
				<th class="column2">藝名</th>
				<th class="column3">來自</th>
				<th class="column4">表演項目</th>
				<th class="column5">分類</th>
			</tr>
			<c:forEach var="reFixSA" varStatus="stat" items="${WantToFix}">
			<tr>
				<td class="column1">${reFixSA.id_SA }</td>
				<td class="column2">${reFixSA.name_SA }</td>
				<td class="column3">${reFixSA.country_SA }</td>
				<td class="column4">${reFixSA.theme_SA }</td>
				<td class="column5">${reFixSA.classification_SA }</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<table id="table_11" class="display">
		<thead>
			<tr>
				<th>改成……</th>
			</tr>
		</thead>
		
		<tbody>
			<tr>
				<th>編號</th>
				<th>藝名</th>
				<th>來自</th>
				<th>表演項目</th>
				<th>分類</th>
			</tr>
		<form action="fixingSA.ctrl" method="post">
			<tr>
				<c:forEach var="reFixSA" varStatus="stat" items="${WantToFix}">
					<td>${reFixSA.id_SA }
						<input type="hidden" value="${reFixSA.id_SA }" name="ID_SA">
					</td>
				</c:forEach>
					<td><input type="text" name="NAME_SA" ></td>
					<td><input type="text" name="COUNTRY_SA" ></td>
					<td><input type="text" name="THEME_SA" ></td>
					<td><input type="text" name="CLASSIFICATION_SA" ></td>
			</tr>
			<tr>
				<td colspan="5" align="center"><input type="submit" name="submit" value="確認修改">
			</tr>
		</form>
		</tbody>
	</table>
</html>