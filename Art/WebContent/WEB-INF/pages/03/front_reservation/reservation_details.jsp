<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my reservation</title>
<style>
/* p, div { */

/* } */
</style>

</head>
<body>

	<!-- start banner Area -->
	<section class="banner-area relative" id="home">
		<div class="overlay overlay-bg"></div>
		<div class="container">
			<div class="row d-flex align-items-center justify-content-center">
				<div class="about-content col-lg-12">
					<h1 class="text-white">AAART Shop</h1>
					<p class="text-white link-nav">
						<a href="index.html">首頁 </a> <span class="lnr lnr-arrow-right"></span>
						<a href="<c:url value='/14/shopListController.ctrl' />"> Shop</a>
					</p>
				</div>
			</div>
		</div>
	</section>
	<!-- End banner Area -->
	
	<div class="container">
		<br>
		<div class=title>
			<h3 align="center" style="margin-top: 20px;">預約資訊</h3>
		</div>
		<br>
		<div class="back" align="right">
			<form action="<c:url value='/index.html'/> " method="get">
				<div class="submitButton">
					<input type="submit" class="" name="submit" value="返回 會員專區">
				</div>
			</form>
		</div>
		<br>
		<div class=content>
			<table id="03"
				class="display table table-bordered table-hover table-blue">
				<thead></thead>
				<tbody>
					<c:if test="${reservation != null}">
						<tr>
							<td>訂位編號:</td>
							<td>${reservation.reservationNo}</td>
							<td></td>
						</tr>
						<tr>
							<td>會員帳號:</td>
							<td>${reservation.memberId}</td>
							<td></td>
						</tr>
						<tr>
							<td>會員姓名:</td>
							<td>${reservation.memberName}</td>
							<td></td>
						</tr>
						<tr>
							<td>商店代號:</td>
							<td>${reservation.shopId}</td>
							<td style="width: 200px;"></td>
						</tr>
						<tr>
							<td>商店名稱:</td>
							<td>${reservation.shopName}</td>
							<td></td>
						</tr>
						<!-- 	====================================================== -->
						<tr>
							<td>預約人姓名:</td>
							<td>${reservation.customerName}</td>
							<td></td>
						</tr>
						<tr>
							<td>預約人電話:</td>
							<td>${reservation.customerPhone}</td>
							<td></td>
						</tr>
						<tr>
							<td>人數:</td>
							<td>${reservation.amount}</td>
							<td></td>
						</tr>
						<!-- 	====================================================== -->
						<tr>
							<td>預約日期:</td>
							<td>${reservation.dateTime}</td>
							<td></td>
						</tr>
						<tr>
							<td>開始時間:</td>
							<td>${reservation.startTime}</td>
							<td></td>
						</tr>
						<tr>
							<td>結束時間:</td>
							<td>${reservation.endTime}</td>
							<td></td>
						</tr>
						<tr>
							<td>附註:</td>
							<%-- <td><textarea readonly style="width: 400px; height: 70px;">${reservation.note}</textarea></td> --%>
							<td>${reservation.note}</td>
							<td></td>
						</tr>
						<!-- ====================================================== -->
					</c:if>
				</tbody>
			</table>
			<br>
			<c:if test="${reservationCheckMsg != null}">
				<div align="center" style="font-size: larger">${reservationCheckMsg}</div>
			</c:if>
		</div>
	</div>
</body>
<!-- ====================================================== -->
<script>
	$(document).ready(function() {
		$('#03').DataTable({});
	});
</script>