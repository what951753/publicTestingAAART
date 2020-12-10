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
.rs-symbol-color::after {
	content: "*";
	margin-left: 3px;
	font-weight: 700;
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
		<div class=title>
			<h3 align="center" style="margin-top: 20px;">得藝食堂線上訂位</h3>
		</div>
		<p>加上輪播圖片</p>
		<div class=title>
			<h4 align="center" style="margin-top: 20px;">請填寫聯絡資訊</h4>
		</div>
		<br>
		<div class=content>
			<form method="post"
				action="<c:url value = "/03/front/reservation/createReservation.ctrl"/>">
				<table id="03A" class="display table table-hover table-blue">
					<thead>
						<!-- 							<tr> -->
						<!-- 								<th></th> -->
						<!-- 								<th></th> -->
						<!-- 							</tr> -->
					</thead>
					<tfoot></tfoot>
					<tbody>
						<tr>
							<td
								style="font-size: larger; font-weight: bold; background-color: #FAD689;"><div
									class="rs-symbol-color">訂位人姓名</div></td>
						</tr>
						<tr>
							<td><input type="text" name="customerName"
								required="required" placeholder="請輸入姓名"></td>
						</tr>
						<!-- # ================== -->
						<tr>
							<td
								style="font-size: larger; font-weight: bold; background-color: #A5DEE4">
								<div class="rs-symbol-color">訂位人稱呼</div>
							</td>
						</tr>
						<tr>
							<td><div class="primary-radio">
									<input type="radio" name="gender" value="1" checked> <label>先生</label>
									<input type="radio" name="gender" value="0"> <label>小姐</label>
									<input type="radio" name="gender" value="2"> <label>其他</label>
								</div></td>
						</tr>
						<!-- # ================== -->
						<tr>
							<td
								style="font-size: larger; font-weight: bold; background-color: #F596AA">
								<div class="rs-symbol-color">連絡電話</div>
							</td>
						</tr>
						<tr>
							<td><input type="text" name="customerPhone"
								required="required" placeholder="請輸入手機號碼"></td>
						</tr>
						<!-- # ================== -->
						<tr>
							<td
								style="font-size: larger; font-weight: bold; background-color: #DAC9A6">
								<div>Email</div>
							</td>
						</tr>
						<tr>
							<td><input type="text" name="customerPhone"
								required="required" placeholder="請輸入 Email"></td>
						</tr>
						<!-- # ================== -->
						<tr>
							<td
								style="font-size: larger; font-weight: bold; background-color: #A5DEE4">
								<div>用餐目的</div>
						</tr>
						<tr>
							<td><div class="primary-radio">
									<input type="radio" name="purpose" value="1" checked> <label>不填寫</label>
								</div></td>
							<td><div class="primary-radio">
									<input type="radio" name="purpose" value="2"> <label>約會</label>
								</div></td>
							<td><div class="primary-radio">
									<input type="radio" name="purpose" value="3"> <label>慶生</label>
								</div></td>
						</tr>
						<tr>
							<td><div class="primary-radio">
									<input type="radio" name="purpose" value="4"> <label>家庭聚餐</label>
								</div></td>
							<td><div class="primary-radio">
									<input type="radio" name="purpose" value="5"> <label>朋友聚餐</label>
								</div></td>
							<td><div class="primary-radio">
									<input type="radio" name="purpose" value="6"> <label>商務聚餐</label>
								</div></td>
						</tr>
						<!-- # ================== -->
						<tr>
							<td
								style="font-size: larger; font-weight: bold; background-color: #A5DEE4">
								<div>備註</div>
						</tr>
						<tr>
							<td><textarea name="note"
									placeholder="有任何特殊要求嗎?（例如兒童座椅、食物過敏或長者行動不便) 這些都可以告訴我們）"> </textarea></td>
						</tr>
						<!-- # ================== -->
				</table>
				<!-- ====================================================== -->
				<br>
				<div class="submitButton" align="center" style="font-size: larger">
					<input type="submit" name="submit" value="完成訂位">
				</div>
				<br>
			</form>
			<div align="center" style="font-size: larger">${reservationCreateMsg}</div>
		</div>
	</div>
</body>
<!-- ====================================================== -->
<script>
	$(document).ready(function() {
		$('#03A').DataTable({});
	});
</script>