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

.custom-button{
    display: inline-block;
    outline: none;
    line-height: 40px;
    padding: 0 10px;
    text-align: center;
    text-decoration: none;
    font-weight:bold;
    cursor: pointer;
    border-radius: 5px;
    font-size: larger;
}


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
							href="<c:url value='/03/front/reservation/chooseNumberAndDate' />">
							食堂訂位</a>
					</p>
				</div>
			</div>
		</div>
	</section>
	<!-- End banner Area -->
	<div class="container">
		<br>
		<c:if test="${empty reservationCreateMsg}">
			<div class=title>
				<h3 align="center" style="margin-top: 20px;">得藝食堂線上訂位</h3>
			</div>
			<p>加上輪播圖片</p>
			<div class=title>
				<h4 align="center" style="margin-top: 20px;">請選擇用餐時段</h4>
			</div>
			<br>
			<div class=content>
				<table id="03A" class="display table table-bordered table-hover table-blue">
					<thead>
						<tr class="head">
							<th scope="col">
								<div class="custom-button" style="background-color: #FAD689">用餐人數</div>
							</th>
							<th scope="col" style="font-size: larger;">${amount}位</th>
							<!-- #================= -->
							<th scope="col">
								<div class="custom-button" style="background-color: #A5DEE4">用餐日期</div>
							</th>
							<th scope="col" style="font-size: larger;">${dateTime}</th>
							<!-- #================= -->
							<th scope="col">
								<div class="custom-button" style="background-color: #F596AA">用餐時段</div>
							</th>
							<!-- #================= -->
							<th scope="col" style="font-size: larger;"><span id="moment">尚未選擇</span><span id="result"></span></th>
						</tr>
					</thead>
					<tbody></tbody>
					<tfoot></tfoot>
				</table>
				<br>
				<form method="post"
					action="<c:url value = "/03/front/reservation/createReservationConfirm.ctrl"/>">
					<table id="03B"
						class="display table table-bordered table-hover table-blue">
						<thead>
							<tr class="head">
								<th scope="col" colspan="5" align="center">用餐時段</th>
							</tr>
						</thead>
						<tfoot></tfoot>
						<tbody>
							<tr>
								<td><c:if test="${H09 != null}">
										<button value="09:00" class="genric-btn primary radius"
											onclick="inputTime()">
											<span>9:00</span><br> <span>剩餘座位數${H09}</span>
										</button>
									</c:if> <c:if test="${H09Full != null}">
										<button class="genric-btn primary-border radius">
											<span>9:00</span><br> <span>${H09Full}</span>
										</button>
									</c:if> <c:if test="${H09Over != null}">
										<button class="genric-btn primary-border radius">
											<span>9:00</span><br> <span>${H09Over}</span>
										</button>
									</c:if> <!-- ====================================================== -->
									<c:if test="${H10 != null}">
										<button value="10:00" class="genric-btn primary radius"
											onclick="inputTime()">
											<span>10:00</span><br> <span>剩餘座位數${H10}</span>
										</button>
									</c:if> <c:if test="${H10Full != null}">
										<button class="genric-btn primary-border radius">
											<span>10:00</span><br> <span>${H10Full}</span>
										</button>
									</c:if> <c:if test="${H10Over != null}">
										<button class="genric-btn primary-border radius">
											<span>10:00</span><br> <span>${H10Over}</span>
										</button>
									</c:if> <!-- ====================================================== -->
									<c:if test="${H11 != null}">
										<button value="11:00" class="genric-btn primary radius"
											onclick="inputTime()">
											<span>11:00</span><br> <span>剩餘座位數${H11}</span>
										</button>
									</c:if> <c:if test="${H11Full != null}">
										<button class="genric-btn primary-border radius">
											<span>11:00</span><br> <span>${H11Full}</span>
										</button>
									</c:if> <c:if test="${H11Over != null}">
										<button class="genric-btn primary-border radius">
											<span>11:00</span><br> <span>${H11Over}</span>
										</button>
									</c:if> <!-- ====================================================== -->
									<c:if test="${H12 != null}">
										<button value="12:00" class="genric-btn primary radius"
											onclick="inputTime()">
											<span>12:00</span><br> <span>剩餘座位數${H12}</span>
										</button>
									</c:if> <c:if test="${H12Full != null}">
										<button class="genric-btn primary-border radius">
											<span>12:00</span><br> <span>${H12Full}</span>
										</button>
									</c:if> <c:if test="${H12Over != null}">
										<button class="genric-btn primary-border radius">
											<span>12:00</span><br> <span>${H12Over}</span>
										</button>
									</c:if> <!-- ====================================================== -->
									<c:if test="${H13 != null}">
										<button value="13:00" class="genric-btn primary radius"
											onclick="inputTime()">
											<span>13:00</span><br> <span>剩餘座位數${H13}</span>
										</button>
									</c:if> <c:if test="${H13Full != null}">
										<button class="genric-btn primary-border radius">
											<span>13:00</span><br> <span>${H13Full}</span>
										</button>
									</c:if> <c:if test="${H13Over != null}">
										<button class="genric-btn primary-border radius">
											<span>13:00</span><br> <span>${H13Over}</span>
										</button>
									</c:if></td>
							</tr>
							<!-- ====================================================== -->
							<tr>
								<td><c:if test="${H14 != null}">
										<button value="14:00" class="genric-btn primary radius"
											onclick="inputTime()">
											<span>14:00</span><br> <span>剩餘座位數${H14}</span>
										</button>
									</c:if> <c:if test="${H14Full != null}">
										<button class="genric-btn primary-border radius">
											<span>14:00</span><br> <span>${H14Full}</span>
										</button>
									</c:if> <c:if test="${H14Over != null}">
										<button class="genric-btn primary-border radius">
											<span>14:00</span><br> <span>${H14Over}</span>
										</button>
									</c:if> <!-- ====================================================== -->
									<c:if test="${H15 != null}">
										<button value="15:00" class="genric-btn primary radius"
											onclick="inputTime()">
											<span>15:00</span><br> <span>剩餘座位數${H15}</span>
										</button>
									</c:if> <c:if test="${H15Full != null}">
										<button class="genric-btn primary-border radius">
											<span>15:00</span><br> <span>${H15Full}</span>
										</button>
									</c:if> <c:if test="${H15Over != null}">
										<button class="genric-btn primary-border radius">
											<span>15:00</span><br> <span>${H15Over}</span>
										</button>
									</c:if> <!-- ====================================================== -->
									<c:if test="${H16 != null}">
										<button value="16:00" class="genric-btn primary radius"
											onclick="inputTime()">
											<span>16:00</span><br> <span>剩餘座位數${H16}</span>
										</button>
									</c:if> <c:if test="${H16Full != null}">
										<button class="genric-btn primary-border radius">
											<span>16:00</span><br> <span>${H16Full}</span>
										</button>
									</c:if> <c:if test="${H16Over != null}">
										<button class="genric-btn primary-border radius">
											<span>16:00</span><br> <span>${H16Over}</span>
										</button>
									</c:if> <!-- ====================================================== -->
									<c:if test="${H17 != null}">
										<button value="17:00" class="genric-btn primary radius"
											onclick="inputTime()">
											<span>17:00</span><br> <span>剩餘座位數${H17}</span>
										</button>
									</c:if> <c:if test="${H17Full != null}">
										<button class="genric-btn primary-border radius">
											<span>17:00</span><br> <span>${H17Full}</span>
										</button>
									</c:if> <c:if test="${H17Over != null}">
										<button class="genric-btn primary-border radius">
											<span>17:00</span><br> <span>${H17Over}</span>
										</button>
									</c:if> <!-- ====================================================== -->
									<c:if test="${H18 != null}">
										<button value="18:00" class="genric-btn primary radius"
											onclick="inputTime()">
											<span>18:00</span><br> <span>剩餘座位數${H18}</span>
										</button>
									</c:if> <c:if test="${H18Full != null}">
										<button class="genric-btn primary-border radius">
											<span>18:00</span><br> <span>${H18Full}</span>
										</button>
									</c:if> <c:if test="${H18Over != null}">
										<button class="genric-btn primary-border radius">
											<span>18:00</span><br> <span>${H18Over}</span>
										</button>
									</c:if></td>
							</tr>
							<!-- ====================================================== -->
							<tr>
								<td><c:if test="${H19 != null}">
										<button value="19:00" class="genric-btn primary radius"
											onclick="inputTime()">
											<span>19:00</span><br> <span>剩餘座位數${H19}</span>
										</button>
									</c:if> <c:if test="${H19Full != null}">
										<button class="genric-btn primary-border radius">
											<span>19:00</span><br> <span>${H19Full}</span>
										</button>
									</c:if> <c:if test="${H19Over != null}">
										<button class="genric-btn primary-border radius">
											<span>19:00</span><br> <span>${H19Over}</span>
										</button>
									</c:if> <!-- ====================================================== -->
									<c:if test="${H20 != null}">
										<button value="20:00" class="genric-btn primary radius"
											onclick="inputTime()">
											<span>20:00</span><br> <span>剩餘座位數${H20}</span>
										</button>
									</c:if> <c:if test="${H20Full != null}">
										<button class="genric-btn primary-border radius">
											<span>20:00</span><br> <span>${H20Full}</span>
										</button>
									</c:if> <c:if test="${H20Over != null}">
										<button class="genric-btn primary-border radius">
											<span>20:00</span><br> <span>${H20Over}</span>
										</button>
									</c:if> <!-- ====================================================== -->
									<c:if test="${H21 != null}">
										<button value="21:00" class="genric-btn primary radius"
											onclick="inputTime()">
											<span>21:00</span><br> <span>剩餘座位數${H21}</span>
										</button>
									</c:if> <c:if test="${H21Full != null}">
										<button class="genric-btn primary-border radius">
											<span>21:00</span><br> <span>${H21Full}</span>
										</button>
									</c:if> <c:if test="${H21Over != null}">
										<button class="genric-btn primary-border radius">
											<span>21:00</span><br> <span>${H21Over}</span>
										</button>
									</c:if> <!-- ====================================================== -->
								</td>
							</tr>
						</tbody>
					</table>
					<!-- ====================================================== -->
					<br>
<!-- 					<table id="03C" -->
<!-- 						class="display table table-bordered table-hover table-blue"> -->
<!-- 						<thead> -->
<!-- 							<tr class="head"> -->
<!-- 								<th scope="col" align="center">當日非營業時段</th> -->
<!-- 							</tr> -->
<!-- 						</thead> -->
<!-- 						<tfoot></tfoot> -->
<!-- 						<tbody> -->
<!-- 							<tr> -->
<%-- 								<td><c:if test="${H09Close != null}"> --%>
<!-- 										<button class="genric-btn danger-border radius"> -->
<%-- 											<span>09:00</span><br> <span>${H09Close}</span> --%>
<!-- 										</button> -->
<%-- 									</c:if> <!-- ====================================================== --> --%>
<%-- 									<c:if test="${H10Close != null}"> --%>
<!-- 										<button class="genric-btn danger-border radius"> -->
<%-- 											<span>10:00</span><br> <span>${H10Close}</span> --%>
<!-- 										</button> -->
<%-- 									</c:if> <!-- ====================================================== --> --%>
<%-- 									<c:if test="${H11Close != null}"> --%>
<!-- 										<button class="genric-btn danger-border radius"> -->
<%-- 											<span>11:00</span><br> <span>${H11Close}</span> --%>
<!-- 										</button> -->
<%-- 									</c:if> <!-- ====================================================== --> --%>
<%-- 									<c:if test="${H12Close != null}"> --%>
<!-- 										<button class="genric-btn danger-border radius"> -->
<%-- 											<span>12:00</span><br> <span>${H12Close}</span> --%>
<!-- 										</button> -->
<%-- 									</c:if> <!-- ====================================================== --> --%>
<%-- 									<c:if test="${H13Close != null}"> --%>
<!-- 										<button class="genric-btn danger-border radius"> -->
<%-- 											<span>13:00</span><br> <span>${H13Close}</span> --%>
<!-- 										</button> -->
<%-- 									</c:if> <!-- ====================================================== --> --%>
<%-- 									<c:if test="${H14Close != null}"> --%>
<!-- 										<button class="genric-btn danger-border radius"> -->
<%-- 											<span>14:00</span><br> <span>${H14Close}</span> --%>
<!-- 										</button> -->
<%-- 									</c:if> <!-- ====================================================== --> --%>
<%-- 									<c:if test="${H15Close != null}"> --%>
<!-- 										<button class="genric-btn danger-border radius"> -->
<%-- 											<span>15:00</span><br> <span>${H15Close}</span> --%>
<!-- 										</button> -->
<%-- 									</c:if> <!-- ====================================================== --> --%>
<%-- 									<c:if test="${H16Close != null}"> --%>
<!-- 										<button class="genric-btn danger-border radius"> -->
<%-- 											<span>16:00</span><br> <span>${H16Close}</span> --%>
<!-- 										</button> -->
<%-- 									</c:if> <!-- ====================================================== --> --%>
<%-- 									<c:if test="${H17Close != null}"> --%>
<!-- 										<button class="genric-btn danger-border radius"> -->
<%-- 											<span>17:00</span><br> <span>${H17Close}</span> --%>
<!-- 										</button> -->
<%-- 									</c:if> <!-- ====================================================== --> --%>
<%-- 									<c:if test="${H18Close != null}"> --%>
<!-- 										<button class="genric-btn danger-border radius"> -->
<%-- 											<span>18:00</span><br> <span>${H18Close}</span> --%>
<!-- 										</button> -->
<%-- 									</c:if> <!-- ====================================================== --> --%>
<%-- 									<c:if test="${H19Close != null}"> --%>
<!-- 										<button class="genric-btn danger-border radius"> -->
<%-- 											<span>19:00</span><br> <span>${H19Close}</span> --%>
<!-- 										</button> -->
<%-- 									</c:if> <!-- ====================================================== --> --%>
<%-- 									<c:if test="${H20Close != null}"> --%>
<!-- 										<button class="genric-btn danger-border radius"> -->
<%-- 											<span>20:00</span><br> <span>${H20Close}</span> --%>
<!-- 										</button> -->
<%-- 									</c:if> <!-- ====================================================== --> --%>
<%-- 									<c:if test="${H21lose != null}"> --%>
<!-- 										<button class="genric-btn danger-border radius"> -->
<%-- 											<span>21:00</span><br> <span>${H21Close}</span> --%>
<!-- 										</button> -->
<%-- 									</c:if> <!-- ====================================================== --> --%>
<!-- 								</td> -->
<!-- 							</tr> -->
<!-- 						</tbody> -->
<!-- 					</table> -->
					<div style="display: none">
						<input type="hidden" name="adultsNum" value="${adultsNum}">
						<input type="hidden" name="childrenNum" value="${childrenNum}">
						<input type="hidden" name="dateTime" value="${dateTime}">
						<input type="hidden" name="amount" value="${amount}">
						<input type="hidden" name="year" value="${restaurant.year}">
						<input type="hidden" name="month" value="${restaurant.month}">
						<input type="hidden" name="day" value="${restaurant.day}">
					</div>
					<div style="display: none">
						<input type="hidden" id="gainTime" name="time" value="">
					</div>
					<br>
					<div class="submitButton" align="center" style="font-size: larger">
						<input type="submit" name="submit" value="下一步，填寫聯絡資訊">
					</div>
					<br>
				</form>
			</div>
		</c:if>
	</div>
	<c:if test="${not empty reservationCreateMsg}">
		<div class=title>
			<h3 align="center" style="margin-top: 20px;">${reservationCreateMsg}</h3>
		</div>
	</c:if>
</body>
<!-- ====================================================== -->
<script>
	$(document).ready(function() {
		$('#03A').DataTable({});
		$('#03B').DataTable({});
		$('#03C').DataTable({});
	});

	$(".genric-btn primary radius").click(function(){
		$("#moment").remove();
		$("#result").text($(this).val());
		$("#gainTime").val(value);
	});
	
</script>