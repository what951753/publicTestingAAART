<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NEW Street Artist</title>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>
</head>
<div>
	<span> 
		<a href="GoCreate.ctrl">新增</a>&nbsp;&nbsp; 
		<a href="GoDel.ctrl">刪除</a>&nbsp;&nbsp;
		<a href="GoSearch.ctrl">查詢</a>&nbsp;&nbsp; 
		<a href="myStreetArtistPage.ctrl">總覽</a>
	</span>
</div>
<form action="createSA.ctrl" method="post">
<table>
	<thead>
		<tr>
			<th>新增藝人</th>
		</tr>
	</thead>
	
	<tbody>
		<tr>
			<td>姓名：<input type="text" name="NAME_SA" >${errors.name }<br/></td>
		</tr>
		<tr>
			<td>來自：<input type="text" name="COUNTRY_SA" >${errors.country }<br/></td>
		</tr>
		<tr>
			<td>主題：<input type="text" name="THEME_SA" >${srrors.theme }<br/></td>
		</tr>
		<tr>
			<td>分類：<input type="text" name="CLASSIFICATION_SA" >${errors.classification }<br/></td>
		</tr>
		<tr>
			<td align="center"><input type="submit" name="submit" value="送出">
		</tr>
	</tbody>
</table>
</form>
</html>