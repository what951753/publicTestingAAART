<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container">
	<br>
	<div class=title>
		<h3 align="center" style="margin-top: 20px;">新增商店預約</h3>
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
			action="<c:url value = "/03/cms/reservation/createReservationConfirm.ctrl"/>">
			<table id="03"
				class="display table table-bordered table-hover table-blue">
				<thead></thead>
				<tbody>
					<tr style="display: none">
						<td>會員帳號:</td>
						<td><input type="hidden" name="memberId" value="${memberId}">${memberId}</td>
						<td></td>
					</tr>
					<tr style="display: none">
						<td>會員姓名:</td>
						<td><input type="hidden" name="memberName"
							value="${memberName}">${memberName}</td>
						<td></td>
					</tr>
					<tr style="display: none">
						<td>商店代號:</td>
						<td><input type="hidden" name="shopId" value="${shopId}">${shopId}</td>
						<td style="width: 200px;"></td>
					</tr>
					<tr>
						<td>商店名稱:</td>
						<td><input type="hidden" name="shopName" value="${shopName}">${shopName}</td>
						<td></td>
					</tr>
					<tr>
						<td>商店簡介:</td>
						<td><input type="hidden" name="shopName" value="${intro}">${intro}</td>
						<td></td>
					</tr>
				</tbody>
			</table>
			<br>
			<!-- ====================================================== -->
			<table>
				<thead></thead>
				<tbody>
					<tr>
						<td>預約日期:</td>
						<td><input type="date" name="dateTime" id="dateTime"
							value="2020-12-25" min="2020-12-25" max="2020-1-24"
							required="required"></td>
						<td></td>
					</tr>
				</tbody>
			</table>
			<br>
			<div class="submitButton" align="center" style="font-size: larger">
				<input type="submit" name="submit" value="下一步">
			</div>
			<br>
		</form>
	</div>
</div>
<!-- ====================================================== -->
<script>
	$(document).ready(function() {
		$('#03').DataTable({});
	});
</script>