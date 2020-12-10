<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container">
	<br>
	<div class=title>
		<h3 align="center" style="margin-top: 20px;">刪除商店預約</h3>
	</div>
	<div class="back" align="right">
		<form action="<c:url value='/03/cms/reservation/index'/> "
			method="get">
			<div class="submitButton">
				<input type="submit" class="" name="submit" value="返回 商店預約管理">
			</div>
		</form>
	</div>
	<br>
	<div class=content>
		<form method="post"
			action="<c:url value="/03/cms/reservation/deleteReservationByNo.ctrl"/>">
			<table id="03A"
				class="display table table-bordered table-hover table-blue">
				<thead>
					<tr>
						<th>預約編號查詢</th>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" placeholder="請輸入預約編號 "
							name="reservationNo"></td>
						<td></td>
					</tr>
				</tbody>
			</table>
		</form>
		<br>
		<form method="post"
			action="<c:url value="/03/cms/reservation/deleteReservationByMemberName.ctrl"/>">
			<table id="03B"
				class="display table table-bordered table-hover table-blue">
				<thead>
					<tr>
						<th>會員姓名查詢</th>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" placeholder="請輸入會員姓名"
							name="memberName"></td>
						<td></td>
					</tr>
				</tbody>
			</table>
		</form>
		<br>
		<form method="post"
			action="<c:url value="/03/cms/reservation/deleteReservationByShopName.ctrl"/>">
			<table id="03C"
				class="display table table-bordered table-hover table-blue">
				<thead>
					<tr>
						<th>店名查詢</th>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" placeholder="請輸入商店名稱 " name="shopName"></td>
						<td></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</div>
<!-- ====================================================== -->
<script>
	$(document).ready(function() {
		$('#03A').DataTable({});
		$('#03B').DataTable({});
		$('#03C').DataTable({});
	});
</script>