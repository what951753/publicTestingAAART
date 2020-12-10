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
						<a
							href="<c:url value='/03/front/reservation/myReservation.ctrl' />">
							食堂訂位</a>
					</p>
				</div>
			</div>
		</div>
	</section>
	<!-- End banner Area -->

	<div class="container">
		<br>
		<div class=title>
			<h3 align="center" style="margin-top: 20px;">得藝食堂訂位紀錄</h3>
		</div>
		<div class=content>
			<div class="card-body">
				<div class="table-responsive">
					<table id="03"
						class="display table table-bordered table-hover table-info">
						<thead>
							<tr class="head">
								<th scope="col">訂位人姓名</th>
								<th scope="col">連絡電話</th>
								<th scope="col">訂位日期</th>
								<th scope="col">用餐時間</th>
								<th scope="col">大人人數</th>
								<!-- ===================== -->
								<th scope="col">小孩人數</th>
								<th scope="col">功能</th>
							</tr>
						</thead>
						<tfoot>
						</tfoot>
						<tbody>
							<c:if test="${reservationList != null}">
								<c:forEach items="${reservationList}" var="reservationList"
									varStatus="vs">
									<tr>
										<td>${reservationList.customerName}</td>
										<td>${reservationList.customerPhone}</td>
										<td>${reservationList.dateTime}</td>
										<td>${reservationList.time}</td>
										<td>${reservationList.adultsNum}</td>
										<!-- ======================= -->
										<td>${reservationList.childrenNum}</td>
										<td>
											<form method="post"
												action="<c:url value="/03/front/reservation/updateReservationByNo.ctrl"/>">
												<button name="updateButton" type="submit"
													value="${reservationList.reservationNo}">修改聯絡資訊</button>
												<Input type="hidden" name="reservationNo"
													value="${reservationList.reservationNo}">
											</form>
											<form method="post"
												action="<c:url value="/03/front/reservation/updateReservationByNo.ctrl"/>">
												<button name="updateButton" type="submit"
													value="${reservationList.reservationNo}">修改人數</button>
												<Input type="hidden" name="reservationNo"
													value="${reservationList.reservationNo}">
											</form>
											<form method="post"
												action="<c:url value="/03/front/reservation/deleteReservation.ctrl"/>">
												<button name="deleteButton" type="submit"
													value="${reservationList.reservationNo}">刪除訂位</button>
												<Input type="hidden" name="reservationNo"
													value="${reservationList.reservationNo}">
											</form>
										</td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
					<br>
					<c:if test="${reservationSerachMsg != null}">
						<div align="center" style="font-size: larger">${reservationSerachMsg}</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</body>
<!-- ====================================================== -->
<script>
	$(document).ready(function() {
		$('#03').DataTable({});
	});
</script>