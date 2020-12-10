<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container">
	<br>
	<div class=title>
		<h3 align="center" style="margin-top: 20px;">查詢商店預約</h3>
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
		<table id="03"
			class="display table table-bordered table-hover table-blue">
			<thead></thead>
			<tbody>
				<tr class="head">
					<th scope="col">預約編號</th>
					<th scope="col">會員帳號</th>
					<th scope="col">會員姓名</th>
					<th scope="col">預約日期</th>
					<th scope="col">商店名稱</th>
					<!-- ===================== -->
					<th scope="col">預約人姓名</th>
					<th scope="col">人數</th>
					<th scope="col">詳細資訊</th>
					<th scope="col">修改</th>
					<th scope="col">刪除</th>
				</tr>
				<c:if test="${reservationList != null}">
					<c:forEach items="${reservationList}" var="reservationList" varStatus="vs">
						<tr>
							<td>${reservationList.reservationNo}</td>
							<td>${reservationList.memberId}</td>
							<td>${reservationList.memberName}</td>
							<td>${reservationList.dateTime}</td>
							<td>${reservationList.shopName}</td>
							<!-- ======================= -->
							<td>${reservationList.customerName}</td>
							<td>${reservationList.amount}</td>
							<td>
								<form method="post"
									action="<c:url value="/03/cms/reservation/checkReservationDetails.ctrl"/>">
									<button name="checkButton" type="submit"
										value="${reservationList.reservationNo}">詳細資訊</button>
									<Input type="hidden" name="reservationNo"
										value="${reservationList.reservationNo}">
								</form>
							</td>
							<td>
								<form method="post"
									action="<c:url value="/03/cms/reservation/updateReservationByNo.ctrl"/>">
									<button name="updateButton" type="submit"
										value="${reservationList.reservationNo}">修改</button>
									<Input type="hidden" name="reservationNo"
										value="${reservationList.reservationNo}">
								</form>
							</td>
							<td>
								<form method="post"
									action="<c:url value="/03/cms/reservation/deleteReservationByNo.ctrl"/>">
									<button name="deleteButton" type="submit"
										value="${reservationList.reservationNo}">刪除</button>
									<Input type="hidden" name="reservationNo"
										value="${reservationList.reservationNo}">
								</form>
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
			<tfoot>
			</tfoot>
		</table>
		<br>
		<c:if test="${reservationSerachMsg != null}">
			<div align="center" style="font-size: larger">${reservationSerachMsg}</div>
		</c:if>
	</div>
</div>
<!-- ====================================================== -->
<script>
	$(document).ready(function() {
		$('#03').DataTable({});
	});
</script>